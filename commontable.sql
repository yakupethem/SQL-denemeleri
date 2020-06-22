--------
---common table

with comontable1
as(select DepartmentName,count(Id) as totalemployees 
from Employees inner join Departments on Employees.DeptId = Departments.DepartmentId
where DepartmentName in ('IT')
group by DepartmentName),
commantable2 as (select DepartmentName,count(Id) as totalemployees  --birle�il comontable
from Employees inner join Departments on Employees.DeptId = Departments.DepartmentId
where DepartmentName in('HR')
group by DepartmentName)
select *  from comontable1
union
select * from commantable2
---------------------------------------------
-- commontable g�ncelleme

with commontable3 as(
select Id,Name,Gender from Employees
)
--update commontable3 set Gender='Male' where Id=9  

select * from commontable3
------------------------------------
--commontable g�ncelleme2
--iki tablo i�i�e oldu�unda iki tabloya birden g�nceleme yap�lmaz commontablede
with commontable4 as(select Id,Name,DepartmentName,country from Employees inner join Departments
on Employees.DeptId=Departments.DepartmentId)
--update commontable4 set country='TR',DepartmentName='CEO'  where Id=9 --olmaz
update commontable4 set DepartmentName='CEO'  where Id=9 -- olur
select * from commontable4