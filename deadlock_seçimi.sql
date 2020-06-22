create table tableA(
id int identity,
name nvarchar(20))

create table tableB(
id int identity,
name nvarchar(20))

insert into tableA values ('mark')
insert into tableA values ('yakup')
insert into tableA values ('ethem')
insert into tableA values ('mamoþ')

insert into tableB values ('büþra')
delete from tableA where id in (1,2,3,4)
delete from tableb where id=1
select * from tableA
select * from tableB

------transaction1
begin tran

update tableA set name=name+'trans1' where id in (5,6,7,8)

update tableB set name=name+'trans1' where id=2

commit tran

---deadlock kurbaný hata okuma için:
sp_readerrorlog

select OBJECT_NAME(object_id) from sys.partitions where hobt_id=72057594043629568

------try-catch ile:

alter proc upTran1
as begin
	begin tran
	begin try
		update tableA set name='trans111' where id in (5,6,7,8)
		waitfor delay '00:000:05'
		update tableB set name='trans111' where id=2
	commit tran
	select 'baþarýlý	'
	end try
	begin catch
		if(ERROR_NUMBER()=1205)
		begin
			select 'baþarýsýz'
		end
		rollback
	end catch	
end

execute  upTran1

KILL 68