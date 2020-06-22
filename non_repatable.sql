select * from product

set transaction isolation level repeatable read
begin tran 
select * from product where id=1
waitfor delay '00:00:10'
select * from product where id=1
commit transaction

---ayný anda yapýlan edðiþikliklerde çýkan sorunu düzeltmek için