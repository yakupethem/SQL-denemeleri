select * from tablePerson
dbcc checkident (tablePerson,reseed,8)
set identity_insert tablePerson off
insert into tablePerson values('hakan',45,1)
delete from tablePerson where ID=32