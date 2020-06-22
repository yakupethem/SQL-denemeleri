
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

---atomic: tran daki t�m i�lemlerin ba�ar�l� olmas�
--consistent: i�lemler sonucundaki ��kt�n�n tutarl� olmas� (�r:veri tipi do�ru olmal�)
---isolated: trans ger�ekle�irken d��ar�dan herhangi bir m�dahalenin olmamas�(�r:ba�ka sorguda tabloya eri�ilmesi)
---durable:trans da bir hata olursa sistemi ba�a d�nd�r�lmesinin garanti olmas�

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