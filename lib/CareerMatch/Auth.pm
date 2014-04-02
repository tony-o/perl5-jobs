package CareerMatch::Auth;
use Mojo::Base qw<Mojolicious::Controller>;
use Mojo::UserAgent;
use Email::Address;
use DB::PKG;
use Digest::SHA qw{sha256_hex};
use JSON::Tiny qw<j>;
use Try::Tiny;
use XML::Simple;

#linked in auth
sub authli {
  my ($self) = @_;
  $self->render_later;
  my $URL = $self->req->{url}->base->{scheme} . '://' . $self->req->{url}->base->{host};
  $URL .= ':' . $self->req->{url}->base->{port} if defined $self->req->{url}->base->{port};


  if (!defined($self->param('code'))) {
    #get authorization
    $self->redirect_to('https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id=75f1aw5fq1yht9&scope=r_fullprofile%20r_emailaddress%20r_network&state=DEAAIR&redirect_uri=' . $URL . '/auth/li');
    return;
  }

  my $url = 'https://www.linkedin.com/uas/oauth2/accessToken?grant_type=authorization_code&code=' . $self->param('code') . '&redirect_uri=' . $URL . '/auth/li&client_id=75f1aw5fq1yht9&client_secret=otI80taiNVeM1gKI';

  my $delay = Mojo::IOLoop->delay(sub {
    my ($delay,$tx) = @_;
    my $j = j($tx->res->body);
    my $url = 'https://api.linkedin.com/v1/people/~:(educations,certifications,skills,languages,first-name,last-name,summary,positions,email-address)?oauth2_access_token=' . $j->{access_token};
    my $ndel = Mojo::IOLoop->delay(sub {
      my ($delay,$tx) = @_;
      my $xs = XML::Simple->new;
      my $xl = $xs->XMLin($tx->res->body);
      my ($email) = Email::Address->parse($xl->{'email-address'});
      my $urs   = $DB::PKG::db->resultset('User');
      my $users = {
        username => $xl->{'email-address'},
        pass     => 'linkedin',
        usertype => 'JS',
        domain   => $email->host,
        oauth    => $j->{'access_token'},
      };
      my $user = $urs->update_or_create($users, {
        key => 'p_users_username',
      });
      try {
        my @bioqs = $DB::PKG::db->resultset('Bioquestion')->all;
        my $bioqh = { };
        foreach my $a (@bioqs){
          $bioqh->{$a->linkedinmeta} = $a->id if defined $a->linkedinmeta;
        }
        my @bioanswers;
        for my $k (keys %{$bioqh}) {
          push @bioanswers, {
            uid => $user->id,
            qid => $bioqh->{$k},
            val => $xl->{$k},
          } if defined $xl->{$k};
        }
        my $answ = $DB::PKG::db->resultset('Bioanswer');
        map {
          $answ->update_or_create($_, {
            key => 'p_bioanswers_uid_qid',
          });
        } @bioanswers;
      };
      try {
        my @educations;
        my $edu = $DB::PKG::db->resultset('Education');
        foreach my $f (keys %{$xl->{educations}->{education}}) {
          my $e = $xl->{educations}->{education}->{$f};
          #use Data::Dumper; #say Dumper $e;
          my $hash = {
            institution => $e->{'school-name'},
            degree => $e->{degree},
            degdt => defined $e->{'end-date'} ? $e->{'end-date'}->{year} . '-01-01' : undef,
            linkedinid => $f,
            uid => $user->id,
          };
          push @educations, $hash;
        }
        
        map {
          $edu->update_or_create($_, {
            key => 'p_education_linkedinid',
          });
        } @educations;
      };
      try {
        my @positions;
        my $emp = $DB::PKG::db->resultset('Employer');
        foreach my $f (keys %{$xl->{positions}->{position}}) {
          my $e = $xl->{positions}->{position}->{$f};
          my $h = {
            employer => $e->{company}->{name},
            jobtitle => $e->{title},
            linkedinid => $f,
            uid => $user->id,
          };
          $h->{enddt}   = $e->{'end-date'}->{year} . '-' . $e->{'end-date'}->{month} . '-01' if defined($e->{'end-date'});
          $h->{startdt} = $e->{'start-date'}->{year} . '-' . $e->{'start-date'}->{month} . '-01' if defined($e->{'start-date'});
          push @positions, $h;
        }
        
        map {
          $emp->update_or_create($_, {
            key => 'p_employers_linkedinid',
          });
        } @positions;
      } catch { };
      try {
        my @skills;
        my $skill = $DB::PKG::db->resultset('Skillslist');
        my $skilu = $DB::PKG::db->resultset('Skillsuser');
        foreach my $s (keys %{$xl->{skills}->{skill}}) {
          try {
            my $e = $xl->{skills}->{skill}->{$s}->{skill}->{name};
            my $id = $skill->search({ skill => $skill })->first;
            $id = $skill->create({
              skill => $e,
            }) unless defined $id;
            my $gg = $skilu->update_or_create({
              sid        => $id->id,
              uid        => $user->id,
              linkedinid => $user->id . '_' . $s,
            }, {
              key => 'skillsuser_linkedinid_key', 
            });
          } catch {
              say 'error' . $_;
          };
        }
      } catch { };
      $self->session->{uid} = $user->id;
      $self->session->{oauthflag} = 'true';
      $self->authenticate($user->username, 'linkedin');
      redirect_auth($self);
    });
    $self->ua->get($url => $ndel->begin);
  });
  $self->ua->get($url => $delay->begin);
};

sub redirect_auth {
  my ($self) = @_;
  my $user = $self->current_user;
  my $emp = $DB::PKG::db->resultset('Employer');
  my $edu = $DB::PKG::db->resultset('Education');
  my $count = 0;

  $count += $emp->search({ uid => $user->id, jobclass => undef })->count;
  $count += $edu->search({ uid => $user->id, degreetype => undef })->count;

  $self->redirect_to('/jobseeker/linkedin') if $count > 0 && !defined($self->param('update'));
  $self->redirect_to($self->session->{eventually}) if defined($self->session->{eventually}) && $self->session->{eventually} ne '/login';
  undef $self->session->{eventually};
  $self->redirect_to('/employer') if $user->usertype eq 'EM';

  $self->redirect_to('/jobseeker') if $user->usertype eq 'JS';
  $self->redirect_to('/'); 
}

sub check {
  my ($self) = @_;
  $self->session->{'eventually'} = $self->req->url->path->{path} unless ($self->is_user_authenticated);
  $self->redirect_to('/login') and return 0 unless ($self->is_user_authenticated);
  return 1;
};

sub load_user {
  my ($self, $uid) = @_;
  my $users = $DB::PKG::db->resultset('User');
  my $ss    = $users->search({uid => $uid}, { columns => [qw<uid username usertype domain>] })->first;
  return $ss;
};

sub validate_user {
  my ($self, $user, $pass) = @_;
  my $users = $DB::PKG::db->resultset('User');
  my $ss    = $users->search({username => $user,}, { columns => [qw<uid pass>] });
  while (my $s = $ss->next) {
    return $s->uid if $self->session->{oauthflag} eq 'true';
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
