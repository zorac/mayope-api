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

1;
