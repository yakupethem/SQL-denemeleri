select * from Employees
select * from Departments

create view vw_detail as 
select * from Employees inner join Departments on Employees.DeptId=Departments.DepartmentId

alter view vw_detail as 
select Id,Name,Gender,DepartmentName from Employees inner join Departments on Employees.DeptId=Departments.DepartmentId


select * from vw_detail

update vw_detail set Name='mamoþ',DepartmentName='HR' where Id=9  ----birden fazla tablo etkilendiði için hata verdi

alter trigger trg_detail on vw_detail
instead of update as begin 
	if (UPDATE(Id))
	begin
		raiserror('id deðiþtirilemez',16,1)
		return
	end
	if (UPDATE(DepartmentName))
	begin
	declare @deptid int
	select @deptid=DepartmentId from Departments inner join inserted
	on inserted.DepartmentName=Departments.DepartmentName
	end
	update Employees set DeptId=@deptid from inserted inner join Employees on Employees.Id=inserted.Id
	if (UPDATE(name))
	begin
	update Employees set Name=inserted.Name from inserted inner join Employees on Employees.Id=inserted.Id 
	end
end


----------------
----instead of delete
create trigger trg_detail_delete on vw_detail
instead of delete
as begin
	delete from Employees from Employees inner join deleted	 on Employees.Id=deleted.Id
end

select * from vw_detail
delete vw_detail where Id=9