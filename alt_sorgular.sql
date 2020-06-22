--satýlmayann ürünleri göster

select * from product
select * from sales

select * from product where ID not in (select productID from sales) --1.yöntem alt sorgu
--paratez içi kendi baþýna çalþýyor iliþki olmayan alt sorgu

select p.* from product as p left join  sales as s on p.ID=s.productID
where s.productID is null  -- 2.yöntem join ile


--toplam satýlan ürün miktarý ve ürün isimleri bul

select name,(select SUM(quantitSold) from sales where productID=product.ID) as QtySold
from product  order by name   --1.yöntem alt sorgu
--paratez içi kendi baþýna çalþmýyor iliþki alt sorgu

select p.name,SUM(quantitSold) from product as p left join sales as s on p.ID=s.productID
group by name   --2.yöntem join ile
