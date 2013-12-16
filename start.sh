#!/bin/sh

cpanm   Mojolicious Plack DBD::Pg DBIx::Class::Schema
plackup script/app
