package Mayope::Make::Model::Message;

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

sub params {
    my ($self) = @_;

    return $self->{params} ? values($self->{params}) : ();
}

sub comment {
    my ($self) = @_;

    return $self->{comment};
}

1;