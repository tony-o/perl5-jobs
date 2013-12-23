create table if not exists jobclasses (
  jid serial,
  name varchar(60),
  isheader boolean default false,
  constraint p_jobclasses primary key (jid)

);
