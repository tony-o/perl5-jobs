#!/usr/bin/env perl


BEGIN { 
  use Cwd qw<abs_path>;
  chdir join('/', splice([split('/', abs_path($0))] , 0, -1)) . '/..';
  push @INC, './lib'; 
}

use Try::Tiny;
use DB::PKG;
use DateTime;
use DateTime::Format::Pg;
use Data::Dumper;
use v5.16;

my $jobrq_rs = $DB::PKG::db->resultset('Job');
my $empls_rs = $DB::PKG::db->resultset('Employer');
my $jobmt_rs = $DB::PKG::db->resultset('Jobmatch');
my @empls    = $empls_rs->all;
my @jobrqres = $jobrq_rs->search(undef)->all;
my %bestfits;
my %wa;
$jobmt_rs->search({version => 'YREXP'})->delete;
my $last;
my $dt1;
my $dt2;

for my $jobreq (@jobrqres) {
  if ($last != $jobreq->id) {
    #insert;
    foreach my $rid (keys %wa) {
      $wa{$rid}->{fval} = $wa{$rid}->{fval} / 365;
      $jobmt_rs->update_or_create($wa{$rid}, { key => 'jobmatches_uid_jid_version_key', });
    }
    undef %wa;
  }
  $last = $jobreq->id;
  foreach my $e (@empls) {
    next if !defined($e->jobclass) && defined($jobreq->expreq) && $jobreq->expreq > 0;
    next if defined($jobreq->jobclass) && defined($e->jobclass) && $e->jobclass->id != $jobreq->jobclass->id;
    next if defined($jobreq->jobclass) && !defined($e->jobclass);
    $wa{$e->uid->uid} = {
      uid  => $e->uid->uid,
      fval => 0,
      jid  => $jobreq->id,
      version => 'YREXP',
    } unless defined $wa{$e->uid->uid};
    $dt1 = DateTime::Format::Pg->parse_datetime($e->startdt);
    try {
      die 'dead' unless defined($e->enddt);
      $dt2 = DateTime::Format::Pg->parse_datetime($e->enddt);
      CATCH { default {
        $dt2 = DateTime->new unless defined $e->enddt;
      } };
    };
    my $days = $dt2->delta_days($dt1)->delta_days;

    $wa{$e->uid->uid}->{fval} += $days; 
 }
}

