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
            my $class = Mayope::Make::Java::Class->new($basedir, $type);

            $class->subpackage('types');
            $type->class('Java', $type->id);
            $type->package('Java', 'org.mayope.api.types'); # TODO
            $self->add_params($class, $type);
            $class->build;
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

        $self->add_params($class, $message);
        $class->build;
    }

    my $apiclass = Mayope::Make::Java::Class->new($basedir,
         Mayope::Make::Model::Type->new( id => 'API',
            comment => 'The Mayope API.' ));
    $apiclass->add_include('org.mayope.api.request',
         'org.mayope.api.response');

    foreach my $action ($self->actions) {
        $apiclass->add_method(Mayope::Make::Model::Method->new(
            id => lcfirst($action->id),
            params => { request => Mayope::Make::Model::Param->new(
                id => 'request',
                type => $action->request
            ) },
            returns => $action->response,
            comment => $action->comment
        ));
    }

    $apiclass->build;
}

sub add_params {
    my ($self, $class, $type) = @_;

    foreach my $param ($type->params) {
        $class->add_include($param->packages('Java'));
        $class->add_field($param);
    }
}

1;
