
----ayn� anda �al��an tran lar i�in a�a��daki komut �nem derecesini belirtir.
---derece normalde 'normal'dir.maliyeti az olan tranda deadlock  hatas� veriri geri d�nd�r�r
--set deadlock_priority high
begin tran

update tableB set name='tran2' where id=1

update tableA set name='tran2' where id in (1,2,3,4)

commit tran

---deadlock kurban� hata okuma i�in:
sp_readerrorlog

----try-catch ile:

alter proc upTran2
as begin
	begin tran
	begin try
		update tableA set name='trans222' where id in (5,6,7,8)
		waitfor delay '00:000:05'
		update tableB set name='trans222' where id=2
	commit tran
	select 'ba�ar�l�	'
	end try
	begin catch
		if(ERROR_NUMBER()=1205)
		begin
			select 'ba�ar�s�z'
		end
		rollback
	end catch	
end
execute upTran2

select * from tableA ,tableB

KILL 67