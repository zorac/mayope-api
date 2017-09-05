package Mayope::Make::Java::Builder;

use strict;
use base qw( Mayope::Make::ClassBuilder );

use Mayope::Make::Java::Class;

sub new {
    my ($this, $api, $basedir) = @_;
    my $self = $this->SUPER::new($api, $basedir, 'Java');

    $self->{raw_types} = {
        Boolean => [ 'boolean' ],
        String  => [ 'String' ],
        UUID    => [ 'UUID', 'java.util' ],
        List    => [ 'List', 'java.util' ],
        Map     => [ 'Map', 'java.util' ],
    };

    return($self);
}

1;
