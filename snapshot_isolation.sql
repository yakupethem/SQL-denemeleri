select * from product
---ba�ka yerde tran ile de�i�tirilen veritaban� kar���kl���n� engeller.ikiside commit etmeden son do�ru ��kt� al�nmaz
alter database �rnek12 set allow_snapshot_isolation on

set transaction isolation level snapshot

begin tran

update product set quantity=8 where id=1

commit tran