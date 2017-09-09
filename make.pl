#!/usr/bin/perl -w

use strict;

use Cwd;
use Carp qw( cluck confess verbose );

use lib getcwd() . '/Perl';

use Mayope::Make::Builder;
use Mayope::Make::Parser;

$SIG{__DIE__} = \&confess;
$SIG{__WARN__} = \&cluck;

my %langs = (
    CSharp => {
        mancmmb => 0, # Microsoft.AspNetCore.Mvc.ModelBinding
        nsj     => 1, # Newtonsoft.Json
        scmda   => 1, # System.ComponentModel.DataAnnotations
    },
    Java => { },
    Swift => { },
);

my $cwd = getcwd();
my $parser = Mayope::Make::Parser->new($cwd . '/API.txt');
my $api = $parser->parse();

if (@ARGV && ($ARGV[0] eq '-d')) {
    $api->dump;
    exit(0);
}

foreach my $lang (keys(%langs)) {
    my $class = 'Mayope::Make::' . $lang . '::Builder';

    eval('use ' . $class);
    die($@) if ($@);

    my $builder = $class->new($langs{$lang}, $api, $cwd . '/' . $lang);

    $builder->build();
}
