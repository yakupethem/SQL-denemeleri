select * from product

create function	fn_abc(@id int)
returns nvarchar(50)
as begin
return (select name from product where ýd=@id)
end

select dbo.fn_abc(1)  --fonk çaðýrmada dbo yazýlmalý

sp_helptext fn_abc  --fonk içindekileri gösterir þifrelenmemiþse

---þifrelemek için;
alter function	fn_abc(@id int)
returns nvarchar(50)
with encryption
as begin
return (select name from product where ýd=@id)
end
sp_helptext fn_abc   --þimdi çalýþmaz çünkü þifrelendi

alter function	fn_abc(@id int)
returns nvarchar(50)
with schemabinding
as begin
return (select name from dbo.product where ýd=@id)  ---dbo yazýlmalý
end

