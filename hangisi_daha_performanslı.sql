select COUNT(*) from product
select count(*) from sales


CHECKPOINT
GO
DBCC DROPCLEANBUFFERS;  --SORGU ÖNBELLEÐÝNÝ TEMÝZLER
GO
DBCC FREEPROCCACHE;  --EXECUTÝON PLAN ÖNBELLEÐÝNNÝ TEMÝZLER
GO
	

--EN AZ BÝR KERE SATILAN ÜRÜNLERÝN LÝSTESÝ (subquary)
select ID,name,description  from product where ID in(
select productID from sales
)

select distinct product.ID,name,description from product inner join
sales on product.ID =sales.productID

--EN AZ BÝR KERE SATILMAYAN ÜRÜNLERÝN LÝSTESÝ (join ile)  (1.407.132 satýr -7saniye)
select ID,name,[description] from product where not exists (select * from sales where productID = product.ID)


--eþleþmeyen satýrlar product'dan sales'e (1.407.132 satýr -7saniye)

select product.ID,name,[description] from product  left join sales on product.ID=sales.productID where sales.productID is null
