
if not exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME='employee')
begin

		create table employee
		(
		id int primary key identity,
		name nvarchar(50),
		gender nvarchar(50),
		birthDate datetime
		)
		print 'tablo olu�turuldu'
end
Else
begin
	print 'tablo zaten var'
end
---------------------

if OBJECT_ID('emplyee')is null ---tablo varsa tabloya atanan id de�erini d�nd�r�r yoksa null d�nd�r�r
begin
	
		create table employee
		(
		id int primary key identity,
		name nvarchar(50),
		gender nvarchar(50),
		birthDate datetime
		)
		print 'tablo olu�turuldu'
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

alter table employee add Email nvarchar(50) --s�t�n ekledik

if not exists (select * from INFORMATION_SCHEMA.COLUMNS  ---- e�er s�t�n yoksa
where COLUMN_NAME='Email' and TABLE_NAME='employee'and TABLE_SCHEMA='dbo')
begin 
alter table employee add Email nvarchar(50)
end
else
begin print's�t�n zaten var'
end

---s�t�n kontrol�2

if COL_LENGTH('employee','Email')is not null
begin print 's�t�n zaten var' end
else 
begin print 's�t�n yok' end

select COL_LENGTH('employee','Email')  ---varsa say�sal de�er d�nd�r�r