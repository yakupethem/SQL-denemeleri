---transaction

select * from product

begin tran

update product set unitprice=20 where �d=1
--rollback tran---tran � geri al�r
commit tran  --tran onaylar
----------------

create proc up_trans 
as begin
	begin try
		begin tran
			update product set unitprice=30 where �d=1
		commit tran
		print 'de�i�tirildi'
	end try
	begin catch
		rollback tran
		print 'de�i�tirilmedi'
	end catch
end

alter proc up_trans 
as begin
	begin try
		begin tran
			update product set unitprice='asd' where �d=1
		commit tran
		print 'de�i�tirildi'
	end try
	begin catch
		rollback tran
		print 'de�i�tirilmedi'
	end catch
end
--------------------



