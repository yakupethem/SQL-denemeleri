---transaction

select * from product

begin tran

update product set unitprice=20 where ýd=1
--rollback tran---tran ý geri alýr
commit tran  --tran onaylar
----------------

create proc up_trans 
as begin
	begin try
		begin tran
			update product set unitprice=30 where ýd=1
		commit tran
		print 'deðiþtirildi'
	end try
	begin catch
		rollback tran
		print 'deðiþtirilmedi'
	end catch
end

alter proc up_trans 
as begin
	begin try
		begin tran
			update product set unitprice='asd' where ýd=1
		commit tran
		print 'deðiþtirildi'
	end try
	begin catch
		rollback tran
		print 'deðiþtirilmedi'
	end catch
end
--------------------



