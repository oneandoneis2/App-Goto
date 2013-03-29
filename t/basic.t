use strict;
use Test::More;
use App::Goto;
use Config::Tiny;

# Setup a default config
my $config = bless( {
        'hosts' => {
            'localhost' => '127.0.0.1'
            },
        'commands' => {
            'log' => '\'cd /var/log/ && bash\''
            }
        }, 'Config::Tiny' );

CREATE: {
    my $goto = App::Goto->new({ config => $config, args => [] });
    is(ref $goto, 'App::Goto', 'Got a valid object');
    }

done_testing;
