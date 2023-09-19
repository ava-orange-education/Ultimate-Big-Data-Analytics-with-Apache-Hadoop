#!/usr/bin/perl

my $current_word = "";
my $current_count = 0;

while (<>) {
    chomp;
    my ($word, $count) = split("\t");
    
    if ($word eq $current_word) {
        $current_count += $count;
    } else {
        if ($current_word ne "") {
            print "$current_word\t$current_count\n";
        }
        $current_word = $word;
        $current_count = $count;
    }
}

# Print the last word
if ($current_word ne "") {
    print "$current_word\t$current_count\n";
}
