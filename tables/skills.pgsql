create table if not exists skillslist (
  id    serial,
  skill varchar(40),
  constraint p_skillslist primary key (id) 
);

create table if not exists skillsuser (
  id    serial,
  sid   integer references skillslist (id),
  uid   integer references users      (uid),
  constraint p_skillsuser primary key (id) 
);
