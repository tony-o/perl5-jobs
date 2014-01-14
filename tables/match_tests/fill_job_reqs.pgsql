truncate table jobmatchtraits cascade;
insert into jobmatchtraits (id,name) values (1,'Conscientiousness');
insert into jobmatchtraits (id,name) values (2,'Agreeableness');
insert into jobmatchtraits (id,name) values (3,'Neuroticism');
insert into jobmatchtraits (id,name) values (4,'Openness');
insert into jobmatchtraits (id,name) values (5,'Extroversion');

delete from jobs where jid >= 1000;

truncate table job_reqs;
--manager 1
insert into jobs (domain,title,description,jid) values ('hirenetics.com','manager 1', 'manager 1', 1000);
insert into job_reqs (jmtid,jobid,value) values (1,1000,95);
insert into job_reqs (jmtid,jobid,value) values (2,1000,89);
insert into job_reqs (jmtid,jobid,value) values (3,1000,69);
insert into job_reqs (jmtid,jobid,value) values (4,1000,92);
insert into job_reqs (jmtid,jobid,value) values (5,1000,90);

--manager 2
insert into jobs (domain,title,description,jid) values ('hirenetics.com','manager 2', 'manager 2', 1001);
insert into job_reqs (jmtid,jobid,value) values (1,1001,50);
insert into job_reqs (jmtid,jobid,value) values (2,1001,72);
insert into job_reqs (jmtid,jobid,value) values (3,1001,74);
insert into job_reqs (jmtid,jobid,value) values (4,1001,65);
insert into job_reqs (jmtid,jobid,value) values (5,1001,80);

--manager 3 | 70%  80% 14% 50% 67%
insert into jobs (domain,title,description,jid) values ('hirenetics.com','manager 3', 'manager 3', 1002);
insert into job_reqs (jmtid,jobid,value) values (1,1002,70);
insert into job_reqs (jmtid,jobid,value) values (2,1002,80);
insert into job_reqs (jmtid,jobid,value) values (3,1002,14);
insert into job_reqs (jmtid,jobid,value) values (4,1002,50);
insert into job_reqs (jmtid,jobid,value) values (5,1002,67);

--manager 4 | 90%  91% 61% 78% 80%
insert into jobs (domain,title,description,jid) values ('hirenetics.com','manager 4', 'manager 4', 1003);
insert into job_reqs (jmtid,jobid,value) values (1,1003,90);
insert into job_reqs (jmtid,jobid,value) values (2,1003,91);
insert into job_reqs (jmtid,jobid,value) values (3,1003,61);
insert into job_reqs (jmtid,jobid,value) values (4,1003,78);
insert into job_reqs (jmtid,jobid,value) values (5,1003,80);

--manager 5 | 40%  90% 60% 91% 70%
insert into jobs (domain,title,description,jid) values ('hirenetics.com','manager 5', 'manager 5', 1004);
insert into job_reqs (jmtid,jobid,value) values (1,1004,40);
insert into job_reqs (jmtid,jobid,value) values (2,1004,90);
insert into job_reqs (jmtid,jobid,value) values (3,1004,60);
insert into job_reqs (jmtid,jobid,value) values (4,1004,91);
insert into job_reqs (jmtid,jobid,value) values (5,1004,70);

--manager 6 | 92%  91% 80% 94% 90%
insert into jobs (domain,title,description,jid) values ('hirenetics.com','manager 6', 'manager 6', 1005);
insert into job_reqs (jmtid,jobid,value) values (1,1005,92);
insert into job_reqs (jmtid,jobid,value) values (2,1005,91);
insert into job_reqs (jmtid,jobid,value) values (3,1005,80);
insert into job_reqs (jmtid,jobid,value) values (4,1005,94);
insert into job_reqs (jmtid,jobid,value) values (5,1005,90);

