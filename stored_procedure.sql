select * from employes

select name,salary from employes
--herseferinde bunu tekrar tetrar girmemek i�in STORE PRODECURE tan�ml�yoruz

create procedure up_employes as begin    --procedure olu�turduk PROC da yaz�labilir
select name,salary from employes
end

up_employes  -- procedure yi �a��rd�k  EXECUTE-EXEC de yaz�labilir

---parametreli store procedure:

create procedure up_emp 
@name nvarchar(50),
@gender nvarchar(50)
as begin
select name,gender from employes
where name=@name and gender=@gender
end

alter procedure up_emp   --g�ncelledik
@salary nvarchar(50),
@gender nvarchar(50)
as begin
select gender,salary from employes
where salary=@salary and gender=@gender
end

exec up_emp '10000','male'  --�a��rd�k

sp_helptext up_emp  --i�indekieri g�sterir

drop proc up_emp  --silmek i�in

create procedure up_emp 
@name nvarchar(50),
@gender nvarchar(50)
with encryption  --art�k d��ar�dan g�r�nt�lemeye kapal�
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
as begin select @empCount=count(�d) from employes 
where gender=@gender
end

declare @totalcount int   --de�i�ken tan�mlad�k
exec up_emp2 'famale',@totalcount output
print @totalcount

sp_help up_emp2  ---system procedure
---olu�turulan procedure nin her�eyini verir

sp_depends up_emp2  ---system procedure
---olu�turulan procedure nin ba��ml�l�klar�n� verir

-----------------
---return d�n��e sahip  store procedurler
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
return(select name from employes where �d=@id)
end

declare @name nvarchar(50) 
exec @name=up_emp4 1
print 'name = ' + @name  ---return hata verdi genellikle int de�er d�nd��� i�in 
--return sadece tek bir de�er d�nd�r�r