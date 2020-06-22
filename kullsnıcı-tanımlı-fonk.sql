---kullanýcý tanýmlý fonsiyon

create function fn_age(@DT date)
returns int
as
begin
declare @yas int
set @DT = '11/05/1994'

set @yas=DATEDIFF(YEAR,@DT,GETDATE())
return @yas
end

alter function fn_age(@DT date)
returns int
as
begin
declare @yas int
set @yas=DATEDIFF(YEAR,@DT,GETDATE())
return @yas
end

select dbo.fn_age('11/05/1994')

sp_helptext fn_age

---fonk ile store prosedür arasýnda fonk daha cazip