#!/bin/sh

cpanm   Mojolicious Plack DBD::Pg DBIx::Class::Schema Email::Address
plackup script/app
