
---veritabaný seviyeinde trigger

create trigger myFirstTrigger on database
for create_table
as begin
	print 'tablo oluþturuldu'
end

create table test(id int)

alter trigger myFirstTrigger on database
for create_table,alter_table,drop_table
as begin
	print 'tablo deðiþtirildi'
end

drop table test

alter trigger myFirstTrigger on database
for create_table,alter_table,drop_table
as begin
	rollback  ----veritabanýnda nesne oluþturmaya izin vermez
	print 'tablo deðiþtirilmez'
end

drop table test

disable trigger myFirstTrigger on database  ---triggeri kapattýk
enable trigger myFirstTrigger on database  ----trigeri açtýk

drop trigger myFirstTrigger on database  ---triggeri sildik

create trigger myFirstTrigger on database
for rename
as begin
	print 'isim deðiþtirildi'
end

sp_rename 'test','newTest'

------------------

---server seviyeinde trigger

create trigger serverTrigger on all server
for create_Table,drop_table,alter_table
as begin
	rollback
	print 'deðiþtirilemez'
end

create table test(id int)-- hata verir
drop table test

disable trigger serverTrigger on all server  --trigger kapatýldý
disable trigger serverTrigger on all server  --triger açýldý

drop trigger serverTrigger on all server  --trigger silindi
---------------------------

---deðiþiklileri denetleme

create trigger auditTable on all server 
for create_table,drop_table,alter_table
as begin
	select EVENTDATA()
end

create table tablechange(
databasename nvarchar(250),
tablename nvarchar(250),
eventtype nvarchar(250),
loginName nvarchar(250),
sql_command nvarchar(2500),
time datetime
)
go

select * from tablechange

alter trigger auditTable on all server
for create_table,drop_table,alter_table
as begin
	declare @event xml
	set @event=EVENTDATA()

	insert into örnek11.dbo.tablechange (databasename,tablename,eventtype,loginName,sql_command,time) values(

			@event.value('(/EVENT_INSTANCE/DatabaseName)[1]', 'varchar(250)'),
			@event.value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(250)'),
			@event.value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(250)'),
			@event.value('(/EVENT_INSTANCE/LoginName)[1]', 'varchar(250)'),
			@event.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'varchar(2500)'),
			GETDATE()
	)
	end

	select * from tablechange  --- deðiþiklikleri bu tabloya attýk
	create table mytable2(id int,name nvarchar(50))
	drop table mytable
	alter table mytable 	alter column name nvarchar(100)