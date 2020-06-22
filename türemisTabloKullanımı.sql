create view  EmployeeCount
as
select te.departmentID,	td.deptNAME,count(*) as totalEmployees
from tblEmployee te inner join tblDepartment td
on te.departmentID=td.deptID
group by  te.departmentID,td.deptNAME

select deptNAME,totalEmployees
from EmployeeCount
where totalEmployees>=2

select* from tblDepartment
select * from tblEmployee