--CS/SUPPORT 
--95% 65% 62% 78% 98%
--99% 56% 23% 89% 91%
--95% 66% 78% 65% 80%
--90% 89% 79% 95% 96%
--80% 70% 50% 80% 80%
--60% 98% 45% 98% 80%
insert into jobs (domain,title,description,jid) values ('hirenetics.com','cs_support 1', 'cs_support 1', 1006);
insert into job_reqs (jmtid,jobid,value) values (1,1006,95);
insert into job_reqs (jmtid,jobid,value) values (2,1006,65);
insert into job_reqs (jmtid,jobid,value) values (3,1006,62);
insert into job_reqs (jmtid,jobid,value) values (4,1006,78);
insert into job_reqs (jmtid,jobid,value) values (5,1006,98);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','cs_support 2', 'cs_support 2', 1007);
insert into job_reqs (jmtid,jobid,value) values (1,1007,99);
insert into job_reqs (jmtid,jobid,value) values (2,1007,56);
insert into job_reqs (jmtid,jobid,value) values (3,1007,23);
insert into job_reqs (jmtid,jobid,value) values (4,1007,89);
insert into job_reqs (jmtid,jobid,value) values (5,1007,91);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','cs_support 3', 'cs_support 3', 1008);
insert into job_reqs (jmtid,jobid,value) values (1,1008,95);
insert into job_reqs (jmtid,jobid,value) values (2,1008,66);
insert into job_reqs (jmtid,jobid,value) values (3,1008,78);
insert into job_reqs (jmtid,jobid,value) values (4,1008,65);
insert into job_reqs (jmtid,jobid,value) values (5,1008,80);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','cs_support 4', 'cs_support 4', 1009);
insert into job_reqs (jmtid,jobid,value) values (1,1009,90);
insert into job_reqs (jmtid,jobid,value) values (2,1009,89);
insert into job_reqs (jmtid,jobid,value) values (3,1009,79);
insert into job_reqs (jmtid,jobid,value) values (4,1009,95);
insert into job_reqs (jmtid,jobid,value) values (5,1009,96);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','cs_support 5', 'cs_support 5', 1010);
insert into job_reqs (jmtid,jobid,value) values (1,1010,80);
insert into job_reqs (jmtid,jobid,value) values (2,1010,70);
insert into job_reqs (jmtid,jobid,value) values (3,1010,50);
insert into job_reqs (jmtid,jobid,value) values (4,1010,80);
insert into job_reqs (jmtid,jobid,value) values (5,1010,80);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','cs_support 6', 'cs_support 6', 1011);
insert into job_reqs (jmtid,jobid,value) values (1,1011,60);
insert into job_reqs (jmtid,jobid,value) values (2,1011,98);
insert into job_reqs (jmtid,jobid,value) values (3,1011,45);
insert into job_reqs (jmtid,jobid,value) values (4,1011,98);
insert into job_reqs (jmtid,jobid,value) values (5,1011,80);

insert into jobs (domain,title,description,jid) values ('hirenetics.com','Sales 1','Sales 1',1012);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','Sales 2','Sales 2',1013);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','Sales 3','Sales 3',1014);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','Sales 4','Sales 4',1015);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','Sales 5','Sales 5',1016);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','Sales 6','Sales 6',1017);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','IT 1','IT 1',1018);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','IT 2','IT 2',1019);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','IT 3','IT 3',1020);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','IT 4','IT 4',1021);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','IT 5','IT 5',1022);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','IT 6','IT 6',1023);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','Accounting 1','Accounting 1',1024);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','Accounting 2','Accounting 2',1025);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','Accounting 3','Accounting 3',1026);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','Accounting 4','Accounting 4',1027);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','Accounting 5','Accounting 5',1028);
insert into jobs (domain,title,description,jid) values ('hirenetics.com','Accounting 6','Accounting 6',1029);

