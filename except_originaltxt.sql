create table tblEmployee
(
	Id int identity primary key,
	Name nvarchar(100),
	Gender nvarchar(10),
	Salary int
)
Go
Insert into tblEmployee values ('Mark', 'Male', 52000)
Insert into tblEmployee values ('Mary', 'Female', 55000)
Insert into tblEmployee values ('Steve', 'Male', 45000)
Insert into tblEmployee values ('John', 'Male', 40000)
Insert into tblEmployee values ('Sara', 'Female', 48000)
Insert into tblEmployee values ('Pam', 'Female', 60000)
Insert into tblEmployee values ('Tom', 'Male', 58000)
Insert into tblEmployee values ('George', 'Male', 65000)
Insert into tblEmployee values ('Tina', 'Female', 67000)
Insert into tblEmployee values ('Ben', 'Male', 80000)
