package Mayope::Make::Model::Object;

use strict;

use Tie::IxHash;

sub new {
    my ($this, @params) = @_;
    my $class = ref($this) || $this;
    my $self = $this->hash(@params);;

    bless($self, $class);

    return($self);
}

sub hash {
    my ($this, @params) = @_;
    my %hash;

    tie(%hash, 'Tie::IxHash');
    %hash = @params;

    return \%hash;
}

1;
