create table if not exists bioquestions (
  id serial,
  question varchar(40),
  weight integer,
  constraint p_bioquestions primary key (id)
);

create table if not exists bioanswers (
  id   serial,
  uid  integer references users (uid),
  qid  integer references bioquestions (id),
  val  text,
  constraint p_bioanswers primary key (id),
  constraint p_bioanswers_uid_qid unique (uid,qid)
);
