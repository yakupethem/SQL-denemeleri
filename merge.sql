select * from studentTarget
select * from studentSource

insert into studentTarget values (1,'mike')
insert into studentTarget values (2,'sara')

insert into studentSource values (1,'mike m')
insert into studentSource values (3,'john')

truncate table studentTarget
truncate table studentSource


merge into studentTarget as t
using studentSource as s
on t.ID=s.ID

when matched then
	update set t.name=s.name
when not matched by target then
	insert(ID,name) values(s.ID,s.name);
when not matched by source then
	delete;