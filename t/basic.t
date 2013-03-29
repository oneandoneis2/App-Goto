use strict;
use Test::More;
use App::Goto;
use Config::Tiny;

# Setup a default config
my $config = bless( {
        'hosts' => {
            'localhost' => '127.0.0.1',
            'lozzzzzzz' => 'Z'
            },
        'commands' => {
            'log' => '\'cd /var/log/ && bash\''
            }
        }, 'Config::Tiny' );

CREATE: {
    my $goto = App::Goto->new({ config => $config, args => [qw/lo/] });
    is(ref $goto, 'App::Goto', 'Got a valid object');
    };

GET_RIGHT_AMBIGUOUS_HOSTNAME: {
    my $goto = App::Goto->new({ config => $config, args => [qw/lo/] });
    ok($goto->cmd() =~ m#127\.0\.0\.1#, 'Got the right ambiguous server');
    };

GET_RIGHT_NONAMBIGUOUS_HOSTNAME: {
    my $goto = App::Goto->new({ config => $config, args => [qw/loz/] });
    ok($goto->cmd() =~ m#Z#, 'Got the right non-ambiguous server');
    };

GET_RIGHT_COMMAND: {
    my $goto = App::Goto->new({ config => $config, args => [qw/lo log/] });
    ok($goto->cmd() =~ m#var/log#, 'Got the right command');
    };

GET_RIGHT_COMMAND: {
    my $goto = App::Goto->new({ config => $config, args => [qw/lo log/] });
    is($goto->cmd(), "ssh 127.0.0.1 -t 'cd /var/log/ && bash'", 'Everything looks good');
    };

done_testing;
