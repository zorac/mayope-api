package Mayope::Make::Class;

use strict;

use base qw( Mayope::Make::File );

use Mayope::Make::Model::Method;
use Mayope::Make::Model::Param;
use Mayope::Make::Model::Type;

sub new {
    my ($this, $basedir, $type) = @_;
    my $self = $this->SUPER::new($basedir, $type->id);

    $self->{type} = $type;
    $self->{package} = undef;
    $self->{package_separator} = '.';
    $self->{includes} = { };
    $self->{include_groups} = [ ];
    $self->{includes_before_package} = 0;
    $self->{fields} = [ ];
    $self->{fields_have_methods} = 0;
    $self->{methods} = [ ];

    return($self);
}

sub subpackage {
    my ($self, $subpackage) = @_;

    if (defined($self->{subdir})) {
        $self->{subdir} .= '/' . $subpackage;
    } else {
        $self->{subdir} = $subpackage;
    }

    if (defined($self->{package})) {
        $self->{package} .= $self->{package_separator} . $subpackage;
    } else {
        $self->{package} = $subpackage;
    }
}

sub add_include {
    my ($self, @includes) = @_;
    my $package = $self->{package} || '';

    foreach my $include (@includes) {
        next if ($include eq $package); # TODO superpackages

        $self->{includes}{$include} = 1;
    }
}

sub add_field {
    my ($self, @fields) = @_;

    push(@{$self->{fields}}, @fields);
}

sub add_method {
    my ($self, @methods) = @_;

    push(@{$self->{methods}}, @methods);
}

sub build_file {
    my ($self) = @_;
    my $type = $self->{type};
    my $package = $self->{package};
    my %includes = %{$self->{includes}};
    my @include_groups = @{$self->{include_groups}}, qr/./;
    my $includes_before_package = $self->{includes_before_package};
    my @fields = @{$self->{fields}};
    my $fields_have_methods = $self->{fields_have_methods};
    my @methods = @{$self->{methods}};
    my $index = 0;

    $self->begin_package($package) if (!$includes_before_package);

    foreach my $group (@include_groups) {
        my $count = 0;

        foreach my $include (sort(keys(%includes))) {
            next if ($include !~ $group);
            $self->do_include($include);
            delete($includes{$include});
            $count++;
        }

        $self->println if ($count > 0);
    }

    $self->begin_package($package) if ($includes_before_package);
    $self->begin_class($type);

    foreach my $field (@fields) {
        $self->do_field($field, $index++);
    }

    if ($fields_have_methods) {
        foreach my $field (@fields) {
            $self->do_field_methods($field, $index++);
        }
    }

    foreach my $method (@methods) {
        $self->do_method($method, $index++);
    }

    $self->end_class();
    $self->end_package();
}

sub begin_package {
    my ($self, $package) = @_;
    # Implement in subclass
}

sub do_include {
    my ($self, $include) = @_;
    # Implement in subclass
}

sub begin_class {
    my ($self, $type) = @_;
    # Implement in subclass
}

sub do_field {
    my ($self, $field, $index) = @_;
    # Implement in subclass
}

sub do_field_methods {
    my ($self, $field, $index) = @_;
    # Implement in subclass
}

sub do_method {
    my ($self, $method, $index) = @_;
    # Implement in subclass
}

sub end_class {
    my ($self) = @_;
    # Implement in subclass
}

sub end_package {
    my ($self) = @_;
    # Implement in subclass
}

1;
