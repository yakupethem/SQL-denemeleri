select * from tblPerson

select distinct  name,city from tblPerson 

select * from tblPerson where city='london'
select * from tblPerson where city<>'london'
select * from tblPerson where city like'l%'

select * from tblPerson where email  like'%@%'
select * from tblPerson where email not like'%@%'

select * from tblPerson where age < 25
select * from tblPerson where age in (23,21)
select * from tblPerson where age between 20 and 25

select * from tblPerson where name  like'[mst]%'
select * from tblPerson where name  not like'[mst]%'

select * from tblPerson where city in ('london','istanbul') and age> 25

select * from tblPerson order by name desc,age desc

select top 1 * from tblPerson
select top 50 percent * from tblPerson
select top 50 percent * from tblPerson order by age 
select top 1 * from tblPerson order by age desc
select top 1 * from tblPerson order by age