select * from product
select * from sales


--tablo varsa silip yeniden olu�tur
if (exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME='product')) --e�er tablo varsa
begin drop table product                                                         --sil
end

if (exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME='sales')) --e�er tablo varsa
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
--random de�i�ikli�i tan�mla
declare @randomproduct�d int
declare @random�nitprice int
declare @randomquantitysold int

--product�d s�t�nu i�in de�erler �ret
declare @upperlimitproduct�d int
declare @lowerlimitproduct�d int
set @upperlimitproduct�d=8500
set @lowerlimitproduct�d=1


--�nitprice s�t�nu i�in de�erler �ret
declare @upperlimit�nitprice int
declare @lowerlimit�nitprice int
set @upperlimit�nitprice=100
set @lowerlimit�nitprice=1

--quantitysold s�t�nu i�in de�erler �ret
declare @upperlimitquantitysold int
declare @lowerlimitquantitysold int
set @upperlimitquantitysold=10
set @lowerlimitquantitysold=1

--sales tablosuna �rnek veri ekle
declare @count int
set @count=1

while (@count<=750000)
begin
	select @randomproduct�d=ROUND(((@upperlimitproduct�d-@lowerlimitproduct�d)*rand()+@lowerlimitproduct�d),0)
	select @random�nitprice=ROUND(((@upperlimit�nitprice-@lowerlimit�nitprice)*rand()+@lowerlimit�nitprice),0)
	select @randomquantitysold=ROUND(((@upperlimitquantitysold-@lowerlimitquantitysold)*rand()+@lowerlimitquantitysold),0)

	insert into sales values(@randomproduct�d,@random�nitprice,@randomquantitysold)
	print @count
	set @count = @count+1

	end