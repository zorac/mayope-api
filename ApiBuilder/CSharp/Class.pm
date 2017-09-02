package ApiBuilder::CSharp::Class;

use strict;

use base qw( ApiBuilder::Class );

sub new {
    my ($this, $basedir, $type) = @_;
    my $self = $this->SUPER::new($basedir, $type);

    $self->{subdir} = 'Mayope.Api';
    $self->{extension} = 'cs';
    $self->{package} = 'Mayope.Api';
    $self->{include_groups} = [ qr/^System/, qr/^Microsoft/, qr/^Mayope/ ];
    $self->{includes_before_package} = 1;

    return($self);
}

sub do_include {
    my ($self, $include) = @_;

    $self->println('using ', $include, ';');
}

sub begin_package {
    my ($self, $package) = @_;

    $self->println('namespace ', $package, ';');
    $self->println('{');
}

sub begin_class {
    my ($self, $class, $parent) = @_;

    $self->indent(1, 'public class ', $class);
    $self->print(' : ', $parent->id) if ($parent); # TODO class
    $self->println;
    $self->indentln(1, '{');
}

sub do_field {
    my ($self, $field, $index) = @_;
    my $class = $field->class('CSharp');
    my $name = ucfirst($field->id);

    $self->println if ($index);
    $self->indentln(2, '[Required]') if ($field->required);
    $self->indentln(2, 'public ', $class, ' ', $name, ' { get; set; }');
}

sub end_class {
    my ($self) = @_;

    $self->indentln(1, '}');
}

sub end_package {
    my ($self) = @_;

    $self->println('}');
}

1;
