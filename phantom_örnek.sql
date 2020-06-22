select * from product

--- tran çalýþtýktan sonra baþka sorguda deðiþtirilen çýktýyý eskisis gibi görüntüler
set transaction isolation level serializable
begin tran 
select * from product
waitfor delay '00:00:10'
select * from product
commit tran