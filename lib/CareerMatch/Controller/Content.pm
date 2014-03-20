package CareerMatch::Controller::Content;
use Mojo::Base qw<Mojolicious::Controller>;
use Digest::Adler32::XS;
use DB::PKG;

sub main {
  my $self = shift;
  my $path = '/' . $self->stash->{path};
  my $content = $DB::PKG::db->resultset('StaticContent')->search({ spath => $path })->first;
  return 0 if !defined $content;
  $self->stash(
    container => {
      #uid  => $user,
      #utype => $user ? $user->usertype : '',
      path => 'home',
      static_content => $content->scontent,
    }
  );
  $self->render(template => 'controller/content/main');
};


sub recordvideo {
  my $self = shift;
  my $db   = $DB::PKG::db;
  my $validreq = $db->resultset('Videorequest')->search({rid => $self->param('rid')})->first;
  my @errors; 

  push @errors, 'ENOREQ' if !defined $validreq;

  say $validreq->rid;
  $self->stash(container => {
    errors  => \@errors,
    request => $validreq,
  });

};

sub submitvideo {
  my ($self) = @_;
  my $request = $DB::PKG::db->resultset('Videorequest')->search({ rid => $self->param('rid') })->first;
  if (defined $request) {
    my $user = $request->uid;
    my $config = $self->app->config('videodir');
    my $adler  = Digest::Adler32::XS->new;
    my $upload = $self->req->upload('file');
    open my $star, '<', $upload->asset->path;
    $adler->addfile($star);
    close $star;
    my $newdir = $config . '/' . $user->uid . '/';
    File::Path::make_path($newdir);
    my $fpath = "$newdir" . $adler->hexdigest;
    $upload->move_to($fpath);
    $request->update({
      vidpath => $fpath,
    });
    
    #SEND EMPLOYER EMAIL!!!!!!!!
    my @emails = $DB::PKG::db->resultset('User')->search({ domain => $user->domain })->all;
    my $URL = $self->req->{url}->base->{scheme} . '://' . $self->req->{url}->base->{host};
    my $emailstr;
    map { $emailstr .= $_->username . ';' } @emails;
    $self->mail(
      to => $emailstr,
      subject => 'A video was submitted for: ' . $request->jid->title,
      data => "<a href=\"$URL/employers/jobview/" . $request->jid->jid . "\">Click here to review videos for this job!</a>",
    );
  }
  $self->stash(
    container => {

    }
  );
};

1;
