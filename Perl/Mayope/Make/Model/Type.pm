package Mayope::Make::Model::Type;

use strict;
use base qw( Mayope::Make::Model::Node );

sub parent {
    my ($self) = @_;

    return $self->{parent};
}

sub abstraction {
    my ($self) = @_;

    return $self->{abstraction} || 0;
}

sub enum {
    return 0;
}

sub generic {
    my ($self) = @_;

    return $self->{generic} ? @{$self->{generic}} : ();
}

sub params {
    my ($self) = @_;

    return $self->{params} ? values($self->{params}) : ();
}

sub class {
    my ($self, $lang, $class) = @_;

    $self->{class} = {} if (!$self->{class});

    if ($class) {
        $self->{class}{$lang} = $class;
    } else {
        return $self->{class}{$lang} || $self->id;
    }
}

sub package {
    my ($self, $lang, $package) = @_;

    $self->{package} = {} if (!$self->{package});

    if ($package) {
        $self->{package}{$lang} = $package;
    } else {
        return $self->{package}{$lang};
    }
}

1;
