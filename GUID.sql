create database india
go
use india
go

create table indiacustomer 
(
id uniqueidentifier  primary key  default newid(),
name nvarchar(50)
)
go

insert into indiacustomer values (default,'yakup')
insert into indiacustomer values (default,'ethem')

create database USA
go
use USA
go

create table usacustomer
(
id uniqueidentifier primary key  default newid(),
name nvarchar(50)
)
go

insert into usacustomer values (default,'ali')
insert into usacustomer values (default,'veli')

use india
go
create table customer
(
id uniqueidentifier primary key,
name nvarchar(50)
)
go

insert into customer
select * from indiacustomer union all
select * from USA.dbo.usacustomer

select * from customer

----guid 16 bayt int 4 bayt daha fazla yer kaplar performans� d���r�r, okunmas� zordur (select)
---server,db,tabloda tekilli�i garantiler
---- uniqueidentifier SQL de en b�y�k verir tiplerindendir
--gerek olmad�k�a kullanma


declare @myguid uniqueidentifier

set @myguid = NEWID()

if @myguid is null
begin
	print 'de�er bo� '
end
else 
begin 
	print 'de�er dolu'
end
----------

declare @myguid2 uniqueidentifier

if @myguid2 is null
begin
	set @myguid2 = newid()
end
select @myguid2
---------

declare @myguid3 uniqueidentifier

select ISNULL(@myguid3,NEWID())

----------
---- 0 guid de�eri olu�turmak:
select cast(cast(0 as binary)as uniqueidentifier )

select CAST(0x0 as uniqueidentifier)

declare @myguid4 uniqueidentifier
set @myguid4 ='00000000-0000-0000-0000-000000000000'
if @myguid4  = CAST(0x0 as uniqueidentifier)
begin 
	print 'guid bo�'
end
else begin 
	print 'guid dolu'
end

declare @myguid5 uniqueidentifier
set @myguid5 =NEWID()
if @myguid5  = CAST(0x0 as uniqueidentifier)
begin 
	print 'guid bo�'
end
else begin 
	print 'guid dolu'
end