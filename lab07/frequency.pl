#!/usr/bin/perl -w

foreach $file (glob "lyrics/*.txt") {
    
    # Extract Artist's Name
    $artist = $file;
    # replace .txt with nothing
    $artist =~ s/\.txt$//;  
    # replace anything before the first '/' which is inherently "lyrics"  
    $artist =~ s/.*\///;
    # replace '_' with ' '
    $artist =~ s/_/ /g;
    
    open (FH, '<', $file) or die $!;
    while ($line = <FH>) {
        $line = lc $line;
        foreach $word ($line =~ /[a-z]+/g) {
            $word_count{$artist}{$word}++;
            $total_words{$artist}++;
        }
    }
    
    close (FH);
}

foreach $word (@ARGV) {
    $word = lc $word;
    foreach $artist (sort keys %word_count) {
        my $occurence = $word_count{$artist}{$word} || 0;
        my $total = $total_words{$artist};
        printf ("%4d/%6d = %.9f %s\n", $occurence, $total, $occurence/$total, $artist);
    }
}


