select * from date

insert into date values(
GETDATE(),GETDATE(),GETDATE(),GETDATE()
)

select DATENAME(month,getdate())  --ayýn ismini getirir

select DATENAME(day,getdate())  --günün numarasýný getirir

select DATENAME(WEEKDAY,getdate()) --günün ismini getirir
select DATENAME(WEEKDAY,2010-12-9)
select DATENAME(WEEKDAY,1994-05-11)  --y40 cuma günü doðmuþ

datename --nvarchar döndürür
datepart -- integer döndürür

select DATENAME(WEEKDAY,1994-05-11)  --friday
select datepart(WEEKDAY,1994-05-11)--6
select datepart(MONTH,GETDATE())


dateadd -- belitilen tarihe belirtilen sayýyý ekler çýkarýr

select DATEADD(day,15,getdate())  --bugünden 15 gün sonrayý getirdi--int olarak
select DATEADD(day,-15,getdate())

datediff --iki tarih arasýndaki farký getirir

select DATEDIFF(day,1994-05-11,getdate())
