#!/usr/bin/env perl

BEGIN { 
  use Cwd qw<abs_path>;
  chdir join('/', splice([split('/', abs_path($0))] , 0, -1)) . '/..';
  push @INC, './lib'; 
}

use DB::PKG;
use Data::Dumper;
use v5.16;

my $jobrq_rs = $DB::PKG::db->resultset('Job');
my $educs_rs = $DB::PKG::db->resultset('Education');
my $jobmt_rs = $DB::PKG::db->resultset('Jobmatch');
my @edus     = $educs_rs->all;
my @jobrqres = $jobrq_rs->search(undef)->all;
my %bestfits;
my %wa;
$jobmt_rs->search({version => 'EDUCTN'})->delete;

for my $jobreq (@jobrqres) {
  foreach my $e (@edus) {
    next if !defined($e->degreetype) && defined($jobreq->degreereq);
    next if defined($jobreq->degreereq) && $jobreq->degreereq <= $e->degreetype->weighting;
    $jobmt_rs->create({
      uid  => $e->uid->uid,
      fval => defined $e->degreetype ? $e->degreetype->weighting : -1,
      jid  => $jobreq->id,
      version => 'EDUCTN',
    });
  }
}

