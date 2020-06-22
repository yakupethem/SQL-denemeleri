create table Departments
(
	DepartmentId int primary key,
	DepartmentName nvarchar(50)
)
GO
Insert into Departments values (1, 'IT')
Insert into Departments values (2, 'HR')
Insert into Departments values (3, 'Payroll')
GO
Create table Employees
(
	Id int primary key,
	Name nvarchar(100),
	Gender nvarchar(10),
	Salary int,
	DeptId int foreign key references Departments(DepartmentId)
)
GO
Insert into Employees values (1, 'Mark', 'Male', 50000, 1)
Insert into Employees values (2, 'Sara', 'Female', 65000, 2)
Insert into Employees values (3, 'Mike', 'Male', 48000, 3)
Insert into Employees values (4, 'Pam', 'Female', 70000, 1)
Insert into Employees values (5, 'John', 'Male', 55000, 2)