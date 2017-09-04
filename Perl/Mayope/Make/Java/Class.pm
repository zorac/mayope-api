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

    if ($comment) {
        $self->println('/**');
        $self->comment(0, ' * ', $comment);
        $self->println(' */');
    }

    $self->print('public class ', $type->id);
    $self->print(' extends ', $parent->id) if ($parent); # TODO class
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

sub end_class {
    my ($self) = @_;

    $self->println('}');
}

1;
