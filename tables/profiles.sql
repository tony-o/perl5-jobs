create table if not exists profiles (
  pid        serial,
  uid        integer references users ( uid ),
  firstname  varchar(45),
  lastname   varchar(45),
  address1   varchar(128),
  address2   varchar(128),
  city       varchar(45),
  state      integer references states ( id ),
  postalcode varchar(11),
  phone      varchar(10),
  relocateok boolean,
  salarylow  integer,
  salaryhigh integer,
  constraint p_profiles primary key ( pid ),
  unique     ( uid )
);
