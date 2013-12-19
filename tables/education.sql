create table if not exists education (
  eid         serial,
  uid         integer references users ( uid ),
  institution varchar(120),
  address1    varchar(128),
  address2    varchar(128),
  city        varchar(45),
  state       integer references states ( id ),
  postalcode  varchar(11),
  phone       varchar(10),
  degreetype  integer references degreetypes ( did ),
  degree      varchar(128),
  constraint p_education primary key (eid)
);
