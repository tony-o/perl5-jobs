package CareerMatch::Controller::Employer;
use Mojo::Base qw<Mojolicious::Controller>;
use DB::PKG;

sub dashboard {
  my $self = shift;
  my $db = $DB::PKG::db;
  my $user = $self->current_user;
  $self->stash(
    container => {
      uid       => $user->uid,
      employers => [$user->uid, $user->domain, $user->username, $user->pass],
      path      => 'employer',
    }
  );
};

sub joblist {
  my $self = shift;
  my $db = $DB::PKG::db;
  my $user = $self->current_user;

  my $jobset = $DB::PKG::db->resultset('Job');
  my $jobs   = $jobset->search({domain => $user->domain});
  my @jobs;
  while (my $job = $jobs->next) {
    push @jobs, $job;
  }
  $self->stash(
    container => {
      uid  => $user->uid,
      jobs => [@jobs],
      path => 'employer/joblist',
    }
  );
} 

sub emptyroute {
  my $self = shift;
  $self->redirect_to('/employer/dashboard');
  return 0;
};

1;
