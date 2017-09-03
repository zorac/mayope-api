package ApiBuilder::Param;

use strict;

sub id {
    my ($self) = @_;

    return $self->{id};
}

sub type {
    my ($self) = @_;

    return $self->{type};
}

sub generic {
    my ($self) = @_;

    return $self->{generic} ? @{$self->{generic}} : ();
}

sub optional {
    my ($self) = @_;

    return $self->{optional} ? 1 : 0;
}

sub required {
    my ($self) = @_;

    return $self->{optional} ? 0 : 1;
}

sub comment {
    my ($self) = @_;

    return $self->{comment};
}

sub class {
    my ($self, $lang) = @_;
    my $class = $self->type->class($lang);
    my @generic = map { $_->class($lang) } $self->generic;

    # TODO don't assume everyone formats their generics this way!
    $class = ($class . '<' . join(',', @generic) . '>') if (@generic);

    return $class;
}

sub packages {
    my ($self, $lang) = @_;
    my $type = $self->{type};
    my $package = $type->package($lang);
    my @packages;

    push(@packages, $package) if ($package);

    foreach $type ($self->generic) {
        $package = $type->package($lang);
        push(@packages, $package) if ($package);
    }

    return @packages;
}

1;
