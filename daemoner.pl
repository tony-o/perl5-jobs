#!/usr/bin/env perl 

use v5.16; 
use EV;

my $pid;
defined($pid = fork) or die 'unable to fork: ' . $!;

if ($pid) { #git check
  my $checker = EV::timer 0, 30, sub {
    my $status = qx<git pull>; 
    chomp $status; 
    say "{Status: $status}";
    if ( $status ne 'Already up-to-date.' ) {
      say '{Killing childe}';
      kill $pid;
      waitpid $pid, 0;
      say '{Pulling changes}';
      qx<git pull>;
      defined($pid = fork) or die 'unable to fork: ' . $!;
    }
  };
} else {
  say '{Starting server..}';
  system('./start.sh'); 
}
