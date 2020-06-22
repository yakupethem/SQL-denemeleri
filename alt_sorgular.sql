--sat�lmayann �r�nleri g�ster

select * from product
select * from sales

select * from product where ID not in (select productID from sales) --1.y�ntem alt sorgu
--paratez i�i kendi ba��na �al��yor ili�ki olmayan alt sorgu

select p.* from product as p left join  sales as s on p.ID=s.productID
where s.productID is null  -- 2.y�ntem join ile


--toplam sat�lan �r�n miktar� ve �r�n isimleri bul

select name,(select SUM(quantitSold) from sales where productID=product.ID) as QtySold
from product  order by name   --1.y�ntem alt sorgu
--paratez i�i kendi ba��na �al�m�yor ili�ki alt sorgu

select p.name,SUM(quantitSold) from product as p left join sales as s on p.ID=s.productID
group by name   --2.y�ntem join ile
