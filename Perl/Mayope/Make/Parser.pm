package Mayope::Make::Parser;

use strict;

use File::Slurp;

use Mayope::Make::Model::Action;
use Mayope::Make::Model::API;
use Mayope::Make::Model::Message;
use Mayope::Make::Model::Object;
use Mayope::Make::Model::Param;
use Mayope::Make::Model::Type;

sub new {
    my ($this, $filename) = @_;
    my $class = ref($this) || $this;
    my $self = { filename => $filename };

    bless($self, $class);

    return($self);
}

sub parse {
    my ($self) = @_;

    $self->{type} = Mayope::Make::Model::Object->hash;
    $self->{message} = Mayope::Make::Model::Object->hash;
    $self->{action} = Mayope::Make::Model::Object->hash;
    $self->{lines} = read_file($self->{filename}, chomp => 1, array_ref => 1);

    while (defined(my $line = shift(@{$self->{lines}}))) {
        if ($line =~ /^
                    TYPE \s+ (\w+) (?:
                        \s* < \s* (
                            \w+ (?:
                                \s* , \s* \w+
                            )*
                        ) \s* >
                    )? \s*
                $/x) {
            my $id = $1;
            my $generic = $2;
            my $type = Mayope::Make::Model::Type->new( id => $id );

            $type->{generic} = [ split(/\s*,\s*/, $generic) ] if ($generic);
            $self->{type}{$id} = $type;
            $self->parse_type($type);
        } elsif ($line =~ /^
                    MESSAGE \s+ (\w+) (?:
                        \s* : \s* (\w+)
                    )? \s*
                $/x) {
            my $id = $1;
            my $parent = $2 ? $self->{message}{$2} : undef;
            my $message = Mayope::Make::Model::Message->new( id => $id );

            $message->{parent} = $parent if ($parent);
            $self->{message}{$id} = $message;
            $self->parse_type($message);
        } elsif ($line =~ /^
                    ACTION \s+ (\w+) \s+ (\w+) \s+ (\w+) \s*
                $/x) {
            my $id = $1;
            my $request = $self->{message}{$2};
            my $response = $self->{message}{$3};
            my $action = Mayope::Make::Model::Action->new(
                id => $id,
                request => $request,
                response => $response
            );

            $self->{action}{$id} = $action;
            $self->parse_comment($action);
        } elsif ($line !~ /^\s*$/) {
            die("Unexpected line in parse()\n$line\n");
        }
    }

    return Mayope::Make::Model::API->new(
        types => $self->{type},
        messages => $self->{message},
        actions => $self->{action},
    );
}

sub parse_comment {
    my ($self, $obj) = @_;
    my $comment;

    while (defined(my $line = shift(@{$self->{lines}}))) {
        if ($line !~ /^\S/) {
            unshift(@{$self->{lines}}, $line);
            last;
        } elsif (defined($comment)) {
            $comment .= ' ' . $line;
        } else {
            $comment = $line;
        }
    }

    $obj->{comment} = $comment if (defined($comment));
}

sub parse_type {
    my ($self, $obj) = @_;
    my $params = Mayope::Make::Model::Object->hash;

    $self->parse_comment($obj);

    while (defined(my $line = shift(@{$self->{lines}}))) {
        if ($line =~ /^
                    \s+ (\w+) \s* ([:?]) \s* (\w+) (?:
                        \s* < \s* (
                            \w+ (?:
                                \s* , \s* \w+
                            )*
                        ) \s* >
                    )? \s*
                $/x) {
            my $id = $1;
            my $optional = $2;
            my $type = $self->{type}{$3};
            my $generic = $4;

            die("Unknown type $3 in\n$line\n") if (!$type);

            my $param = Mayope::Make::Model::Param->new(
                id => $id,
                type => $type
            );

            if ($generic) {
                my @generic = split(/\s*,\s*/, $generic);

                die("Spurious generic parameters in\n$line\n")
                    if (!$type->{generic});
                die("Wrong number of generic parameters in\n$line\n")
                    if (@generic != @{$type->{generic}});

                $param->{generic} = [ map {
                    $self->{type}{$_} or die("Unkown type $_ in\n$line\n");
                } @generic ];
            } elsif ($type->{generic}) {
                die("Missing generic parameters in\n$line\n");
            }

            $param->{optional} = 1 if ($optional eq '?');
            $self->parse_comment($param);
            $params->{$id} = $param;
        } elsif ($line =~ /^\s*$/) {
            last;
        } else {
            die("Unexpected line in parse_type()\n$line\n");
        }
    }

    $obj->{params} = $params if (%{$params});
}

1;
