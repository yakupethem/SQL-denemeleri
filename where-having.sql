create table sales(
product nvarchar(50),
saleAmount int
)
go

insert into sales values('iphone',500)
insert into sales values('huawei',500)
insert into sales values('samsung',500)
insert into sales values('iphone',1000)
insert into sales values('samsung',1500)
insert into sales values('LG',750)

--delete from sales where product= 'LG'

select * from sales

select product,sum(saleAmount) as totalSales from sales group by product order by totalSales desc

select product,sum(saleAmount) as totalSales from sales where product in ('iphone','LG') group by product   --where
select product,sum(saleAmount) as totalSales from sales  group by product having product in ('iphone','LG')  --having

select product,sum(saleAmount) as totalSales from sales group by product having sum(saleAmount)>1000

