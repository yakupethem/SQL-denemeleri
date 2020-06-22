exec upoffsetfetchNext 1,10

create  procedure upoffsetfetchNext
@pagenumber int,
@pagesize int
as 
begin
			select * from tblproducts
			order by Id
			offset (@pagenumber -1)*@pagesize rows
			fetch next @pagesize rows only
end