insert into job_reqs (jmtid,jobid,value) values (1,1012,80);  insert into job_reqs (jmtid,jobid,value) values (2,1012,90);  insert into job_reqs (jmtid,jobid,value) values (3,1012,50);  insert into job_reqs (jmtid,jobid,value) values (4,1012,90);  insert into job_reqs (jmtid,jobid,value) values (5,1012,92);
insert into job_reqs (jmtid,jobid,value) values (1,1013,87);  insert into job_reqs (jmtid,jobid,value) values (2,1013,79);  insert into job_reqs (jmtid,jobid,value) values (3,1013,99);  insert into job_reqs (jmtid,jobid,value) values (4,1013,88);  insert into job_reqs (jmtid,jobid,value) values (5,1013,91);
insert into job_reqs (jmtid,jobid,value) values (1,1014,99);  insert into job_reqs (jmtid,jobid,value) values (2,1014,50);  insert into job_reqs (jmtid,jobid,value) values (3,1014,95);  insert into job_reqs (jmtid,jobid,value) values (4,1014,80);  insert into job_reqs (jmtid,jobid,value) values (5,1014,82);
insert into job_reqs (jmtid,jobid,value) values (1,1015,89);  insert into job_reqs (jmtid,jobid,value) values (2,1015,88);  insert into job_reqs (jmtid,jobid,value) values (3,1015,61);  insert into job_reqs (jmtid,jobid,value) values (4,1015,88);  insert into job_reqs (jmtid,jobid,value) values (5,1015,89);
insert into job_reqs (jmtid,jobid,value) values (1,1016,88);  insert into job_reqs (jmtid,jobid,value) values (2,1016,89);  insert into job_reqs (jmtid,jobid,value) values (3,1016,60);  insert into job_reqs (jmtid,jobid,value) values (4,1016,89);  insert into job_reqs (jmtid,jobid,value) values (5,1016,88);
insert into job_reqs (jmtid,jobid,value) values (1,1017,99);  insert into job_reqs (jmtid,jobid,value) values (2,1017,98);  insert into job_reqs (jmtid,jobid,value) values (3,1017,88);  insert into job_reqs (jmtid,jobid,value) values (4,1017,96);  insert into job_reqs (jmtid,jobid,value) values (5,1017,90);
insert into job_reqs (jmtid,jobid,value) values (1,1018,68);  insert into job_reqs (jmtid,jobid,value) values (2,1018,78);  insert into job_reqs (jmtid,jobid,value) values (3,1018,77);  insert into job_reqs (jmtid,jobid,value) values (4,1018,80);  insert into job_reqs (jmtid,jobid,value) values (5,1018,50);
insert into job_reqs (jmtid,jobid,value) values (1,1019,98);  insert into job_reqs (jmtid,jobid,value) values (2,1019,88);  insert into job_reqs (jmtid,jobid,value) values (3,1019,78);  insert into job_reqs (jmtid,jobid,value) values (4,1019,98);  insert into job_reqs (jmtid,jobid,value) values (5,1019,68);
insert into job_reqs (jmtid,jobid,value) values (1,1020,99);  insert into job_reqs (jmtid,jobid,value) values (2,1020,98);  insert into job_reqs (jmtid,jobid,value) values (3,1020,80);  insert into job_reqs (jmtid,jobid,value) values (4,1020,80);  insert into job_reqs (jmtid,jobid,value) values (5,1020,70);
insert into job_reqs (jmtid,jobid,value) values (1,1021,88);  insert into job_reqs (jmtid,jobid,value) values (2,1021,98);  insert into job_reqs (jmtid,jobid,value) values (3,1021,84);  insert into job_reqs (jmtid,jobid,value) values (4,1021,81);  insert into job_reqs (jmtid,jobid,value) values (5,1021,77);
insert into job_reqs (jmtid,jobid,value) values (1,1022,71);  insert into job_reqs (jmtid,jobid,value) values (2,1022,99);  insert into job_reqs (jmtid,jobid,value) values (3,1022,50);  insert into job_reqs (jmtid,jobid,value) values (4,1022,99);  insert into job_reqs (jmtid,jobid,value) values (5,1022,50);
insert into job_reqs (jmtid,jobid,value) values (1,1023,92);  insert into job_reqs (jmtid,jobid,value) values (2,1023,93);  insert into job_reqs (jmtid,jobid,value) values (3,1023,55);  insert into job_reqs (jmtid,jobid,value) values (4,1023,94);  insert into job_reqs (jmtid,jobid,value) values (5,1023,78);
insert into job_reqs (jmtid,jobid,value) values (1,1024,66);  insert into job_reqs (jmtid,jobid,value) values (2,1024,96);  insert into job_reqs (jmtid,jobid,value) values (3,1024,74);  insert into job_reqs (jmtid,jobid,value) values (4,1024,12);  insert into job_reqs (jmtid,jobid,value) values (5,1024,11);
insert into job_reqs (jmtid,jobid,value) values (1,1025,88);  insert into job_reqs (jmtid,jobid,value) values (2,1025,98);  insert into job_reqs (jmtid,jobid,value) values (3,1025,68);  insert into job_reqs (jmtid,jobid,value) values (4,1025,89);  insert into job_reqs (jmtid,jobid,value) values (5,1025,64);
insert into job_reqs (jmtid,jobid,value) values (1,1026,66);  insert into job_reqs (jmtid,jobid,value) values (2,1026,68);  insert into job_reqs (jmtid,jobid,value) values (3,1026,23);  insert into job_reqs (jmtid,jobid,value) values (4,1026,66);  insert into job_reqs (jmtid,jobid,value) values (5,1026,61);
insert into job_reqs (jmtid,jobid,value) values (1,1027,99);  insert into job_reqs (jmtid,jobid,value) values (2,1027,25);  insert into job_reqs (jmtid,jobid,value) values (3,1027,88);  insert into job_reqs (jmtid,jobid,value) values (4,1027,98);  insert into job_reqs (jmtid,jobid,value) values (5,1027,95);
insert into job_reqs (jmtid,jobid,value) values (1,1028,99);  insert into job_reqs (jmtid,jobid,value) values (2,1028,99);  insert into job_reqs (jmtid,jobid,value) values (3,1028,12);  insert into job_reqs (jmtid,jobid,value) values (4,1028,88);  insert into job_reqs (jmtid,jobid,value) values (5,1028,78);
insert into job_reqs (jmtid,jobid,value) values (1,1029,100); insert into job_reqs (jmtid,jobid,value) values (2,1029,100); insert into job_reqs (jmtid,jobid,value) values (3,1029,55);  insert into job_reqs (jmtid,jobid,value) values (4,1029,66);  insert into job_reqs (jmtid,jobid,value) values (5,1029,44);

