
if not exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME='employee')
begin

		create table employee
		(
		id int primary key identity,
		name nvarchar(50),
		gender nvarchar(50),
		birthDate datetime
		)
		print 'tablo oluþturuldu'
end
Else
begin
	print 'tablo zaten var'
end
---------------------

if OBJECT_ID('emplyee')is null ---tablo varsa tabloya atanan id deðerini döndürür yoksa null döndürür
begin
	
		create table employee
		(
		id int primary key identity,
		name nvarchar(50),
		gender nvarchar(50),
		birthDate datetime
		)
		print 'tablo oluþturuldu'
end
else
begin
	print 'tablo zaten var'
end

-----
if OBJECT_ID ('employee') is not null
begin
	drop table employee
end
	
		create table employee
		(
		id int primary key identity,
		name nvarchar(50),
		gender nvarchar(50),
		birthDate datetime
		)
----------------------

alter table employee add Email nvarchar(50) --sütün ekledik

if not exists (select * from INFORMATION_SCHEMA.COLUMNS  ---- eðer sütün yoksa
where COLUMN_NAME='Email' and TABLE_NAME='employee'and TABLE_SCHEMA='dbo')
begin 
alter table employee add Email nvarchar(50)
end
else
begin print'sütün zaten var'
end

---sütün kontrolü2

if COL_LENGTH('employee','Email')is not null
begin print 'sütün zaten var' end
else 
begin print 'sütün yok' end

select COL_LENGTH('employee','Email')  ---varsa sayýsal deðer döndürür