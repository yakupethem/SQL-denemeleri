select TRY_CONVERT(int,'9')as result  --çevirdi
select TRY_CONVERT(int,'abc')as result -- null verdi
select TRY_CONVERT(xml,9)as result --hata verdi
----------------------------
select 
	case when TRY_CONVERT(int,'9') is null
	then 'baþarýsýz'
	else 'baþarýlý'
	end as result

select iif(TRY_CONVERT(int,'9')is null,'baþarýsýz','baþarýlý')
------------------------------

select TRY_CONVERT(int,'abc')as result  --null 
select CONVERT(int,'abc')as result  --hata

----------------------------

select name,TRY_CONVERT(int,age)as Age from tblPerson  --null
select name,CONVERT(int,age)as Age from tblPerson  --hata
------------------------


select TRY_CONVERT(xml,'<root>child/></root>')as result  ---çalýþtý
select try_parse('<root>child/></root>'as xml)as result  ---try parse sadece str tipten int veya date_time a dönüþtürür
