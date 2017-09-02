package ApiBuilder::File;

use strict;

use File::Path qw( make_path );
use IO::File;

sub new {
    my ($this, $basedir, $id) = @_;
    my $class = ref($this) || $this;
    my $self = {
        basedir => $basedir,
        subdir => undef,
        id => $id,
        extension => undef,
        file => undef,
        indent => '    ',
    };

    bless($self, $class);

    return($self);
}

sub filename {
    my ($self) = @_;
    my $filename = $self->{basedir} . '/';

    $filename .= ($self->{subdir} . '/') if ($self->{subdir});
    $filename .= $self->{id};
    $filename .= ('.' . $self->{extension}) if ($self->{extension});

    return $filename;
}

sub build {
    my ($self) = @_;
    my $filename = $self->filename;
    my ($dir) = ($filename =~ /^(.+)\/[^\/]+$/);

    print STDERR $filename, "\n";
    make_path($dir);
    $self->{file} = IO::File->new($filename, '>') or die($!);
    $self->build_file;
    $self->{file}->close;
}

sub build_file {
    my ($self) = @_;
    # Implement in subclass
}

sub print {
    my ($self, @text) = @_;

    $self->{file}->print(@text);
}

sub println {
    my ($self, @text) = @_;

    $self->{file}->print(@text, "\n");
}

sub indent {
    my ($self, $count, @text) = @_;

    $self->{file}->print($self->{indent} x $count, @text);
}

sub indentln {
    my ($self, $count, @text) = @_;

    $self->{file}->print($self->{indent} x $count, @text, "\n");
}

sub comment {
    my ($self, $count, $prefix, $text) = @_;
    my $indent = ($self->{indent} x $count) . $prefix;

    $self->{file}->print($indent, $text, "\n"); # TODO wrod-wrap?
}

1;
