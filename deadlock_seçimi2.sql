
----ayný anda çalýþan tran lar için aþaðýdaki komut önem derecesini belirtir.
---derece normalde 'normal'dir.maliyeti az olan tranda deadlock  hatasý veriri geri döndürür
--set deadlock_priority high
begin tran

update tableB set name='tran2' where id=1

update tableA set name='tran2' where id in (1,2,3,4)

commit tran

---deadlock kurbaný hata okuma için:
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
execute upTran2

select * from tableA ,tableB

KILL 67