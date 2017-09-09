package Mayope::Make::CSharp::Builder;

use strict;
use base qw( Mayope::Make::ClassBuilder );

use Mayope::Make::CSharp::Class;

sub new {
    my ($this, $config, $api, $basedir) = @_;
    my $self = $this->SUPER::new($config, $api, $basedir, 'CSharp');

    $self->{raw_types} = {
        Boolean => [ 'bool' ],
        String  => [ 'string' ],
        UUID    => [ 'Guid', 'System' ],
        List    => [ 'IList', 'System.Collections.Generic' ],
        Map     => [ 'IDictionary', 'System.Collections.Generic' ],
    };

    if ($self->config('mancmmb')) {
        $self->packages_for('required', 'Microsoft.AspNetCore.Mvc.ModelBinding');
    }

    if ($self->config('nsj')) {
        $self->packages_for('enum', 'Newtonsoft.Json', 'Newtonsoft.Json.Converters');
        $self->packages_for('required', 'Newtonsoft.Json');
    }

    if ($self->config('scmda')) {
        $self->packages_for('required', 'System.ComponentModel.DataAnnotations');
    }

    return($self);
}

1;
