select COUNT(*) from product
select count(*) from sales


CHECKPOINT
GO
DBCC DROPCLEANBUFFERS;  --SORGU �NBELLE��N� TEM�ZLER
GO
DBCC FREEPROCCACHE;  --EXECUT�ON PLAN �NBELLE��NN� TEM�ZLER
GO
	

--EN AZ B�R KERE SATILAN �R�NLER�N L�STES� (subquary)
select ID,name,description  from product where ID in(
select productID from sales
)

select distinct product.ID,name,description from product inner join
sales on product.ID =sales.productID

--EN AZ B�R KERE SATILMAYAN �R�NLER�N L�STES� (join ile)  (1.407.132 sat�r -7saniye)
select ID,name,[description] from product where not exists (select * from sales where productID = product.ID)


--e�le�meyen sat�rlar product'dan sales'e (1.407.132 sat�r -7saniye)

select product.ID,name,[description] from product  left join sales on product.ID=sales.productID where sales.productID is null
