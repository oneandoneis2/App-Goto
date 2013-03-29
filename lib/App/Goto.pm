package App::Goto;

use strict;
use v5.12;
our $VERSION = '0.01';

use Moo;
use Config::Tiny;

has args        => ( is => 'ro', required => 1 );
has config      => ( is => 'ro', required => 1 );
has error       => ( is => 'rw', default => 'Unknown error' );
has is_success  => ( is => 'rw' );
has cmd         => ( is => 'rw' );

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
