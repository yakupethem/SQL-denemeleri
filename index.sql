select * from sales 
where price<100  and price>90

-- �ok fazla veride performanss art�r�r
create index IX_sales on sales(price asc)  --olu�tur

sp_helpindex sales
drop index sales.IX_sales  --sil