#!/usr/bin/perl -w

use strict;

use Cwd;
use Carp qw( cluck confess verbose );

use ApiBuilder::Parser;

$SIG{__DIE__} = \&confess;
$SIG{__WARN__} = \&cluck;

my @langs = qw( CSharp Java );
my $cwd = getcwd();
my $parser = ApiBuilder::Parser->new($cwd . '/API.txt');
my $api = $parser->parse();

if (@ARGV && ($ARGV[0] eq '-d')) {
    $api->dump;
    exit(0);
}

foreach my $lang (@langs) {
    my $class = 'ApiBuilder::' . $lang . '::Builder';

    eval('use ' . $class);
    die($@) if ($@);

    my $builder = $class->new($api, $cwd . '/' . $lang);

    $builder->build();
}
