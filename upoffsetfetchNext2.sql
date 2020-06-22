create table tblProducts(
	ID int primary key identity,
	name nvarchar(50),
	[description] nvarchar(50),
	price int)

go

declare @start int
set @start = 1
declare @name varchar(25)
declare @description varchar(50)

while(@start <= 100)
begin
	set @name = 'product - '+LTRIM(@start)
	set @description = 'product description - '+LTRIM(@start)
	insert into tblProducts values (@name,@description,@start*10)
	set @start = @start +1
end