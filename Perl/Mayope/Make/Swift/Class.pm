package Mayope::Make::Swift::Class;

use strict;
use base qw( Mayope::Make::Class );

sub new {
    my ($this, $config, $basedir, $type) = @_;
    my $self = $this->SUPER::new($config, $basedir, $type);

    $self->{subdir} = 'Mayope';
    $self->{extension} = 'swift';
    $self->{has_subpaackages} = 0;
    $self->{class_types}{1} = 'class'; # TODO no real abstract classes yet
    $self->{class_types}{2} = 'protocol';

    return($self);
}

sub do_include {
    my ($self, $include) = @_;

    $self->println('import ', $include);
}

sub begin_file {
    my ($self) = @_;

    $self->println('//');
    $self->println('// This code was auto-generated by the Mayope API builder.');
    $self->println('//');
    $self->println;
}
sub begin_class {
    my ($self, $type) = @_;
    my $comment = $type->comment;
    my $parent = $type->parent;
    my $class_type = $self->class_type;

    $self->comment(0, '/// ', $comment) if ($comment);
    $self->print('public ', $class_type, ' ', $type->id);

    if ($class_type eq 'enum') {
        $self->print(' : String');
    } elsif ($parent) {
        $self->print(' : ', $parent->class('Swift'));
    }

    $self->println(' {');
}

sub do_value {
    my ($self, $value) = @_;
    my $comment = $value->comment;

    $self->comment(1, '/// ', $comment) if ($comment);
    $self->indentln(1, 'case ', lcfirst($value->id), ' = "', $value->id, '"');
}

sub do_field {
    my ($self, $field, $not_first) = @_;
    my $class = $field->class('Swift');
    my $comment = $field->comment;

    $self->println if ($not_first);
    $self->comment(1, '/// ', $comment) if ($comment);
    $self->indentln(1, 'var ', $field->id, ': ', $class, ' { get set }');
}

sub do_method {
    my ($self, $method, $not_first) = @_;
    my $name = lcfirst($method->id);
    my $returns = $method->returns->class('Swift');
    my $comment = $method->comment;
    my $pindex = 0;

    $self->println if ($not_first);
    $self->comment(1, '/// ', $comment) if ($comment);
    $self->indent(1, 'func ', $name, '('); # TODO public if abstract class?

    foreach my $param ($method->params) {
        $self->print(', ') if ($pindex++);
        $self->print($param->id, ': ', $param->class('Swift'));
    }

    $self->println(') -> ', $returns);
}

sub end_class {
    my ($self) = @_;

    $self->println('}');
}

1;
