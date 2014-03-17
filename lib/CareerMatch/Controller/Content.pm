package CareerMatch::Controller::Content;
use Mojo::Base qw<Mojolicious::Controller>;
use DB::PKG;

sub main {
  my $self = shift;
  my $path = '/' . $self->stash->{path};
  my $content = $DB::PKG::db->resultset('StaticContent')->search({ spath => $path })->first;
  say $path;
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

1;
