#!/bin/sh

cpanm     Mojolicious Plack DBD::Pg DBIx::Class::Schema Email::Address Mojo::Server::Hypnotoad
git       pull
hypnotoad script/app
