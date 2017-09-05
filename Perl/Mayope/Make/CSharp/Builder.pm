package Mayope::Make::CSharp::Builder;

use strict;
use base qw( Mayope::Make::ClassBuilder );

use Mayope::Make::CSharp::Class;

sub new {
    my ($this, $api, $basedir) = @_;
    my $self = $this->SUPER::new($api, $basedir, 'CSharp');

    $self->{raw_types} = {
        Boolean => [ 'bool' ],
        String  => [ 'string' ],
        UUID    => [ 'Guid', 'System' ],
        List    => [ 'IList', 'System.Collections.Generic' ],
        Map     => [ 'IDictionary', 'System.Collections.Generic' ],
    };
    $self->{required_packages} = [ 'System.ComponentModel.DataAnnotations' ];

    return($self);
}

1;
