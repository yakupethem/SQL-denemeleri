
--cast ve convert fnk tip de�i�ikli�i i�in kulllan�l�r
--cast tavsiye edilir
--convert sql e �zg�d�r
--cast asci standart�d�r

select CAST(getdate() as nvarchar)
select 'yakocan',40,'yakocan'+cast(40 as nvarchar)

select CONVERT(nvarchar,getdate())
select CONVERT(nvarchar,getdate(),101)
select CONVERT(nvarchar,getdate(),102)
select CONVERT(nvarchar,getdate(),103)