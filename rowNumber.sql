--row number
with commontable as
(select *,
row_number() over(partition by gender order by gender)as s�ralama
from employes)
delete from commontable where s�ralama>1

select * from employes
---------------------------------
select *,
ROW_NUMBER()over(partition by gender order by salary desc) as RowNumber,
rank() over(partition by gender order by salary desc) as [rank],
dense_rank() over(partition by gender order by salary desc) as denseRaNK
from employes  
---- her �� fonk i�in order by zorunlu,partition by opsiyonel