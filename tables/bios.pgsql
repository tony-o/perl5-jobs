create table if not exists bioquestions (
  id serial,
  question varchar(40),
  constraint p_bioquestions primary key (id)
);

create table if not exists bioanswers (
  id   serial,
  uid  integer references users (uid),
  qid  integer references bioquestions (id),
  val  text,
  constraint p_bioanswers primary key (id)
);
