select TRY_PARSE('99'as int)as result  --str deðeri int e dönüþtürür
select TRY_PARSE('abc'as int)as result --dönüþtüremezse null deðeri verir
select PARSE('99'as int)as result  --str deðeri int e dönüþtürür
select PARSE('abc'as int)as result  --dönüþtüremezse hata deðeri verir

select
case when TRY_PARSE('99'as int)is null
then 'dönüþüm baþarýsýz'
else 'dönüþüm baþarýlý' end as resultt

select iif(TRY_PARSE('99'as int)is null,'baþarýsýz','baþarýlý')

select name,TRY_PARSE(age as int)as Age from tblPerson