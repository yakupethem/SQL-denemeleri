select * from Employees


select sum(salary) from Employees
select max(salary) from Employees
select min(salary) from employees

select count(*)from employees
select gender,sum(salary) as totalSalary from employees group by gender 
select gender,sum(salary) as totalSalary from employees where gender ='male' group by gender 
select gender,sum(salary) as totalSalary from employees  group by gender having gender ='male'
select gender,sum(salary) as totalSalary from employees  group by gender having sum(salary)>4000

select deptId,sum(salary) as totalSalary from employees group by deptId 