package Mayope::Make::Model::Node;

use strict;
use base qw( Mayope::Make::Model::Object );

sub id {
    my ($self) = @_;

    return $self->{id};
}

sub comment {
    my ($self) = @_;

    return $self->{comment};
}

1;
