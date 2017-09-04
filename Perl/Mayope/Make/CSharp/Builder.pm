package Mayope::Make::CSharp::Builder;

use strict;

use Mayope::Make::CSharp::Class;

use base qw( Mayope::Make::Builder );
use constant TYPES => {
    Boolean => [ 'bool' ],
    String  => [ 'string' ],
    UUID    => [ 'Guid', 'System' ],
    List    => [ 'IList', 'System.Collections.Generic' ],
    Map     => [ 'IDictionary', 'System.Collections.Generic' ],
};

sub build {
    my ($self) = @_;
    my $basedir = $self->{basedir};

    foreach my $type ($self->types) {
        my $system = TYPES->{$type->id};

        if ($system) {
            $type->class('CSharp', $system->[0]);
            $type->package('CSharp', $system->[1]) if ($#{$system});
        } else {
            $type->class('CSharp', $type->id);
            # TODO package?
        }
    }

    foreach my $message ($self->messages) {
        my $id = $message->id;
        my $class = Mayope::Make::CSharp::Class->new($basedir, $message);

        if ($id =~ /Request$/) {
            $class->subpackage('Requests');
        } elsif ($id =~ /Response$/) {
            $class->subpackage('Responses');
        }

        foreach my $param ($message->params) {
            $class->add_include('System.ComponentModel.DataAnnotations')
                if ($param->required);
            $class->add_include($param->packages('CSharp'));
            $class->add_field($param);
        }

        $class->build;
    }
}

1;
