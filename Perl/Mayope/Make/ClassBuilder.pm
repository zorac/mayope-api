package Mayope::Make::ClassBuilder;

use strict;
use base qw( Mayope::Make::Builder );

use Mayope::Make::Model::Method;
use Mayope::Make::Model::Param;
use Mayope::Make::Model::Type;

sub new {
    my ($this, $api, $basedir, $lang) = @_;
    my $self = $this->SUPER::new($api, $basedir);

    $self->{lang} = $lang;
    $self->{raw_types} = { };
    $self->{required_packages} = [ ];

    return($self);
}

sub build {
    my ($self) = @_;
    my $basedir = $self->{basedir};
    my $lang = $self->{lang};
    my $class_class = 'Mayope::Make::' . $lang . '::Class';
    my $raw_types = $self->{raw_types};

    foreach my $type ($self->types) {
        my $raw = $raw_types->{$type->id};

        if ($raw) {
            $type->class($lang, $raw->[0]);
            $type->package($lang, $raw->[1]) if ($#{$raw});
        } else {
            my $class = $class_class->new($basedir, $type);

            $class->subpackage('Types');
            $type->class($lang, $class->id);
            $type->package($lang, $class->package);

            if ($type->enum) {
                $class->add_value($type->values);
            } else {
                $self->add_params($class, $type);
            }

            $class->build;
        }
    }

    foreach my $message ($self->messages) {
        my $id = $message->id;
        my $class = $class_class->new($basedir, $message);

        if ($id =~ /Request$/) {
            $class->subpackage('Requests');
        } elsif ($id =~ /Response$/) {
            $class->subpackage('Responses');
        }

        $message->class($lang, $class->id);
        $message->package($lang, $class->package);
        $self->add_params($class, $message);
        $class->build;
    }

    my $apiclass = $class_class->new($basedir, Mayope::Make::Model::Type->new(
        id => 'Api',
        abstraction => 2,
        comment => 'The Mayope API.'
    ));

    foreach my $action ($self->actions) {
        $apiclass->add_include($action->request->package($lang),
            $action->response->package($lang));
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
    my $lang = $self->{lang};
    my @required_packages = @{$self->{required_packages}};

    foreach my $param ($type->params) {
        $class->add_include(@required_packages) if ($param->required);
        $class->add_include($param->packages($lang));
        $class->add_field($param);
    }
}

1;
