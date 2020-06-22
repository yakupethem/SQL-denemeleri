select * from sales
select * from product

create view viewTotal
with schemabinding 
as
select name,
sum(isnull((unitprice*sold),0))as totalSales,  --null olan varsa yerine 0 yaz
COUNT_BIG(*)as totaltransactions  --toplamý saydýrmak için
from [dbo].[sales] inner join [dbo].[product]
on [dbo].[sales].ýd=[dbo].[product].ýd  --dbo yazmak zorunlu
group by name

select * from viewTotal

---oluþturulan indexin yazým þekli:
create unique clustered index UIX_vwtotal_name 
on viewTotal(name)
--view i çaðýrdýðýmýzda hesaplamalar daha hýzlý gelecektir bu sayede