create table if not exists roles (
  id   serial,
  name varchar(60),
  constraint p_roles primary key (id)
);

create table if not exists aroles (
  id  serial,
  rid integer references roles (id),
  uid integer references users (uid),
  constraint p_aroles primary key (id),
  constraint p_aroles_rid_uid unique (rid, uid)
);
