create table if not exists videorequests (
  id serial,
  uid integer references users (uid),
  jid integer references jobs (jid),
  CONSTRAINT p_videorequests PRIMARY KEY (id)
);

alter table videorequests add column rid varchar(64);
truncate table videorequests;
alter table videorequests add constraint p_videorequests_uid_jid unique (jid, uid);
