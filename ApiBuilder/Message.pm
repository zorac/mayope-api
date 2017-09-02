package ApiBuilder::Message;

use strict;

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

1;
