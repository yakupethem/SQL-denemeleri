create trigger trg_product_Forinsert on product
for insert
as begin
	declare @id int
	select @id=�d from product
	insert into productAudit
	values ('yeni �r�n id= '+CAST(@id as nvarchar(50))+ CAST(GETDATE() as nvarchar(50))+' eklendi.')
end

select * from productAudit
select * from product

insert into product values (5,'balls',10)
delete from product where �d=5

alter trigger trg_product_Forinsert on product
for insert
as begin
select * from inserted
	declare @id int
	select @id=�d from product
	insert into productAudit
	values ('yeni �r�n id= '+CAST(@id as nvarchar(50))+ CAST(GETDATE() as nvarchar(50))+' eklendi.')
end

create trigger trg_product_Fordelete on product
for delete
as begin
select * from deleted
	declare @id int
	select @id=�d from product
	insert into productAudit
	values ('yeni �r�n id= '+CAST(@id as nvarchar(50))+ CAST(GETDATE() as nvarchar(50))+' silindi.')
end

---update
create trigger trg_product_forUpdate on product
for update
as begin
	select * from deleted
	select * from inserted
end

update product set name='tshirt',unitprice=20 where �d=3

--------------------------
