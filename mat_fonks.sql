--mat fonksiyonlar

select ABS(-13)  --mutlak deðer

select CEILING(12.4)  --yukarý yuvarlar

select FLOOR(12.4)  --aþaðý yuvarlar

select POWER(2,3)  --üs alýr

select SQUARE(4)  --karesini alýr

select SQRT(16)  --karekök

select RAND()  --rastgele sayý üretir içinde deðer yoksa 0-1 arasýnda
select RAND(1) --hep ayný deðeri verir
select RAND()*100  --0-100 arasýnda deðer ürettik
select FLOOR( RAND()*100) --tam sayý aldýk

declare @rastgele int
set @rastgele=1

while @rastgele<=5
begin
select FLOOR(rand()*100)
set @rastgele=@rastgele+1
end

---round fonk yuvarlar

select ROUND(123.456,1)
select ROUND(123.456,1,1)
select ROUND(123.456,2)
select ROUND(123.456,2,1)
select ROUND(123.456,-1)
select ROUND(123.456,-2)
select ROUND(126.456,-1)
select ROUND(166.456,-2)
