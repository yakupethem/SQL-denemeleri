select * from tablea
intersect   --ayn�lar� getirir filtreler
select * from tableb  --null de�er varsa getirir

select * from tablea as ta
inner join tableb as tb  --ayn�lar� getirir filtrelemez
on ta.Id=tb.ID  --filtrelemesini i�in 'select'ten sonra distinct kullan
-- null de�er varsa bile getirmez