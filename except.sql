select * from tableA
except  --farkl�lar� getirir filtre yapar
select * from tableB

--insert into  TableA values(1,'mark','male')

select * from tableA
where Id not in  (select Id from TableB)  --ayn�lar� getirir filtre yapmaz

select * from tblEmployee where Salary>50000
except
select * from tblEmployee where Salary>=60000
order by ID desc