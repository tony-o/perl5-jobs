create table if not exists jobs (
  jid serial,
  domain varchar(128),
  title  varchar(128),
  description text,
  jobclass integer references jobclasses (jid),
  dateposted timestamp default now(),
  constraint p_jobs primary key (jid)
);
