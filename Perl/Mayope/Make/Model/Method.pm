package Mayope::Make::Model::Method;

use strict;
use base qw( Mayope::Make::Model::Node );

sub params {
    my ($self) = @_;

    return $self->{params} ? values($self->{params}) : ();
}

sub returns {
    my ($self) = @_;

    return $self->{returns};
}

sub has_body {
    my ($self) = @_;

    return $self->{getter} || $self->{setter};
}

sub getter {
    my ($self) = @_;

    return $self->{getter};
}

sub setter {
    my ($self) = @_;

    return $self->{setter};
}

1;
