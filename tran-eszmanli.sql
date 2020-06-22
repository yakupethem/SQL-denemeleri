create table account
(
id int identity,
name nvarchar(20),
balance int
)

insert into account values ('yakup',1000)
insert into account values ('ethem',1000)
delete from account where id=2

select *from account
-------------

begin try
	
	begin tran
		--if (select balance from account where id=5)>0
			update account set balance-=1000 where id=5
		--if (select balance from account where id=5)>0
			update account set balance+=999 where id=6
		
	commit tran
	print 'onaylandý'
end try
begin catch
	
	rollback tran
	print 'geri alýndý-bakiye yetersiz'
end catch
--------------------

