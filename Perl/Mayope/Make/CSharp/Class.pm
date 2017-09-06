package Mayope::Make::CSharp::Class;

use strict;
use base qw( Mayope::Make::Class );

sub new {
    my ($this, $basedir, $type) = @_;
    my $self = $this->SUPER::new($basedir, $type);

    $self->{subdir} = 'Mayope.Api';
    $self->{extension} = 'cs';
    $self->{package} = 'Mayope.Api';
    $self->{include_groups} = [ qr/^System/, qr/^Microsoft/, qr/^Mayope/ ];
    $self->{includes_before_package} = 1;

    $self->{id} = ('I' . $self->id) if ($self->abstraction == 2);

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
    my ($self, $type) = @_;
    my $comment = $type->comment;
    my $parent = $type->parent;
    my $class_type = $self->class_type;

    if ($comment) {
        $self->indentln(1, '/// <summary>');
        $self->comment(1, '/// ', $comment);
        $self->indentln(1, '/// </summary>');
    }

    $self->indent(1, 'public ', $class_type, ' ', $self->id);
    $self->print(' : ', $parent->class('CSharp')) if ($parent);
    $self->println;
    $self->indentln(1, '{');
}

sub do_value {
    my ($self, $value, $not_last) = @_;
    my $comment = $value->comment;

    if ($comment) {
        $self->indentln(2, '/// <summary>');
        $self->comment(2, '/// ', $comment);
        $self->indentln(2, '/// </summary>');
    }

    $self->indentln(2, $value->id, $not_last ? ',' : '');
}

sub do_field {
    my ($self, $field, $not_first) = @_;
    my $class = $field->class('CSharp');
    my $name = ucfirst($field->id);
    my $comment = $field->comment;

    $self->println if ($not_first);

    if ($comment) {
        $self->indentln(2, '/// <summary>');
        $self->comment(2, '/// ', $comment);
        $self->indentln(2, '/// </summary>');
    }

    $self->indentln(2, '[Required]') if ($field->required);
    $self->indentln(2, 'public ', $class, ' ', $name, ' { get; set; }');
}

sub do_method {
    my ($self, $method, $not_first) = @_;
    my $name = $method->id;
    my $returns = $method->returns->class('CSharp');
    my $comment = $method->comment;
    my $pindex = 0;

    $self->println if ($not_first);

    if ($comment) {
        $self->indentln(2, '/// <summary>');
        $self->comment(2, '/// ', $comment);
        $self->indentln(2, '/// <summary>');
    }

    $self->indent(2, $returns, ' ', $name, '('); # TODO public if abstract class?

    foreach my $param ($method->params) {
        $self->print(', ') if ($pindex++);
        $self->print($param->class('Java'), ' ', $param->id);
    }

    $self->println(');');
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
