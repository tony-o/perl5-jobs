package CareerMatch::Auth;
use Mojo::Base qw<Mojolicious::Controller>;
use Email::Address;
use DB::PKG;
use Digest::SHA qw{sha256_hex};

sub check {
  my ($self) = @_;
  $self->session->{'eventually'} = $self->req->url->path->{path} unless ($self->is_user_authenticated);
  $self->redirect_to('/login') and return 0 unless ($self->is_user_authenticated);
  return 1;
};

sub load_user {
  my ($self, $uid) = @_;
  my $users = $DB::PKG::db->resultset('User');
  my $ss    = $users->search({uid => $uid}, { columns => [qw<uid username usertype domain>] });
  while (my $s = $ss->next) {
    return $s;
  }
  return undef;

};

sub validate_user {
  my ($self, $user, $pass) = @_;
  my $users = $DB::PKG::db->resultset('User');
  my $ss    = $users->search({username => $user,}, { columns => [qw<uid pass>] });
  while (my $s = $ss->next) {
    my ($dpass, $salt) = split '\|', $s->pass;
    return $s->uid if chk_pass("$pass$salt") eq "$dpass";
  }
  return undef;
};

sub chk_pass {
  my $pass = shift;
  my $app  = 'P3LgjMxsqGpA0nn/GKkzHVG/jMsb4y+DOwv22OPEmTc';
  return sha256_hex("$app$pass");
}

sub check_user {
  my $user  = shift;
  my $users = $DB::PKG::db->resultset('User');
  my $ss    = $users->search({username => $user}, { columns => [qw<uid>] });
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
  my $usalt = sha256_hex(time);
  $data->{p} = chk_pass($data->{p} . $usalt) . "|$usalt";
  my $user    = $users->new({
    domain   => $email->host,
    username => $data->{u},
    pass     => $data->{p},
    usertype => $data->{t},
  });

  $user->insert;

  return $user->uid;
};

sub role {
  my $uid   = shift;
  my $crole = shift;
  my $roles = $DB::PKG::db->resultset('Arole');
  my $result = $roles->search({uid => $uid, "rid.name" => $crole}, { join => 'rid' })->count;
  return $result;
}

1;
