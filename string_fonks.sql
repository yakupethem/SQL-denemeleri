
select ASCII('A') -- str'nin int deðerini verir

select CHAR(65)--int'in str karþýlýðýný verir

declare @start int  --büyük harfleri yazdýran döngü
set @start=65
while(@start<=90)
begin
	print char(@start)
	set @start=@start+1
end

declare @start2 int  --küçük harfleri yazdýran döngü
set @start2=97
while(@start2<=122)
begin
	print char(@start2)
	set @start2=@start2+1
end
------------------------
[Ltrim()]  --soldaki boþluklarý siler
[Rtrim()]  --saðdaki boþluklarý siler
[Reverse()]  --sondan baþa yazdýrýr
----------------
[Left()]  --soldan basamak alýr 
select LEFT('abcdefg',3)
[Right()]  --saðdan basamak alýr 
select right('abcdefg',3)
---------------
[Charindex()] ---aranan ifadenin sýrasýný verir
select CHARINDEX('@','yakocan40@gmail.com')
[Substring()] --- belirlenen indexten sonrasýný getirir
select SUBSTRING('yakocan40@gmail.com',10,10)
----------------
---maillerdeki dominleri alýp gruplandýrdýk
select SUBSTRING(email,CHARINDEX('@',email)+1,LEN(email)-CHARINDEX('@',email)) as domain,COUNT(email) as email_sayýsý	
from employes
group by SUBSTRING(email,CHARINDEX('@',email)+1,LEN(email)-CHARINDEX('@',email))
order by COUNT(email) desc
--------
[Space()] ---parantezde belirtilen kadar boþluk koyar
[Replicate()]--belirlenen kadar tekrar eder
select  replicate('yako ',3)
------
[Replace()] ---ifade deðiþtirme
select REPLACE(email,'com','net') from employes
-------
[Stuff()] ---belirlenen yerden belirlenen kadar siler ve belirleneni geitirir
select email,STUFF(email,2,3,'****')as stuufEmail from employes