select * from product
select * from sales2


alter proc up_sell 2,10
@productid int,
@@quantitySell int
as begin
---satmak istediðimiz ürün kontrolünü yapýyoruz
	declare @stockavailable int
	select @stockavailable = quantity from product where @productid=id
----eðer stokta yeterli ürün yoksa hata veriyoruz
	if (@stockavailable<@@quantitySell)
	begin
		raiserror('yeterli stok yok',16,1)
	end
---eðer yeterli ürün varsa
	else 
		begin
		begin try
		begin tran
		-----güncelleme yapýyoru
		update product set quantity=(quantity-@@quantitySell) where id=@productid
		-- daha önce hiç satýlan ürün yoksa
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