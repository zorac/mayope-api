package Mayope::Make::Model::Method;

use strict;
use base qw( Mayope::Make::Model::Object );

sub id {
    my ($self) = @_;

    return $self->{id};
}

sub params {
    my ($self) = @_;

    return $self->{params} ? values($self->{params}) : ();
}

sub returns {
    my ($self) = @_;

    return $self->{returns};
}

sub comment {
    my ($self) = @_;

    return $self->{comment};
}

1;
