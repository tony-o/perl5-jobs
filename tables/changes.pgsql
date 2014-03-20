create table if not exists videorequests (
  id serial,
  uid integer references users (uid),
  jid integer references jobs (jid),
  CONSTRAINT p_videorequests PRIMARY KEY (id)
);
