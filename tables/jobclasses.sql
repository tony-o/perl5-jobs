create table if not exists jobclasses (
  jid serial,
  name varchar(40),
  constraint p_jobclasses primary key (jid)

);
