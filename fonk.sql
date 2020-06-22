select * from product

create function	fn_abc(@id int)
returns nvarchar(50)
as begin
return (select name from product where �d=@id)
end

select dbo.fn_abc(1)  --fonk �a��rmada dbo yaz�lmal�

sp_helptext fn_abc  --fonk i�indekileri g�sterir �ifrelenmemi�se

---�ifrelemek i�in;
alter function	fn_abc(@id int)
returns nvarchar(50)
with encryption
as begin
return (select name from product where �d=@id)
end
sp_helptext fn_abc   --�imdi �al��maz ��nk� �ifrelendi

alter function	fn_abc(@id int)
returns nvarchar(50)
with schemabinding
as begin
return (select name from dbo.product where �d=@id)  ---dbo yaz�lmal�
end

