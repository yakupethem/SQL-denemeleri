--select * from product where id=1
set transaction isolation level repeatable read
begin tran
declare @quan int
select @quan=quantity from product where id=1
waitfor delay '00:00:05'
set @quan=@quan-1
update product set quantity=@quan where id=1
print @quan
commit tran


