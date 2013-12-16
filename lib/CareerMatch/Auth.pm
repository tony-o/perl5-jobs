package CareerMatch::Auth;
use Mojo::Base qw<Mojolicious::Controller>;
use Email::Address;
use DB::PKG;

sub check {
  my ($self) = @_;
  $self->session->{'eventually'} = $self->req->url->path->{path} unless ($self->is_user_authenticated);
  $self->redirect_to('/login') and return 0 unless ($self->is_user_authenticated);
  return 1;
};

sub load_user {
  my ($self, $uid) = @_;
  my $users = $DB::PKG::db->resultset('User');
  my $ss    = $users->search({uid => $uid}, { columns => [qw<uid username domain>] });
  while (my $s = $ss->next) {
    return $s;
  }
  return undef;

};

sub validate_user {
  my ($self, $user, $pass) = @_;
  my $users = $DB::PKG::db->resultset('User');
  my $ss    = $users->search({username => $user, pass => $pass}, { columns => qw<uid> });
  while (my $s = $ss->next) {
    return $s->uid;
  }
  return undef;
};

sub check_user {
  my $user  = shift;
  my $users = $DB::PKG::db->resultset('User');
  my $ss    = $users->search({username => $user}, { columns => qw<uid> });
  while (my $s = $ss->next) {
    return $s->uid;
  }
  return undef;
};

sub register_user {
  my $data    = shift;
  my $users   = $DB::PKG::db->resultset('User');
  my ($email) = Email::Address->parse($data->{u});
  my $user    = $users->new({
    domain   => $email->host,
    username => $data->{u},
    pass     => $data->{p},
    usertype => $data->{t},
  });

  $user->insert;

  return $user->uid;
};



1;
