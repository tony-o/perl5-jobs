#!/usr/bin/env perl

BEGIN { 
  use Cwd qw<abs_path>;
  chdir join('/', splice([split('/', abs_path($0))] , 0, -1)) . '/..';
  push @INC, './lib'; 
}

use DB::PKG;
use Data::Dumper;
use v5.16;

my $trait_rs = $DB::PKG::db->resultset('TraitResult');
my $jobrq_rs = $DB::PKG::db->resultset('JobReq');
my $jobmt_rs = $DB::PKG::db->resultset('Jobmatch');
my @traitres = $trait_rs->all;
my @jobrqres = $jobrq_rs->search(undef, {order_by => [qw{jobid}]})->all;
my %bestfits;
my %wa;

sub average{
  my($data) = @_;
  if (not @$data) {
    die("Empty array\n");
  }
  my $total = 0;
  foreach (@$data) {
    $total += $_;
  }
  my $average = $total / @$data;
  return $average;
}

sub stdev{
  my($data) = @_;
  if(@$data == 1){
    return 0;
  }
  my $average = &average($data);
  my $sqtotal = 0;
  foreach(@$data) {
    $sqtotal += ($average-$_) ** 2;
  }
  my $std = ($sqtotal / (@$data-1)) ** 0.5;
  return $std;
}


$jobmt_rs->search({version => 'STDDEV'})->delete;
my $last;

sub perf {
  #find best matches
  my @bestfit;
  my $avg;
  my $jid;
  my $highest = { i => 0, v => 0 };
  for my $k (keys %wa) {
    $jid = $wa{$k}->{jobid};
    $avg = average( [@{$wa{$k}->{stddev}}] );
    my %d = (uid => $k, avg => $avg);
    my $index = push(@bestfit, \%d) - 1;
    $highest->{i} = $index if $avg > $highest->{v};
    $highest->{v} = $avg   if $avg > $highest->{v};
  }
  foreach my $bf (@bestfit) {
    $jobmt_rs->update_or_create({
      uid     => $bf->{uid},
      fval    => $bf->{avg},
      jid     => $jid,
      version => 'STDDEV',
    }, {
      key => 'jobmatches_uid_jid_version_key', 
    });
  }
}

for my $jobreq (@jobrqres) {
  if ($jobreq->jobid->id ne $last && defined $last) {
    perf;
 }
  undef %wa if $last ne $jobreq->jobid->id; #only do matching for this job;
  $last = $jobreq->jobid->id;
  for my $traitres (@traitres) {
    next if $jobreq->jmtid->id ne $traitres->jmtid->id;
    $wa{$traitres->uid->uid} = { jobid=>$last, stddev=>() } if !defined($wa{$traitres->uid->uid}->{stddev});
    my $stddev = stdev([$traitres->value, $jobreq->value]);
    push @{$wa{$traitres->uid->uid}->{stddev}}, (1+$stddev)/2;
  }
}

perf;
