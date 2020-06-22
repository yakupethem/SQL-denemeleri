select * from product
select * from sales2


alter proc up_sell 2,10
@productid int,
@@quantitySell int
as begin
---satmak istedi�imiz �r�n kontrol�n� yap�yoruz
	declare @stockavailable int
	select @stockavailable = quantity from product where @productid=id
----e�er stokta yeterli �r�n yoksa hata veriyoruz
	if (@stockavailable<@@quantitySell)
	begin
		raiserror('yeterli stok yok',16,1)
	end
---e�er yeterli �r�n varsa
	else 
		begin
		begin try
		begin tran
		-----g�ncelleme yap�yoru
		update product set quantity=(quantity-@@quantitySell) where id=@productid
		-- daha �nce hi� sat�lan �r�n yoksa
		declare @maxsalesid int
		select @maxsalesid = case when 
										max(productsalesid)is null then 0
										else max(productsalesid)end
										from sales2
		--set @maxsalesid+=1
		insert into sales2  values(@maxsalesid,@productid,@@quantitySell)
		commit tran
		end try
		begin catch 
		rollback tran
			select
			ERROR_NUMBER() as errorNumber,
			ERROR_MESSAGE()as errorMessage,
			ERROR_LINE()as errorLine
			

		end catch
	end
end