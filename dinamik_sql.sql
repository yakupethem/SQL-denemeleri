
declare @sql nvarchar(1000)

set @sql = 'select * from product'

execute sp_executesql @sql  ---dinamil sql için kullanýlan system procedure