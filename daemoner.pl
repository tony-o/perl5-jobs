#!/usr/bin/env perl 

use v5.16; 
use Mojo::Server::Morbo;

my $morbo = Mojo::Server::Morbo->new;
my $watch = $morbo->watch([
  './templates',
  './lib',
]);

$morbo->run('script/app');
