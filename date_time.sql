select * from date

insert into date values(
GETDATE(),GETDATE(),GETDATE(),GETDATE()
)

select DATENAME(month,getdate())  --ay�n ismini getirir

select DATENAME(day,getdate())  --g�n�n numaras�n� getirir

select DATENAME(WEEKDAY,getdate()) --g�n�n ismini getirir
select DATENAME(WEEKDAY,2010-12-9)
select DATENAME(WEEKDAY,1994-05-11)  --y40 cuma g�n� do�mu�

datename --nvarchar d�nd�r�r
datepart -- integer d�nd�r�r

select DATENAME(WEEKDAY,1994-05-11)  --friday
select datepart(WEEKDAY,1994-05-11)--6
select datepart(MONTH,GETDATE())


dateadd -- belitilen tarihe belirtilen say�y� ekler ��kar�r

select DATEADD(day,15,getdate())  --bug�nden 15 g�n sonray� getirdi--int olarak
select DATEADD(day,-15,getdate())

datediff --iki tarih aras�ndaki fark� getirir

select DATEDIFF(day,1994-05-11,getdate())
