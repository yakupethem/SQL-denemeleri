select * from product
select * from sales2


create proc up_sell 1,10
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
		begin tran
		-----g�ncelleme yap�yoru
		update product set quantity=(quantity-@@quantitySell) where id=@productid
		-- daha �nce hi� sat�lan �r�n yoksa
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
		begin tran
		-----g�ncelleme yap�yoru
		update product set quantity=(quantity-@@quantitySell) where id=@productid
		-- daha �nce hi� sat�lan �r�n yoksa
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
			print('hata olu�tu')
		end
		else
		begin
		commit tran
		print('hatas�z  ger�ekle�ti')
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
---burada 2. sat�r ge�erli oldu�u i�in hem hata verdi hem vermedi
insert into product values (2,'phone',3211,15)
select * from product
if @@ERROR>0
	print 'hata var'
else
	print 'hata yok'
----------
---bunun �n�ne ge�mek i�in: de�i�ken tan�mlad�k

declare @error int
insert into product values (2,'phone',3211,15)
set @error=@@ERROR
select * from product
if (@error<>0)
	print 'hata var'
else
	print 'hata yok'
----------
