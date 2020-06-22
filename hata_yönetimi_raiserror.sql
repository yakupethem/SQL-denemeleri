select * from product
select * from sales2


create proc up_sell 1,10
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
		begin tran
		-----güncelleme yapýyoru
		update product set quantity=(quantity-@@quantitySell) where id=@productid
		-- daha önce hiç satýlan ürün yoksa
		declare @maxsalesid int
		select @maxsalesid = case when 
										max(productsalesid)is null then 0
										else max(productsalesid)end
										from sales2
		set @maxsalesid+=1
		insert into sales2  values(@maxsalesid,@productid,@@quantitySell)
		commit tran
	end
end
--------------------------------------------------
alter proc up_sell 1,5
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
		begin tran
		-----güncelleme yapýyoru
		update product set quantity=(quantity-@@quantitySell) where id=@productid
		-- daha önce hiç satýlan ürün yoksa
		declare @maxsalesid int
		select @maxsalesid = case when 
										max(productsalesid)is null then 0
										else max(productsalesid)end
										from sales2
		set @maxsalesid+=1
		insert into sales2  values(@maxsalesid,@productid,@@quantitySell)
		if(@@ERROR<>0)
		begin 
			rollback tran
			print('hata oluþtu')
		end
		else
		begin
		commit tran
		print('hatasýz  gerçekleþti')
		end
	end
end
----------------------------------------------------------

--@@error ile ilgili

insert into product values (2,'phone',3211,15)
if @@ERROR>0
	print 'hata var'
else
	print 'hata yok'
-------
---burada 2. satýr geçerli olduðu için hem hata verdi hem vermedi
insert into product values (2,'phone',3211,15)
select * from product
if @@ERROR>0
	print 'hata var'
else
	print 'hata yok'
----------
---bunun önüne geçmek için: deðiþken tanýmladýk

declare @error int
insert into product values (2,'phone',3211,15)
set @error=@@ERROR
select * from product
if (@error<>0)
	print 'hata var'
else
	print 'hata yok'
----------
