package Mayope::Make::Java::Class;

use strict;
use base qw( Mayope::Make::Class );

sub new {
    my ($this, $basedir, $type) = @_;
    my $self = $this->SUPER::new($basedir, $type);

    $self->{subdir} = 'org/mayope/api';
    $self->{extension} = 'java';
    $self->{package} = 'org.mayope.api';
    $self->{include_groups} = [ qr/^java/, qr/^org\.mayope/ ];
    $self->{fields_have_methods} = 1;

    return($self);
}

sub subpackage {
    my ($self, $subpackage) = @_;

    $self->SUPER::subpackage(lc($subpackage));
}

sub begin_package {
    my ($self, $package) = @_;

    $self->println('package ', $package, ';');
    $self->println();
}

sub do_include {
    my ($self, $include) = @_;

    $self->println('import ', $include, ';');
}

sub begin_class {
    my ($self, $type) = @_;
    my $comment = $type->comment;
    my $parent = $type->parent;
    my $class_type = $self->class_type;

    if ($comment) {
        $self->println('/**');
        $self->comment(0, ' * ', $comment);
        $self->println(' */');
    }

    $self->print('public ', $class_type, ' ', $type->id);
    $self->print((($parent->abstraction == 2)
        ? ' implements ' : ' extends '), $parent->class('Java')) if ($parent);
    $self->println(' {');
}

sub do_field {
    my ($self, $field, $index) = @_;
    my $class = $field->class('Java');
    my $comment = $field->comment;

    $self->println if ($index);

    if ($comment) {
        $self->indentln(1, '/**');
        $self->comment(1, ' * ', $comment);
        $self->indentln(1, ' */');
    }

    $self->indentln(1, 'private ', $class, ' ', $field->id, ';');
}

sub do_field_methods {
    my ($self, $field) = @_;
    my $name = $field->id;
    my $fname = ucfirst($name);
    my $class = $field->class('Java');
    my $comment = $field->comment;

    $self->println;

    if ($comment) {
        $self->indentln(1, '/**');
        $self->comment(1, ' * ', 'Get ' . lcfirst($comment));
        $self->indentln(1, ' *');
        $self->indentln(1, ' * @return The value');
        $self->indentln(1, ' */');
    }

    $self->indentln(1, 'public ', $class, ' get', $fname, '() {');
    $self->indentln(2, 'return ', $name, ';');
    $self->indentln(1, '}');
    $self->println;

    if ($comment) {
        $self->indentln(1, '/**');
        $self->comment(1, ' * ', 'Set ' . lcfirst($comment));
        $self->indentln(1, ' *');
        $self->indentln(1, ' * @param ', $name, ' The new value');
        $self->indentln(1, ' */');
    }

    $self->indentln(1, 'public void set', $fname, '(', $class, ' ', $name, ') {');
    $self->indentln(2, 'this.', $name, ' = ', $name, ';');
    $self->indentln(1, '}');
}

sub do_method {
    my ($self, $method, $index) = @_;
    my $name = lcfirst($method->id);
    my $returns = $method->returns->class('Java');
    my $comment = $method->comment;
    my $pindex = 0;

    $self->println if ($index);

    if ($comment) {
        $self->indentln(1, '/**');
        $self->comment(1, ' * ', $comment);
        $self->indentln(1, ' */');
    }

    $self->indent(1, $returns, ' ', $name, '('); # TODO public if abstract class?

    foreach my $param ($method->params) {
        $self->print(', ') if ($pindex++);
        $self->print($param->class('Java'), ' ', $param->id);
    }

    $self->println(');');
}

sub end_class {
    my ($self) = @_;

    $self->println('}');
}

1;
