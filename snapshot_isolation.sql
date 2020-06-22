select * from product
---baþka yerde tran ile deðiþtirilen veritabaný karýþýklýðýný engeller.ikiside commit etmeden son doðru çýktý alýnmaz
alter database örnek12 set allow_snapshot_isolation on

set transaction isolation level snapshot

begin tran

update product set quantity=8 where id=1

commit tran