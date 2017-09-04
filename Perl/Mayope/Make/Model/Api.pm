package Mayope::Make::Model::API;

use strict;
use base qw( Mayope::Make::Model::Object );

use Data::Dumper;

sub types {
    my ($self) = @_;

    return values($self->{types});
}

sub messages {
    my ($self) = @_;

    return values($self->{messages});
}

sub actions {
    my ($self) = @_;

    return values($self->{actions});
}

sub dump {
    my ($self) = @_;
    my $dumper = Data::Dumper->new([ $self ], [ 'api' ]);

    $dumper->Indent(1);

    print map {
        s/(bless\( |, 'Mayope::Make::Model::\w+' \))//g; $_;
    } $dumper->Dump;
}

1;
