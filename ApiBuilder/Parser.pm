package ApiBuilder::Parser;

use strict;

use File::Slurp;
use Tie::IxHash;

use ApiBuilder::Action;
use ApiBuilder::Api;
use ApiBuilder::Message;
use ApiBuilder::Param;
use ApiBuilder::Type;

sub new {
    my ($this, $filename) = @_;
    my $class = ref($this) || $this;
    my $self = { filename => $filename };

    bless($self, $class);

    return($self);
}

sub parse {
    my ($self) = @_;

    $self->{type} = $self->hash();
    $self->{message} = $self->hash();
    $self->{action} = $self->hash();
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
            my $type = $self->hash('Type',
                id => $id
            );

            $type->{generic} = [ split(/\s*,\s*/, $generic) ] if ($generic);

            $self->parse_type($type);

            $self->{type}{$id} = $type;
        } elsif ($line =~ /^
                    MESSAGE \s+ (\w+) (?:
                        \s* : \s* (\w+)
                    )? \s*
                $/x) {
            my $id = $1;
            my $parent = $2 ? $self->{message}{$2} : undef;
            my $message = $self->hash('Message',
                id => $id,
                parent => $parent
            );

            $self->parse_type($message);

            $self->{message}{$id} = $message;
        } elsif ($line =~ /^
                    ACTION \s+ (\w+) \s+ (\w+) \s+ (\w+) \s*
                $/x) {
            my $id = $1;
            my $request = $self->{message}{$2};
            my $response = $self->{message}{$3};
            my $action = $self->hash('Action',
                id => $id,
                request => $request,
                response => $response
            );

            $self->parse_comment($action);

            $self->{action}{$id} = $action;
        } elsif ($line !~ /^\s*$/) {
            die("Unexpected line in parse()\n$line\n");
        }
    }

    return $self->hash('Api',
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
    my $params = $self->hash();

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

            die("Unknown type $type in\n$line\n") if (!$type);

            my $param = $self->hash('Param',
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

sub hash {
    my ($self, $type, @content) = @_;
    my %hash;

    tie(%hash, 'Tie::IxHash');
    %hash = @content;

    my $hash = \%hash;

    bless($hash, 'ApiBuilder::' . $type) if ($type);

    return $hash;
}

1;
