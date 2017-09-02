package ApiBuilder::Api;

use strict;

use Data::Dumper;

sub dump {
    my ($self) = @_;
    my $dumper = Data::Dumper->new([ $self ], [ 'api' ]);

    $dumper->Indent(1);

    print $dumper->Dump;
}

1;
