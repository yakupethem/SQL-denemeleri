select * from employes

select name,salary from employes
--herseferinde bunu tekrar tetrar girmemek için STORE PRODECURE tanýmlýyoruz

create procedure up_employes as begin    --procedure oluþturduk PROC da yazýlabilir
select name,salary from employes
end

up_employes  -- procedure yi çaðýrdýk  EXECUTE-EXEC de yazýlabilir

---parametreli store procedure:

create procedure up_emp 
@name nvarchar(50),
@gender nvarchar(50)
as begin
select name,gender from employes
where name=@name and gender=@gender
end

alter procedure up_emp   --güncelledik
@salary nvarchar(50),
@gender nvarchar(50)
as begin
select gender,salary from employes
where salary=@salary and gender=@gender
end

exec up_emp '10000','male'  --çaðýrdýk

sp_helptext up_emp  --içindekieri gösterir

drop proc up_emp  --silmek için

create procedure up_emp 
@name nvarchar(50),
@gender nvarchar(50)
with encryption  --artýk dýþarýdan görüntülemeye kapalý
as begin
select name,gender from employes
where name=@name and gender=@gender
end

sp_helptext up_emp  --The text for object 'up_emp' is encrypted.
------------------

--output parametreli store procedure

create procedure up_emp2
@gender nvarchar(50),
@empCount int output  --veya out
as begin select @empCount=count(ýd) from employes 
where gender=@gender
end

declare @totalcount int   --deðiþken tanýmladýk
exec up_emp2 'famale',@totalcount output
print @totalcount

sp_help up_emp2  ---system procedure
---oluþturulan procedure nin herþeyini verir

sp_depends up_emp2  ---system procedure
---oluþturulan procedure nin baðýmlýlýklarýný verir

-----------------
---return dönüþe sahip  store procedurler
create procedure up_emp3
 as begin 
return(select COUNT(ID) from employes )
end

declare @tot nvarchar(50) 
exec @tot=up_emp3 
print @tot
------------
create procedure up_emp4
@id int as begin 
return(select name from employes where ýd=@id)
end

declare @name nvarchar(50) 
exec @name=up_emp4 1
print 'name = ' + @name  ---return hata verdi genellikle int deðer döndüðü için 
--return sadece tek bir deðer döndürür