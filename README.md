# NAME

App::Goto - Utility for accessing remote servers via SSH

# SYNOPSIS

    use App::Goto;

    my $goto = App::Goto->({ config => $config, args => $args });

    system( $goto->cmd );

# DESCRIPTION

App::Goto is designed to make it as easy as possible to access remote servers
via SSH, allowing you to give the shortest possible unique string needed to
identify the server, and optionally to specify what command to run upon login -
such as changing to a frequently-used directory for you.

Requires a hashref of config details that define hosts & commands;
and an arrayref of arguments to define the specific host & command to use.

# METHODS

## is\_success

Boolean, returns true if the passed-in arguments were correctly parsed.
Otherwise false.

## error

If is\_success is false, this should give a useful reason why.

## cmd

Returns the command string calculated based on the passed-in args & config

## nick

Returns the calculated nickname from the possibly-ambiguous supplied argument.

## host

Returns the actual hostname for the supplied nickname.

# AUTHOR

Dominic Humphries <dominic@oneandoneis2.com>

# COPYRIGHT

Copyright 2013- Dominic Humphries

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO
