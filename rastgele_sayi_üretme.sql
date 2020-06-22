--rastgele sayı üretme
-- 1 ile 5 arası
declare @üstrast int
set @üstrast =5


declare @altrast int
set @altrast =1

select round(((@üstrast-@altrast)*RAND()+1),0)
