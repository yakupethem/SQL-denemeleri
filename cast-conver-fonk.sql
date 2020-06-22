
--cast ve convert fnk tip deðiþikliði için kulllanýlýr
--cast tavsiye edilir
--convert sql e özgüdür
--cast asci standartýdýr

select CAST(getdate() as nvarchar)
select 'yakocan',40,'yakocan'+cast(40 as nvarchar)

select CONVERT(nvarchar,getdate())
select CONVERT(nvarchar,getdate(),101)
select CONVERT(nvarchar,getdate(),102)
select CONVERT(nvarchar,getdate(),103)