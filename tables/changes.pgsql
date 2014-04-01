alter table degreetypes add column weighting integer;
update degreetypes set weighting = did;

alter table jobmatches alter column cval type text;

