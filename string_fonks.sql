
select ASCII('A') -- str'nin int de�erini verir

select CHAR(65)--int'in str kar��l���n� verir

declare @start int  --b�y�k harfleri yazd�ran d�ng�
set @start=65
while(@start<=90)
begin
	print char(@start)
	set @start=@start+1
end

declare @start2 int  --k���k harfleri yazd�ran d�ng�
set @start2=97
while(@start2<=122)
begin
	print char(@start2)
	set @start2=@start2+1
end
------------------------
[Ltrim()]  --soldaki bo�luklar� siler
[Rtrim()]  --sa�daki bo�luklar� siler
[Reverse()]  --sondan ba�a yazd�r�r
----------------
[Left()]  --soldan basamak al�r 
select LEFT('abcdefg',3)
[Right()]  --sa�dan basamak al�r 
select right('abcdefg',3)
---------------
[Charindex()] ---aranan ifadenin s�ras�n� verir
select CHARINDEX('@','yakocan40@gmail.com')
[Substring()] --- belirlenen indexten sonras�n� getirir
select SUBSTRING('yakocan40@gmail.com',10,10)
----------------
---maillerdeki dominleri al�p grupland�rd�k
select SUBSTRING(email,CHARINDEX('@',email)+1,LEN(email)-CHARINDEX('@',email)) as domain,COUNT(email) as email_say�s�	
from employes
group by SUBSTRING(email,CHARINDEX('@',email)+1,LEN(email)-CHARINDEX('@',email))
order by COUNT(email) desc
--------
[Space()] ---parantezde belirtilen kadar bo�luk koyar
[Replicate()]--belirlenen kadar tekrar eder
select  replicate('yako ',3)
------
[Replace()] ---ifade de�i�tirme
select REPLACE(email,'com','net') from employes
-------
[Stuff()] ---belirlenen yerden belirlenen kadar siler ve belirleneni geitirir
select email,STUFF(email,2,3,'****')as stuufEmail from employes