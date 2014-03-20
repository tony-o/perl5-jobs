#!/bin/sh

cpanm     Config::General Mojolicious Plack DBD::Pg DBIx::Class::Schema Email::Address Mojo::Server::Hypnotoad Mojolicious::Plugin::Authentication LWP::Simple LWP Mojolicious::Plugin::Human JSON::Tiny XML::Simple IO::Socket::SSL Digest::Adler32::XS
git       pull
hypnotoad -f script/app
