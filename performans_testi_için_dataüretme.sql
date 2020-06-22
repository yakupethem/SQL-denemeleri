select * from product
select * from sales


--tablo varsa silip yeniden oluþtur
if (exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME='product')) --eðer tablo varsa
begin drop table product                                                         --sil
end

if (exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME='sales')) --eðer tablo varsa
begin drop table sales                                                         --sil
end
----------------------------------------
create table product(
[ID] int identity primary key,
[name] nvarchar(50),
[description] nvarchar(50)
)

create table sales(
[ID] int identity primary key,
[productID] int foreign key references product(ID),
[price] int,
[quantitySold] int
)
-------------------
declare @id int
set @id = 1

while(@id<500000)
begin
	insert into product values('product-'+cast(@id as nvarchar(20)),'product-'+cast(@id as nvarchar(20))+' description')
	print @id
	set @id = @id+1
end
----------------------------
--random deðiþikliði tanýmla
declare @randomproductýd int
declare @randomünitprice int
declare @randomquantitysold int

--productýd sütünu için deðerler üret
declare @upperlimitproductýd int
declare @lowerlimitproductýd int
set @upperlimitproductýd=8500
set @lowerlimitproductýd=1


--ünitprice sütünu için deðerler üret
declare @upperlimitünitprice int
declare @lowerlimitünitprice int
set @upperlimitünitprice=100
set @lowerlimitünitprice=1

--quantitysold sütünu için deðerler üret
declare @upperlimitquantitysold int
declare @lowerlimitquantitysold int
set @upperlimitquantitysold=10
set @lowerlimitquantitysold=1

--sales tablosuna örnek veri ekle
declare @count int
set @count=1

while (@count<=750000)
begin
	select @randomproductýd=ROUND(((@upperlimitproductýd-@lowerlimitproductýd)*rand()+@lowerlimitproductýd),0)
	select @randomünitprice=ROUND(((@upperlimitünitprice-@lowerlimitünitprice)*rand()+@lowerlimitünitprice),0)
	select @randomquantitysold=ROUND(((@upperlimitquantitysold-@lowerlimitquantitysold)*rand()+@lowerlimitquantitysold),0)

	insert into sales values(@randomproductýd,@randomünitprice,@randomquantitysold)
	print @count
	set @count = @count+1

	end