
select * from Departments inner join Employees on Employees.DeptId=Departments.DepartmentId

select * from Departments left join Employees on Employees.DeptId=Departments.DepartmentId

create function fn_asd(@deptid int)
returns table 
as return (
select * from Employees where DeptId=@deptid
)

alter function fn_asd(@deptid int)
returns table 
as return (
select * from Employees where DeptId=@deptid
)
select * from fn_asd(3)

---inner join:
select * from Departments cross apply fn_asd(Departments.DepartmentId)
----left join:
select * from Departments outer apply fn_asd(Departments.DepartmentId)