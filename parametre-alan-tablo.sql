create table employee(
id int primary key,
name nvarchar(50),
gender nvarchar(50)
)
go
select * from employee

------

create type emptable as table
(
id int primary key,
name nvarchar(50),
gender nvarchar(50)
)

create proc up_emptable
@emptabletype emptable READONLY 
as  
begin
insert into employee select * from  @emptabletype
end

DECLARE @employeetabletype emptable
insert into @employeetabletype values (1,'mark','male')
insert into @employeetabletype values (2,'mary','famale')
insert into @employeetabletype values (3,'sara','famale')
insert into @employeetabletype values (4,'bob','male')

exec up_emptable @employeetabletype