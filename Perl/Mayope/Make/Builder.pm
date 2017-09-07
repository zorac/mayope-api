package Mayope::Make::Builder;

use strict;

use Mayope::Make::Class;

sub new {
    my ($this, $config, $api, $basedir) = @_;
    my $class = ref($this) || $this;
    my $self = {
        api => $api,
        basedir => $basedir,
        config => $config,
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

    return $self->api->types;
}

sub messages {
    my ($self) = @_;

    return $self->api->messages;
}

sub actions {
    my ($self) = @_;

    return $self->api->actions;
}

sub basedir {
    my ($self) = @_;

    return $self->{basedir};
}

sub config {
    my ($self, $option) = @_;

    return $self->{config}{$option};
}

sub build {
    my ($self) = @_;
    # Implement in subclass
}

1;
