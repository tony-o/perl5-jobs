
alter table skillsuser add column linkedinid varchar(16);
alter table skillsuser add unique (linkedinid);
