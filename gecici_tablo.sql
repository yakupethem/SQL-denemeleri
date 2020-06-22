--local geçici tablo

create table #person(id int,name nvarchar(50))

--veri ekleme

insert into #person values (1,'ahmet')
insert into #person values (2,'mehmet')
insert into #person values (3,'veli')

--veriyi çaðýr

select * from #person

--geçici dosyanýn sistemdeki yeri
select name from tempdb..sysobjects
where name like '#person%'