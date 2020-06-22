select * from tablea
intersect   --aynýlarý getirir filtreler
select * from tableb  --null deðer varsa getirir

select * from tablea as ta
inner join tableb as tb  --aynýlarý getirir filtrelemez
on ta.Id=tb.ID  --filtrelemesini için 'select'ten sonra distinct kullan
-- null deðer varsa bile getirmez