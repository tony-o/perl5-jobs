package CareerMatch::Auth;
use Mojo::Base qw<Mojolicious::Controller>;
use Email::Address;
use DB::PKG;
use Digest::SHA qw{sha256_base64};

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
  $pass = chk_pass($pass);
  my $users = $DB::PKG::db->resultset('User');
  my $ss    = $users->search({username => $user, pass => $pass}, { columns => qw<uid> });
  while (my $s = $ss->next) {
    return $s->uid;
  }
  return undef;
};

sub chk_pass {
  my $pass = shift;
  return sha256_base64($pass . 'P3LgjMxsqGpA0nn/GKkzHVG/jMsb4y+DOwv22OPEmTc');
}

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
  return -1 if (!defined($email));
  $data->{p} = chk_pass($data->{p});
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
