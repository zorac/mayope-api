package Mayope::Make::Swift::Builder;

use strict;
use base qw( Mayope::Make::ClassBuilder );

use Mayope::Make::Swift::Class;

sub new {
    my ($this, $config, $api, $basedir) = @_;
    my $self = $this->SUPER::new($config, $api, $basedir, 'Swift');

    $self->{raw_types} = {
        Boolean => [ 'Bool' ],
        String  => [ 'String' ],
        UUID    => [ 'UUID', 'Foundation' ],
        List    => [ 'Array' ],
        Map     => [ 'Dictionary' ],
    };

    return($self);
}

1;
