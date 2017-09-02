package ApiBuilder::Class;

use strict;

use base qw( ApiBuilder::File );

sub new {
    my ($this, $basedir, $type) = @_;
    my $self = $this->SUPER::new($basedir, $type->id);

    $self->{parent} = $type->parent;
    $self->{package} = undef;
    $self->{package_separator} = '.';
    $self->{includes} = { };
    $self->{include_groups} = [ ];
    $self->{includes_before_package} = 0;
    $self->{fields} = [ ];
    $self->{fields_have_methods} = 0;

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

    foreach my $include (@includes) {
        $self->{includes}{$include} = 1;
    }
}

sub add_field {
    my ($self, @fields) = @_;

    push(@{$self->{fields}}, @fields);
}

sub build_file {
    my ($self) = @_;
    my $class = $self->{id};
    my $parent = $self->{parent};
    my $package = $self->{package};
    my %includes = %{$self->{includes}};
    my @include_groups = @{$self->{include_groups}}, qr/./;
    my $includes_before_package = $self->{includes_before_package};
    my @fields = @{$self->{fields}};
    my $fields_have_methods = $self->{fields_have_methods};
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
    $self->begin_class($class, $parent);

    foreach my $field (@fields) {
        $self->do_field($field, $index++);
    }

    if ($fields_have_methods) {
        $index = 0;

        foreach my $field (@fields) {
            $self->do_field_methods($field, $index++);
        }
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
    my ($self, $class, $parent) = @_;
    # Implement in subclass
}

sub do_field {
    my ($self, $field) = @_;
    # Implement in subclass
}

sub do_field_methods {
    my ($self, $field) = @_;
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
