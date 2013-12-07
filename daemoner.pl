#!/usr/bin/env perl 

use v5.16; 
use EV;
use POSIX ":sys_wait_h";

my $pid;
sub start {
  defined($pid = fork) or die 'unable to fork: ' . $!;
  if ( $pid > 0 ) { #git check
    my $checker = EV::timer 0, 30, sub {
      my $status = qx{git fetch origin 2>&1}; 
      say "{Status: $status}";
      if ( $status ne '' ) {
        say '{Killing childe}';
        kill 'KILL', $pid;
        waitpid -1, 0;
        say '{Pulling changes}';
        qx<git pull>;
        start();
      }
    };
    EV::run;
  } elsif ( $pid == 0 ) {
    say '{Starting server..}';
    system('./start.sh'); 
  }
}
start();
