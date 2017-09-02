package ApiBuilder::Type;

use strict;

sub id {
    my ($self) = @_;

    return $self->{id};
}

sub generic {
    my ($self) = @_;

    return $self->{generic} ? @{$self->{generic}} : ();
}

sub params {
    my ($self) = @_;

    return $self->{params} ? values($self->{params}) : ();
}

sub class {
    my ($self, $lang, $class) = @_;

    $self->{class} = {} if (!$self->{class});

    if ($class) {
        $self->{class}{$lang} = $class;
    } else {
        return $self->{class}{$lang};
    }
}

sub package {
    my ($self, $lang, $package) = @_;

    $self->{package} = {} if (!$self->{package});

    if ($package) {
        $self->{package}{$lang} = $package;
    } else {
        return $self->{package}{$lang};
    }
}

1;
