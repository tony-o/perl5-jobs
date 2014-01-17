create table if not exists personalityquestions (
  id       serial,
  question varchar(128),
  weight   integer,
  testname varchar(20),
  flags    varchar(20),
  set      integer,
  constraint p_personalityquestions primary key (id)
);

create table if not exists personalityresponses (
  id       serial,
  response varchar(128),
  testname varchar(20),
  set      integer,
  weight   integer,
  constraint p_personalityresponses primary key (id)
);


create table if not exists personalitytraits (
  id  serial,
  uid integer references users ( uid ),
  qid integer references personalityquestions ( id ),
  rid integer references personalityresponses ( id ),
  constraint p_personalitytraits primary key (id),
  constraint p_personalitytraits_uid_qid unique (uid,qid)
);
