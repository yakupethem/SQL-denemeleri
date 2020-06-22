select * from product

begin tran
update product set quantity=60 where id=1
waitfor delay '00:00:05' --5 sn durdur
rollback tran

---baþka bir sorguda onaylanmamýþ-durdurulan- tabloya ulaþmak için

---set transactino  isolaiton level  read uncommitted
--veya
--select * from product (NOLOCK) where id=1