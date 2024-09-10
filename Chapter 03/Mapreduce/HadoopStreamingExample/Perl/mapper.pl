#!/usr/bin/perl

while (<>) {
    chomp;
    my @words = split;
    foreach my $word (@words) {
        print "$word\t1\n"; # Emit word and count 1
    }
}
