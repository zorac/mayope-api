package Mayope::Make::Model::Enum;

use strict;
use base qw( Mayope::Make::Model::Type );

sub enum {
    return 1;
}

sub values {
    my ($self) = @_;

    return values($self->{values});
}

1;
