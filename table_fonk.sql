select * from employes

create function fn_gender(@gender nvarchar(50))
returns table
as
return(select name,salary,gender from employes where gender=@gender)

alter function fn_gender(@gender nvarchar(50))
returns table
as
return(select name,salary,gender from employes where gender=@gender)
--fonksiyon tablo gibi davrandýðý için
select * from fn_gender('male')