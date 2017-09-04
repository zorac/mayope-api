package Mayope::Make::Model::Action;

use strict;
use base qw( Mayope::Make::Model::Object );

sub id {
    my ($self) = @_;

    return $self->{id};
}

sub request {
    my ($self) = @_;

    return $self->{request};
}

sub response {
    my ($self) = @_;

    return $self->{response};
}

sub comment {
    my ($self) = @_;

    return $self->{comment};
}

1;
