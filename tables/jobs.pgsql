create table if not exists jobs (
  jid serial,
  domain varchar(128),
  title  varchar(128),
  description text,
  dateposted timestamp default now(),
  constraint p_jobs primary key (jid)
);
