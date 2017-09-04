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
            my $class = Mayope::Make::CSharp::Class->new($basedir, $type);

            $class->subpackage('Types');
            $type->class('CSharp', $type->id);
            $type->package('CSharp', 'Mayope.Api.Types'); # TODO
            $self->add_params($class, $type);
            $class->build;
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

        $self->add_params($class, $message);
        $class->build;
    }

    my $apiclass = Mayope::Make::CSharp::Class->new($basedir,
         Mayope::Make::Model::Type->new( id => 'Api',
            comment => 'The Mayope API.' ));
    $apiclass->add_include('Mayope.Api.Requests', 'Mayope.Api.Responses');

    foreach my $action ($self->actions) {
        $apiclass->add_method(Mayope::Make::Model::Method->new(
            id => $action->id,
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
        $class->add_include('System.ComponentModel.DataAnnotations')
            if ($param->required);
        $class->add_include($param->packages('CSharp'));
        $class->add_field($param);
    }
}

1;
