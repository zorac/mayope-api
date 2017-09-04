package Mayope::Make::Java::Builder;

use strict;

use Mayope::Make::Java::Class;

use base qw( Mayope::Make::Builder );
use constant TYPES => {
    Boolean => [ 'boolean' ],
    String  => [ 'String' ],
    UUID    => [ 'UUID', 'java.util' ],
    List    => [ 'List', 'java.util' ],
    Map     => [ 'Map', 'java.util' ],
};

sub build {
    my ($self) = @_;
    my $basedir = $self->{basedir};

    foreach my $type ($self->types) {
        my $system = TYPES->{$type->id};

        if ($system) {
            $type->class('Java', $system->[0]);
            $type->package('Java', $system->[1]) if ($#{$system});
        } else {
            $type->class('Java', $type->id);
            # TODO package?
        }
    }

    foreach my $message ($self->messages) {
        my $id = $message->id;
        my $class = Mayope::Make::Java::Class->new($basedir, $message);

        if ($id =~ /Request$/) {
            $class->subpackage('request');
        } elsif ($id =~ /Response$/) {
            $class->subpackage('response');
        }

        foreach my $param ($message->params) {
            $class->add_include($param->packages('Java'));
            $class->add_field($param);
        }

        $class->build;
    }
}

1;
