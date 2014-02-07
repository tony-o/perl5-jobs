create table if not exists job_reqs_precanned ( 
  id    serial,
  jmtid integer references jobmatchtraits (id),
  jid   integer references jobclasses     (jid),
  value float,
  version integer default 1, 
  constraint p_job_reqs_precanned primary key (id)
);

