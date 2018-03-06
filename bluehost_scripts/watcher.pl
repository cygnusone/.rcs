#!/usr/bin/env perl

=head1 NAME

    watcher - watch for when files change and do stuff when they do

=head1 SYNOPSIS

    # execute myscript with list of files whenever said files in /some/dir change, excluding GIFs
    watcher /some/dir --exclude='\.gif$' --exec='@myscript'

    # restart apache when perl files change in /var/www/cgi and /var/www/lib
    watcher /var/www/{cgi,lib} --exec='/etc/init.d/httpd graceful'

    # restart apache when perl files change in any directory in /var/hp named lib or cgi
    watcher $(find /var/hp -type d -name lib -o -name cgi) --exec='/etc/init.d/httpd graceful'

=head1 DESCRIPTION

React to file changes.

Requires L<inotifywait> from the inotify-tools package.

=head1 AUTHOR

Charles McGarvey <cmcgarvey@bluehost.com>

=cut

use warnings FATAL => 'all';
use strict;
use autodie;

use POSIX qw(strftime);
use Time::HiRes qw(alarm);

sub parse_options {
    my $spec    = [];
    my $mode    = 'directory';
    my $current = {};

    while (my $atom = shift) {
        if ($atom =~ /^--?(d|directory|include|exclude|exec)(?:=(.+))?$/) {
            $current = {} if $1 ne 'exec' && $mode eq 'exec';
            push @$spec, $current if $1 eq 'exec' && $mode ne 'exec';
            $mode = $1;
            $atom = $2;
            next unless $atom;
        }
        push @{$current->{$mode} ||= []}, $atom;
    }

    return $spec;
}

sub get_directories {
    my $spec = shift;
    my %dirs;

    for my $item (@$spec) {
        for my $dir (@{$item->{directory} || []}) {
            $dirs{$dir} = 1;
        }
    }

    return sort keys %dirs;
}

sub try_exec {
    my $item    = shift;
    my @files   = @_;

    my %files;

    # only consider files in the specified directories
    for my $file (@files) {
        for my $dir (@{$item->{directory} || []}) {
            $dir = "$dir/" if $dir !~ m!/$!;
            $files{$file} = 1 if $file =~ /^$dir/;
        }
    }

    # check that the remaining files are not matched for exclusion
    for my $file (keys %files) {
        for my $matcher (@{$item->{exclude} || []}) {
            delete $files{$file} if $file =~ /$matcher/;
        }
    }

    # check that the remaining files are matched for inclusion
    if (@{$item->{include} || []}) {
        for my $file (keys %files) {
            my $matched = 0;
            for my $matcher (@{$item->{include} || []}) {
                $matched = 1 if $file =~ /$matcher/;
            }
            if (!$matched) {
                delete $files{$file};
            }
        }
    }

    # if we still have files, run the provided commands and scripts
    if (keys %files) {
        for my $command (@{$item->{exec} || []}) {
            my @command;
            if (my ($script) = $command =~ /^@(.+)/) {
                @command = ($script, sort keys %files);
                $command = join(' ', @command);
            }
            else {
                $command =~ s/{}/join(' ', sort keys %files)/ge;
                @command = ($command);
            }
            print strftime("[34m[%H:%M:%S] exec: [1m$command[0m\n", localtime);
            system(@command);
        }
    }
}

sub watch {
    my $spec = shift;

    my @dirs    = get_directories($spec) or die 'No directories specified to watch';
    my $changed = {};

    my @watcher = qw(inotifywait -q -r -m --format %w%f -e create -e modify -e attrib --);
    open(my $in, '-|', join(' ', (@watcher, @dirs)));

    print "Watching for file changes in ".join(', ', @dirs)."\n";

    while (1) {
        eval {
            local $SIG{ALRM} = sub { die "alarm\n" };
            alarm 0.3;
            while (my $file = <$in>) {
                chomp $file;
                $changed->{$file} = 1;
            }
            alarm 0;
        };
        if ($@) {
            die unless $@ eq "alarm\n";
            my @files = grep { not grep { /^(?:CVS|\.git)$/ } split(m!/!, $_) } sort keys %$changed;
            print strftime("[36m[%H:%M:%S] detected file change: [1m$_[0m\n", localtime) for @files;
            if (@files) {
                for my $item (@$spec) {
                    try_exec($item, @files);
                }
            }
            $changed = {};
        }
    }
}

sub main {
    my $spec = parse_options(@_);
    watch($spec);
}

main(@ARGV);
exit 0;
