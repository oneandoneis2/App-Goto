package App::Goto;

use strict;
use v5.12;
our $VERSION = '0.01';

use Moo;
use Config::Tiny;

has args        => ( is => 'ro', required => 1 );
has config      => ( is => 'ro', required => 1 );
has error       => ( is => 'rw', default => 'Unknown error' );
has is_success  => ( is => 'rw', default => 1 );
has cmd         => ( is => 'rw' );

sub BUILD {
    my $self = shift;
    my ($server, $command) = @{$self->args};

    my $hostname = $self->_get_host($server);
    return unless $hostname;

    my $remote_command = '';
    if ($command) {
        $remote_command = $self->_get_command($command);
        }

    $self->cmd( "ssh $hostname $remote_command" );
    }

sub _get_host {
    my ($self, $name) = @_;
    # Get known hosts from config
    my $hosts = $self->config->{hosts};
    # Get the first hostname from a sorted list of hosts
    my ($hostname) = grep { $_ =~ m#^$name# } sort keys %{$hosts};
    unless ($hostname) {
        $self->is_success(0);
        $self->error('Cannot find hostname in config') unless $hostname;
        return;
        }
    # Get the right server details for the found hostname
    return $hosts->{$hostname};
    }

sub _get_command {
    my ($self, $cmd) = @_;
    my $commands = $self->config->{commands};
    my $command = $commands->{$cmd};
    unless ($command) {
        $self->is_success(0);
        $self->error('Command not recognised') unless $command;
        return;
        }
    return "-t $command";
    }

1;
__END__

=encoding utf-8

=head1 NAME

App::Goto - Utility for accessing remote servers via SSH

=head1 SYNOPSIS

  use App::Goto;

=head1 DESCRIPTION

App::Goto is designed to make it as easy as possible to access remote servers
via SSH, allowing you to give the shortest possible unique string needed to
identify the server, and optionally to specify what command to run upon login -
such as changing to a frequently-used directory for you.

=head1 AUTHOR

Dominic Humphries E<lt>dominic@oneandoneis2.comE<gt>

=head1 COPYRIGHT

Copyright 2013- Dominic Humphries

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
