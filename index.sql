select * from sales 
where price<100  and price>90

-- çok fazla veride performanss artýrýr
create index IX_sales on sales(price asc)  --oluþtur

sp_helpindex sales
drop index sales.IX_sales  --sil