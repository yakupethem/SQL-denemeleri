create table Sales2
(
	Continent nvarchar(20),
	Country nvarchar(20),
	City nvarchar(20),
	SaleAmount int
)

insert into Sales2 values('Asia', 'India', 'Bangalore', 1000)
insert into Sales2 values('Asia', 'India', 'Chennai', 2000)
insert into Sales2 values('Asia', 'Japan', 'Tokyo', 4000)
insert into Sales2 values('Asia', 'Japan', 'Hiroshima', 5000)
insert into Sales2 values('Europe', 'United Kingdom', 'London', 1000)
insert into Sales2 values('Europe', 'United Kingdom', 'Manchester', 2000)
insert into Sales2 values('Europe', 'France', 'Paris', 4000)
insert into Sales2 values('Europe', 'France', 'Cannes', 5000)

----------------------
select * from Sales2

select Continent,Country,City,sum(SaleAmount)as Total from Sales2
group by rollup(Continent,Country,City)

select Continent,Country,City,sum(SaleAmount)as Total from Sales2
group by cube(Continent,Country,City)