select TRY_PARSE('99'as int)as result  --str de�eri int e d�n��t�r�r
select TRY_PARSE('abc'as int)as result --d�n��t�remezse null de�eri verir
select PARSE('99'as int)as result  --str de�eri int e d�n��t�r�r
select PARSE('abc'as int)as result  --d�n��t�remezse hata de�eri verir

select
case when TRY_PARSE('99'as int)is null
then 'd�n���m ba�ar�s�z'
else 'd�n���m ba�ar�l�' end as resultt

select iif(TRY_PARSE('99'as int)is null,'ba�ar�s�z','ba�ar�l�')

select name,TRY_PARSE(age as int)as Age from tblPerson