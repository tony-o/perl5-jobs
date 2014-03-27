create table if not exists videorequests (
  id serial,
  uid integer references users (uid),
  jid integer references jobs (jid),
  CONSTRAINT p_videorequests PRIMARY KEY (id)
);

alter table videorequests add column rid varchar(64);
truncate table videorequests;
alter table videorequests add constraint p_videorequests_uid_jid unique (jid, uid);
alter table videorequests add column vidpath varchar(512);

truncate table degreetypes cascade;
insert into degreetypes (name) values ('Professional Certification'), ('Associates Degree'), ('Bachelor''s Degree'), ('Master''s Degree'), ('Doctorate''s Degree'), ('Juris Doctor');
insert into states (id, name) values (-1, 'Not specified');
insert into degreetypes (did, name) values (-1, 'Not specified');
alter table jobs add column degreereq integer references degreetypes (did);

