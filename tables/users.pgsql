create table if not exists users (
  uid      serial,
  domain   varchar(128),
  username varchar(128),
  pass     varchar(128),
  usertype varchar(2) default 'JS',
  datecreated timestamp default now(),
  constraint p_users primary key (uid) 
);
