select * from tblDepartment
select * from tblEmployee

----view oluþturmak
create view vwEmployee as
select * from tblDepartment inner join tblEmployee on tblDepartment.deptID=tblEmployee.departmentID
select * from vwEmployee

create view vwdepartmentEmployee as
select * from tblDepartment inner join tblEmployee on tblDepartment.deptID=tblEmployee.departmentID
where deptNAME = 'IT'
select * from vwdepartmentEmployee

create view employeCount as
select deptNAME,count(*)as totalEmployee 
from tblDepartment inner join tblEmployee 
on tblDepartment.deptID=tblEmployee.departmentID
group by deptNAME
select * from employeCount
sp_helptext employeCount

--alter tabloyu güncellemek
--drop tabloyu silmek
--sp_helptext tablonun içindekileri gösterir
create view vw_Emp as
select ID,name,gender from tblEmployee
select * from vw_Emp

update vw_Emp   --tablonun içini güncellemek
set name= 'yakocan40'	where ID=3

delete  from vw_Emp where ID=4  --tablonun içininden silmek
insert into vw_Emp values ('ethem','male')  --tablonun içine eklemek

--tek tablodan view oluþturduðumuzda ekleme silme iþlemin sorun çýkmaz 
--iki tablolarda sorun çýkar