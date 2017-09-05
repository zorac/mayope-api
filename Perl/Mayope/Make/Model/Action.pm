package Mayope::Make::Model::Action;

use strict;
use base qw( Mayope::Make::Model::Node );


sub request {
    my ($self) = @_;

    return $self->{request};
}

sub response {
    my ($self) = @_;

    return $self->{response};
}

1;
