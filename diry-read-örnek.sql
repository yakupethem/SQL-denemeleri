select * from product

begin tran
update product set quantity=60 where id=1
waitfor delay '00:00:05' --5 sn durdur
rollback tran

---ba�ka bir sorguda onaylanmam��-durdurulan- tabloya ula�mak i�in

---set transactino  isolaiton level  read uncommitted
--veya
--select * from product (NOLOCK) where id=1