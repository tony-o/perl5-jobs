#!/bin/sh

pg_dump -a -d jobs -t "roles" > bootstrap.data.pgsql
pg_dump -a -d jobs -t "states" >> bootstrap.data.pgsql
pg_dump -a -d jobs -t "personalityquestions" >> bootstrap.data.pgsql
pg_dump -a -d jobs -t "personalityresponses" >> bootstrap.data.pgsql
pg_dump -a -d jobs -t "bioquestions" >> bootstrap.data.pgsql
pg_dump -a -d jobs -t "degreetypes" >> bootstrap.data.pgsql
pg_dump -a -d jobs -t "jobclasses" >> bootstrap.data.pgsql
pg_dump -a -d jobs -t "jobmatchtraits" >> bootstrap.data.pgsql
pg_dump -a -d jobs -t "job_reqs_precanned" >> bootstrap.data.pgsql
