select * from product

--- tran �al��t�ktan sonra ba�ka sorguda de�i�tirilen ��kt�y� eskisis gibi g�r�nt�ler
set transaction isolation level serializable
begin tran 
select * from product
waitfor delay '00:00:10'
select * from product
commit tran