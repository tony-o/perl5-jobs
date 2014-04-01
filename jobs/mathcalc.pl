#!/usr/bin/env perl

BEGIN { 
  use Cwd qw<abs_path>;
  chdir join('/', splice([split('/', abs_path($0))] , 0, -1)) . '/..';
  push @INC, './lib'; 
}

use DB::PKG;
use Data::Dumper;
use Try::Tiny;
use v5.16;

my $jobmt_rs = $DB::PKG::db->resultset('Jobmatch');
my $matches  = $jobmt_rs->search(undef, {
  distinct => 1,
  columns  => [qw<uid jid>],
  order_by => [qw<jid>],
});

say join "\t", 'uid', 'jid', 'aedu', 'aexp', 'redu', 'rexp', 'sedu', 'sexp', 'sstd', 'score';
$jobmt_rs->search({
  -or => { version => [qw<SCORE SCOREPERS SCOREEXP SCOREEDU>] },
})->delete;
while (my $uidjid = $matches->next) {
  my $act_edu = -1;
  my $act_exp = 0;
  my $min_exp = 0;
  my $min_edu = -1;
  my $std_score = 0;
  try {
    $act_edu = $jobmt_rs->search({
      jid => $uidjid->jid->jid,
      uid => $uidjid->uid->uid, 
      version => 'EDUCTN',
    })->first->fval;
  };
  try {
    $act_exp = $jobmt_rs->search({
      jid => $uidjid->jid->jid,
      uid => $uidjid->uid->uid, 
      version => 'YREXP',
    })->first->fval;
  };
  try {
    $std_score = $jobmt_rs->search({
      jid => $uidjid->jid->jid,
      uid => $uidjid->uid->uid, 
      version => 'STDDEV',
    })->first->fval;
    my $minmax = $jobmt_rs->search({
      jid => $uidjid->jid->jid,
      version => 'STDDEV',
    })->get_column('fval');
    $std_score = ($std_score - $minmax->min) / ($minmax->max - $minmax->min);

  };
  $min_exp = $uidjid->jid->expreq               if defined $uidjid->jid->expreq;
  $min_edu = $uidjid->jid->degreereq->weighting if defined $uidjid->jid->degreereq;
  
  my $edu_score;
  $edu_score = $act_edu / $min_edu if defined $min_edu && $min_edu > -1;
  $edu_score = 1 if !defined $edu_score || $edu_score > 1;
  $edu_score = 0 if $edu_score < 0;

  my $exp_score;
  $exp_score = $act_exp / $min_exp if defined $min_exp && $min_exp > 0;
  $exp_score = 1 if !defined $exp_score || $exp_score > 1;
  $exp_score = 0 if $exp_score < 0;
  
  my $score;

  $score = (.4 * $std_score) + (.3 * $exp_score) + (.3 * $edu_score);

  $jobmt_rs->create({
    jid => $uidjid->jid->jid,
    uid => $uidjid->uid->uid, 
    fval => $score,
    version => 'SCORE',
  });
  $jobmt_rs->create({
    jid => $uidjid->jid->jid,
    uid => $uidjid->uid->uid, 
    fval => $std_score,
    version => 'SCOREPERS',
  });
  $jobmt_rs->create({
    jid => $uidjid->jid->jid,
    uid => $uidjid->uid->uid, 
    fval => $exp_score,
    version => 'SCOREEXP',
  });
  $jobmt_rs->create({
    jid => $uidjid->jid->jid,
    uid => $uidjid->uid->uid, 
    fval => $edu_score,
    version => 'SCOREEDU',
  });

  say join "\t", $uidjid->uid->uid, $uidjid->jid->jid, $act_edu, sprintf('%.2f',$act_exp), $min_edu, $min_exp, sprintf('%.2f', $edu_score), sprintf('%.2f', $exp_score), sprintf('%.2f', $std_score), sprintf('%.2f', $score);
}

