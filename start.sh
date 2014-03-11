#!/bin/sh

cpanm     Config::General Mojolicious Plack DBD::Pg DBIx::Class::Schema Email::Address Mojo::Server::Hypnotoad Mojolicious::Plugin::Authentication LWP::Simple LWP
git       pull
hypnotoad -f script/app
