create table if not exists jobmatchtraits (
  id serial,
  name varchar(40),
  flags varchar(20),
  constraint p_jobmatchtraits primary key (id)
);

create table if not exists jobmatches (
  id serial,
  uid integer references users (uid),
  jid integer references jobs (jid),
  fval float,
  cval varchar(32),
  version varchar(10),
  constraint p_jobmatches primary key (id)
);

create table if not exists job_reqs ( 
  id    serial,
  jmtid integer references jobmatchtraits (id),
  jobid integer references jobs (jid),
  value float,
  version integer default 1, 
  constraint p_job_reqs primary key (id)
);

create table if not exists trait_results (
  id serial,
  uid   integer references users (uid),
  jmtid integer references jobmatchtraits (id),
  value float,
  constraint p_trait_results primary key (id),
  constraint p_trait_results_uid_jmtid unique (uid,jmtid)
);

