create table tblProductSales
(
SalesAgent nvarchar(50),
SalesCountry nvarchar(20),
SalesAmount int
)

select * from tblProductSales
truncate table tblProductSales

insert into tblProductSales values('Tom', 'UK', 200)
insert into tblProductSales values('John', 'US', 180)
insert into tblProductSales values('John', 'UK', 260)
insert into tblProductSales values('David', 'India', 450)
insert into tblProductSales values('Tom', 'India', 350)
insert into tblProductSales values('David', 'US', 200)
insert into tblProductSales values('Tom', 'US', 130)
insert into tblProductSales values('John', 'India', 540)
insert into tblProductSales values('John', 'UK', 120)
insert into tblProductSales values('David', 'UK', 220)
insert into tblProductSales values('John', 'UK', 420)
insert into tblProductSales values('David', 'US', 320)
insert into tblProductSales values('Tom', 'US', 340)
insert into tblProductSales values('Tom', 'UK', 660)
insert into tblProductSales values('John', 'India', 430)
insert into tblProductSales values('David', 'India', 230)
insert into tblProductSales values('David', 'India', 280)
insert into tblProductSales values('Tom', 'UK', 480)
insert into tblProductSales values('John', 'US', 360)
insert into tblProductSales values('David', 'UK', 140)

----------------------

select SalesAgent,SalesCountry,sum(SalesAmount) as total from tblProductSales
group by SalesAgent,SalesCountry
order by SalesAgent,SalesCountry
-----
--pivot operatörü satýrlarý sütünlarý dönüþtürür
--unpivot tam tersi

select * from 
(select * from tblProductSales
pivot
(
	sum(SalesAmount)
	for SalesCountry in ([India],[UK],[US])
)as pivottable) as p
unpivot
(
	SalesAmount
	for Contry in (India,US)
	
)as unpivottable