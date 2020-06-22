create proc uplocaltemple  --fonk gibi
as
begin

create table #person (id int,name nvarchar(50)) --local geçici
insert into #person values (1,'ali')
insert into #person values (2,'hasan')
insert into #person values (3,'hüseyin')
select * from #person
end

exec uplocaltemple
select* from #person  --dýþarýda local çalýþmaz