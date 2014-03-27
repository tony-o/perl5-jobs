#!/usr/bin/env perl

BEGIN { 
  use Cwd qw<abs_path>;
  chdir join('/', splice([split('/', abs_path($0))] , 0, -1)) . '/..';
  push @INC, './lib'; 
}

use v5.16;
use Try::Tiny;
use DB::PKG;

my $db = $DB::PKG::db;

my $trait_resp  = $db->resultset('Personalitytrait');
my $trait_store = $db->resultset('TraitResult');
my $trait_deets = $db->resultset('Personalityresponse');
my $trait_map   = $db->resultset('Jobmatchtrait');
my $scores;
my $lastid;
map {
  $scores->{$_->uid->uid}->{uc $_->qid->flags}->{score} += $_->rid->fval if $_->qid->set == 1;
  if ($_->qid->set == 2) {
    my $min = $trait_deets->search({ set => $_->qid->set })->get_column('fval')->min; 
    my $max = $trait_deets->search({ set => $_->qid->set })->get_column('fval')->max; 
    $scores->{$_->uid->uid}->{uc $_->qid->flags}->{score} += ($max - $min + 1) - ($_->rid->fval + $min);
  }
  $scores->{$_->uid->uid}->{uc $_->qid->flags}->{questions}++;

} $trait_resp->search(undef, { order_by => { -asc => [qw<uid>] } })->all;

use Data::Dumper;
my @traits = $trait_map->search(undef)->all;
map {
  my $cra = $scores->{$_};
  my $update = {
    uid => $_,
  };
  map { 
    $trait_store->update_or_create({
      uid   => $update->{uid},
      jmtid => $_->id,
      value => $cra->{uc $_->flags}->{score} / (7 * $cra->{uc $_->flags}->{questions}),
    }, {
      key => 'p_trait_results_uid_jmtid', 
    });
  } @traits;
} keys %{$scores};
