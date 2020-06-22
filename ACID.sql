
--ACID Testi (atomic,consistent,isolated,durable)

select * from product
select * from sales

create proc up_sales
as begin 
	begin try
		begin tran
			update product set quantity=(quantity-10) where id=1

			insert into sales values (1,1,10)
		commit tran
	end try
	begin catch
		rollback tran
	end catch
end

---atomic: tran daki tüm iþlemlerin baþarýlý olmasý
--consistent: iþlemler sonucundaki çýktýnýn tutarlý olmasý (ör:veri tipi doðru olmalý)
---isolated: trans gerçekleþirken dýþarýdan herhangi bir müdahalenin olmamasý(ör:baþka sorguda tabloya eriþilmesi)
---durable:trans da bir hata olursa sistemi baþa döndürülmesinin garanti olmasý

alter proc up_sales
as begin 
	begin try
		begin tran
			update product set quantity=(quantity-20) where id=2

			insert into sales values (2,2,20)
		commit tran
	end try
	begin catch
		rollback tran
	end catch
end