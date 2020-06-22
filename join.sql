select * from Employees
select * from departments

select name,gender,salary,deptId from departments inner join employees on departments.departmentID = employees.deptId
select name,gender,salary,deptId from employees inner join departments  on  = employees.deptId


select name,gender,salary,deptId from departments left join employees on departments.departmentID = employees.deptId
select name,gender,salary,deptId from employees left join departments  on departments.departmentID = employees.deptId
select name,gender,salary,deptId from employees left join departments on departments.departmentID = employees.deptId 
where departments.departmentID  is null

select name,gender,salary,deptId from departments right join employees on departments.departmentID = employees.deptId
select name,gender,salary,deptId from employees right join departments  on departments.departmentID = employees.deptId

select name,gender,salary,deptId from departments full join employees on departments.departmentID = employees.deptId
select name,gender,salary,deptId from departments full join employees on departments.departmentID = employees.deptId 
where departments.departmentID is null or employees.deptId is null

select name,gender,salary,deptId from departments cross join employees 
--on departments.departmentID = employees.deptId