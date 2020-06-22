select * from sales
select * from product

create view viewTotal
with schemabinding 
as
select name,
sum(isnull((unitprice*sold),0))as totalSales,  --null olan varsa yerine 0 yaz
COUNT_BIG(*)as totaltransactions  --toplam� sayd�rmak i�in
from [dbo].[sales] inner join [dbo].[product]
on [dbo].[sales].�d=[dbo].[product].�d  --dbo yazmak zorunlu
group by name

select * from viewTotal

---olu�turulan indexin yaz�m �ekli:
create unique clustered index UIX_vwtotal_name 
on viewTotal(name)
--view i �a��rd���m�zda hesaplamalar daha h�zl� gelecektir bu sayede