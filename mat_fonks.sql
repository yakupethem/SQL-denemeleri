--mat fonksiyonlar

select ABS(-13)  --mutlak de�er

select CEILING(12.4)  --yukar� yuvarlar

select FLOOR(12.4)  --a�a�� yuvarlar

select POWER(2,3)  --�s al�r

select SQUARE(4)  --karesini al�r

select SQRT(16)  --karek�k

select RAND()  --rastgele say� �retir i�inde de�er yoksa 0-1 aras�nda
select RAND(1) --hep ayn� de�eri verir
select RAND()*100  --0-100 aras�nda de�er �rettik
select FLOOR( RAND()*100) --tam say� ald�k

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
