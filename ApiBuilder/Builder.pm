package ApiBuilder::Builder;

use strict;

sub new {
    my ($this, $api, $basedir) = @_;
    my $class = ref($this) || $this;
    my $self = {
        api => $api,
        basedir => $basedir
    };

    bless($self, $class);

    return($self);
}

sub api {
    my ($self) = @_;

    return $self->{api};
}

sub types {
    my ($self) = @_;

    return values($self->{api}{types});
}

sub messages {
    my ($self) = @_;

    return values($self->{api}{messages});
}

sub actions {
    my ($self) = @_;

    return values($self->{api}{actions});
}

sub basedir {
    my ($self) = @_;

    return $self->{basedir};
}

sub build {
    my ($self) = @_;
    # Implement in subclass
}

1;
