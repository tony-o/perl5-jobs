#!/bin/sh

cpanm   Mojolicious Plack DBD::Pg DBIx::Class::Schema Email::Address
git     pull
hypnotoad script/app
