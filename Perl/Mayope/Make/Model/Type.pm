package Mayope::Make::Model::Type;

use strict;
use base qw( Mayope::Make::Model::Object );

sub id {
    my ($self) = @_;

    return $self->{id};
}

sub parent {
    my ($self) = @_;

    return $self->{parent};
}

sub generic {
    my ($self) = @_;

    return $self->{generic} ? @{$self->{generic}} : ();
}

sub params {
    my ($self) = @_;

    return $self->{params} ? values($self->{params}) : ();
}

sub comment {
    my ($self) = @_;

    return $self->{comment};
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
