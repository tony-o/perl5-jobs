create table if not exists employers (
  eid      serial,
  uid      integer references users ( uid ),
  employer varchar(80),
  jobtitle varchar(80),
  city     varchar(45),
  state    integer references states ( id ),
  jobclass integer references jobclasses ( jid ),
  startdt  date,
  enddt    date,
  constraint p_employers primary key (eid)
);