delete from users where uid >= 1000;  truncate table trait_results cascade;       
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1000, '1000 Manager');  insert into trait_results (uid,jmtid, value) values (1000, 1, 93);  insert into trait_results (uid,jmtid, value) values (1000, 2, 88);  insert into trait_results (uid,jmtid, value) values (1000, 3, 67);  insert into trait_results (uid,jmtid, value) values (1000, 4, 89);  insert into trait_results (uid,jmtid, value) values (1000, 5, 87);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1001, '1001 Manager');  insert into trait_results (uid,jmtid, value) values (1001, 1, 50);  insert into trait_results (uid,jmtid, value) values (1001, 2, 69);  insert into trait_results (uid,jmtid, value) values (1001, 3, 71);  insert into trait_results (uid,jmtid, value) values (1001, 4, 65);  insert into trait_results (uid,jmtid, value) values (1001, 5, 78);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1002, '1002 Manager');  insert into trait_results (uid,jmtid, value) values (1002, 1, 71);  insert into trait_results (uid,jmtid, value) values (1002, 2, 83);  insert into trait_results (uid,jmtid, value) values (1002, 3, 15);  insert into trait_results (uid,jmtid, value) values (1002, 4, 52);  insert into trait_results (uid,jmtid, value) values (1002, 5, 66);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1003, '1003 Manager');  insert into trait_results (uid,jmtid, value) values (1003, 1, 91);  insert into trait_results (uid,jmtid, value) values (1003, 2, 92);  insert into trait_results (uid,jmtid, value) values (1003, 3, 61);  insert into trait_results (uid,jmtid, value) values (1003, 4, 77);  insert into trait_results (uid,jmtid, value) values (1003, 5, 77);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1004, '1004 Manager');  insert into trait_results (uid,jmtid, value) values (1004, 1, 37);  insert into trait_results (uid,jmtid, value) values (1004, 2, 88);  insert into trait_results (uid,jmtid, value) values (1004, 3, 57);  insert into trait_results (uid,jmtid, value) values (1004, 4, 94);  insert into trait_results (uid,jmtid, value) values (1004, 5, 73);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1005, '1005 Manager');  insert into trait_results (uid,jmtid, value) values (1005, 1, 94);  insert into trait_results (uid,jmtid, value) values (1005, 2, 89);  insert into trait_results (uid,jmtid, value) values (1005, 3, 81);  insert into trait_results (uid,jmtid, value) values (1005, 4, 92);  insert into trait_results (uid,jmtid, value) values (1005, 5, 87);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1006, '1006 CS/Support'); insert into trait_results (uid,jmtid, value) values (1006, 1, 98);  insert into trait_results (uid,jmtid, value) values (1006, 2, 68);  insert into trait_results (uid,jmtid, value) values (1006, 3, 60);  insert into trait_results (uid,jmtid, value) values (1006, 4, 77);  insert into trait_results (uid,jmtid, value) values (1006, 5, 100);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1007, '1007 CS/Support'); insert into trait_results (uid,jmtid, value) values (1007, 1, 100); insert into trait_results (uid,jmtid, value) values (1007, 2, 58);  insert into trait_results (uid,jmtid, value) values (1007, 3, 23);  insert into trait_results (uid,jmtid, value) values (1007, 4, 88);  insert into trait_results (uid,jmtid, value) values (1007, 5, 88);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1008, '1008 CS/Support'); insert into trait_results (uid,jmtid, value) values (1008, 1, 98);  insert into trait_results (uid,jmtid, value) values (1008, 2, 69);  insert into trait_results (uid,jmtid, value) values (1008, 3, 79);  insert into trait_results (uid,jmtid, value) values (1008, 4, 66);  insert into trait_results (uid,jmtid, value) values (1008, 5, 80);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1009, '1009 CS/Support'); insert into trait_results (uid,jmtid, value) values (1009, 1, 91);  insert into trait_results (uid,jmtid, value) values (1009, 2, 86);  insert into trait_results (uid,jmtid, value) values (1009, 3, 77);  insert into trait_results (uid,jmtid, value) values (1009, 4, 95);  insert into trait_results (uid,jmtid, value) values (1009, 5, 96);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1010, '1010 CS/Support'); insert into trait_results (uid,jmtid, value) values (1010, 1, 79);  insert into trait_results (uid,jmtid, value) values (1010, 2, 67);  insert into trait_results (uid,jmtid, value) values (1010, 3, 48);  insert into trait_results (uid,jmtid, value) values (1010, 4, 83);  insert into trait_results (uid,jmtid, value) values (1010, 5, 80);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1011, '1011 CS/Support'); insert into trait_results (uid,jmtid, value) values (1011, 1, 61);  insert into trait_results (uid,jmtid, value) values (1011, 2, 100); insert into trait_results (uid,jmtid, value) values (1011, 3, 46);  insert into trait_results (uid,jmtid, value) values (1011, 4, 100); insert into trait_results (uid,jmtid, value) values (1011, 5, 81);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1012, '1012 Sales');  insert into trait_results (uid,jmtid, value) values (1012, 1, 83);  insert into trait_results (uid,jmtid, value) values (1012, 2, 93);  insert into trait_results (uid,jmtid, value) values (1012, 3, 53);  insert into trait_results (uid,jmtid, value) values (1012, 4, 90);  insert into trait_results (uid,jmtid, value) values (1012, 5, 94);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1013, '1013 Sales');  insert into trait_results (uid,jmtid, value) values (1013, 1, 86);  insert into trait_results (uid,jmtid, value) values (1013, 2, 76);  insert into trait_results (uid,jmtid, value) values (1013, 3, 99);  insert into trait_results (uid,jmtid, value) values (1013, 4, 87);  insert into trait_results (uid,jmtid, value) values (1013, 5, 89);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1014, '1014 Sales');  insert into trait_results (uid,jmtid, value) values (1014, 1, 100); insert into trait_results (uid,jmtid, value) values (1014, 2, 48);  insert into trait_results (uid,jmtid, value) values (1014, 3, 92);  insert into trait_results (uid,jmtid, value) values (1014, 4, 77);  insert into trait_results (uid,jmtid, value) values (1014, 5, 85);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1015, '1015 Sales');  insert into trait_results (uid,jmtid, value) values (1015, 1, 86);  insert into trait_results (uid,jmtid, value) values (1015, 2, 87);  insert into trait_results (uid,jmtid, value) values (1015, 3, 59);  insert into trait_results (uid,jmtid, value) values (1015, 4, 89);  insert into trait_results (uid,jmtid, value) values (1015, 5, 88);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1016, '1016 Sales');  insert into trait_results (uid,jmtid, value) values (1016, 1, 89);  insert into trait_results (uid,jmtid, value) values (1016, 2, 91);  insert into trait_results (uid,jmtid, value) values (1016, 3, 60);  insert into trait_results (uid,jmtid, value) values (1016, 4, 86);  insert into trait_results (uid,jmtid, value) values (1016, 5, 89);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1017, '1017 Sales');  insert into trait_results (uid,jmtid, value) values (1017, 1, 100); insert into trait_results (uid,jmtid, value) values (1017, 2, 100); insert into trait_results (uid,jmtid, value) values (1017, 3, 85);  insert into trait_results (uid,jmtid, value) values (1017, 4, 96);  insert into trait_results (uid,jmtid, value) values (1017, 5, 91);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1018, '1018 IT'); insert into trait_results (uid,jmtid, value) values (1018, 1, 67);  insert into trait_results (uid,jmtid, value) values (1018, 2, 80);  insert into trait_results (uid,jmtid, value) values (1018, 3, 78);  insert into trait_results (uid,jmtid, value) values (1018, 4, 78);  insert into trait_results (uid,jmtid, value) values (1018, 5, 48);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1019, '1019 IT'); insert into trait_results (uid,jmtid, value) values (1019, 1, 97);  insert into trait_results (uid,jmtid, value) values (1019, 2, 89);  insert into trait_results (uid,jmtid, value) values (1019, 3, 76);  insert into trait_results (uid,jmtid, value) values (1019, 4, 100); insert into trait_results (uid,jmtid, value) values (1019, 5, 71);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1020, '1020 IT'); insert into trait_results (uid,jmtid, value) values (1020, 1, 99);  insert into trait_results (uid,jmtid, value) values (1020, 2, 98);  insert into trait_results (uid,jmtid, value) values (1020, 3, 81);  insert into trait_results (uid,jmtid, value) values (1020, 4, 81);  insert into trait_results (uid,jmtid, value) values (1020, 5, 70);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1021, '1021 IT'); insert into trait_results (uid,jmtid, value) values (1021, 1, 89);  insert into trait_results (uid,jmtid, value) values (1021, 2, 99);  insert into trait_results (uid,jmtid, value) values (1021, 3, 83);  insert into trait_results (uid,jmtid, value) values (1021, 4, 78);  insert into trait_results (uid,jmtid, value) values (1021, 5, 80);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1022, '1022 IT'); insert into trait_results (uid,jmtid, value) values (1022, 1, 68);  insert into trait_results (uid,jmtid, value) values (1022, 2, 97);  insert into trait_results (uid,jmtid, value) values (1022, 3, 48);  insert into trait_results (uid,jmtid, value) values (1022, 4, 98);  insert into trait_results (uid,jmtid, value) values (1022, 5, 48);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1023, '1023 IT'); insert into trait_results (uid,jmtid, value) values (1023, 1, 95);  insert into trait_results (uid,jmtid, value) values (1023, 2, 96);  insert into trait_results (uid,jmtid, value) values (1023, 3, 53);  insert into trait_results (uid,jmtid, value) values (1023, 4, 93);  insert into trait_results (uid,jmtid, value) values (1023, 5, 77);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1024, '1024 Accounting'); insert into trait_results (uid,jmtid, value) values (1024, 1, 69);  insert into trait_results (uid,jmtid, value) values (1024, 2, 93);  insert into trait_results (uid,jmtid, value) values (1024, 3, 77);  insert into trait_results (uid,jmtid, value) values (1024, 4, 15);  insert into trait_results (uid,jmtid, value) values (1024, 5, 14);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1025, '1025 Accounting'); insert into trait_results (uid,jmtid, value) values (1025, 1, 85);  insert into trait_results (uid,jmtid, value) values (1025, 2, 98);  insert into trait_results (uid,jmtid, value) values (1025, 3, 65);  insert into trait_results (uid,jmtid, value) values (1025, 4, 88);  insert into trait_results (uid,jmtid, value) values (1025, 5, 61);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1026, '1026 Accounting'); insert into trait_results (uid,jmtid, value) values (1026, 1, 67);  insert into trait_results (uid,jmtid, value) values (1026, 2, 68);  insert into trait_results (uid,jmtid, value) values (1026, 3, 20);  insert into trait_results (uid,jmtid, value) values (1026, 4, 64);  insert into trait_results (uid,jmtid, value) values (1026, 5, 60);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1027, '1027 Accounting'); insert into trait_results (uid,jmtid, value) values (1027, 1, 102); insert into trait_results (uid,jmtid, value) values (1027, 2, 28);  insert into trait_results (uid,jmtid, value) values (1027, 3, 91);  insert into trait_results (uid,jmtid, value) values (1027, 4, 96);  insert into trait_results (uid,jmtid, value) values (1027, 5, 92);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1028, '1028 Accounting'); insert into trait_results (uid,jmtid, value) values (1028, 1, 99);  insert into trait_results (uid,jmtid, value) values (1028, 2, 96);  insert into trait_results (uid,jmtid, value) values (1028, 3, 10);  insert into trait_results (uid,jmtid, value) values (1028, 4, 86);  insert into trait_results (uid,jmtid, value) values (1028, 5, 80);
insert into users (domain, pass, uid, username) values ('hirenetics.com', 'tt', 1029, '1029 Accounting'); insert into trait_results (uid,jmtid, value) values (1029, 1, 101); insert into trait_results (uid,jmtid, value) values (1029, 2, 97);  insert into trait_results (uid,jmtid, value) values (1029, 3, 58);  insert into trait_results (uid,jmtid, value) values (1029, 4, 69);  insert into trait_results (uid,jmtid, value) values (1029, 5, 41);
