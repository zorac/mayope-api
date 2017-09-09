package Mayope::Make::Class;

use strict;
use base qw( Mayope::Make::File );

sub new {
    my ($this, $config, $basedir, $type) = @_;
    my $self = $this->SUPER::new($basedir, $type->id);

    $self->{type} = $type;
    $self->{config} = $config;
    $self->{abstraction} = $type->abstraction || 0;
    $self->{package} = undef;
    $self->{package_separator} = '.';
    $self->{has_subpaackages} = 1;
    $self->{includes} = { };
    $self->{include_groups} = [ ];
    $self->{includes_before_package} = 0;
    $self->{fields} = [ ];
    $self->{fields_have_methods} = 0;
    $self->{methods} = [ ];
    $self->{values} = [ ];
    $self->{class_types} = {
        0    => 'class',
        1    => 'abstract class',
        2    => 'interface',
        enum => 'enum'
    };

    return($self);
}

sub config {
    my ($self, $option) = @_;

    return $self->{config}{$option};
}

sub abstraction {
    my ($self) = @_;

    return $self->{abstraction};
}

sub class_type {
    my ($self) = @_;

    return $self->{type}->enum ? $self->{class_types}{enum}
        : $self->{class_types}{$self->abstraction};
}

sub package {
    my ($self) = @_;

    return $self->{package};
}

sub subpackage {
    my ($self, $subpackage) = @_;

    if (defined($self->{subdir})) {
        $self->{subdir} .= '/' . $subpackage;
    } else {
        $self->{subdir} = $subpackage;
    }

    if ($self->{has_subpaackages}) {
        if (defined($self->{package})) {
            $self->{package} .= $self->{package_separator} . $subpackage;
        } else {
            $self->{package} = $subpackage;
        }
    }
}

sub add_include {
    my ($self, @includes) = @_;
    my $package = $self->{package} || '';

    foreach my $include (@includes) {
        next if (!defined($include));
        next if ($include eq $package); # TODO superpackages

        $self->{includes}{$include} = 1;
    }
}

sub add_field {
    my ($self, @fields) = @_;

    push(@{$self->{fields}}, @fields);

    if ($self->{fields_have_methods}) {
        foreach my $field (@fields) {
            $self->add_method(
                Mayope::Make::Model::Method->new(
                    id => 'get' . ucfirst($field->id),
                    returns => Mayope::Make::Model::Param->new(
                        type => $field->type,
                        generic => $field->{generic},
                        comment => 'The value'
                    ),
                    comment => 'Get ' . lcfirst($field->comment),
                    getter => $field
                ),
                Mayope::Make::Model::Method->new(
                    id => 'set' . ucfirst($field->id),
                    params => { request => Mayope::Make::Model::Param->new(
                        id => $field->id,
                        type => $field->type,
                        generic => $field->{generic},
                        comment => 'A new value'
                    ) },
                    comment => 'Set ' . lcfirst($field->comment),
                    setter => $field
                )
            );
        }
    }
}

sub add_method {
    my ($self, @methods) = @_;

    push(@{$self->{methods}}, @methods);
}

sub add_value {
    my ($self, @values) = @_;

    push(@{$self->{values}}, @values);
}

sub build_file {
    my ($self) = @_;
    my $type = $self->{type};
    my $package = $self->{package};
    my %includes = %{$self->{includes}};
    my @include_groups = (@{$self->{include_groups}}, qr/.*/);
    my $includes_before_package = $self->{includes_before_package};
    my @values = @{$self->{values}};
    my @fields = @{$self->{fields}};
    my @methods = @{$self->{methods}};
    my $index = 0;

    $self->begin_file;
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

    foreach my $value (@values) {
        $self->do_value($value, $#values - $index++);
    }

    foreach my $field (@fields) {
        $self->do_field($field, $index++);
    }

    foreach my $method (@methods) {
        $self->do_method($method, $index++);
    }

    $self->end_class();
    $self->end_package();
    $self->end_file;
}

sub begin_file {
    my ($self) = @_;
    # Implement in subclass
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

sub do_value {
    my ($self, $value, $not_last) = @_;
    # Implement in subclass
}

sub do_field {
    my ($self, $field, $not_first) = @_;
    # Implement in subclass
}

sub do_method {
    my ($self, $method, $not_first) = @_;
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

sub end_file {
    my ($self) = @_;
    # Implement in subclass
}

1;
