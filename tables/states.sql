create table if not exists states (
  id   serial,
  name varchar(60),
  constraint p_states primary key (id)
);
