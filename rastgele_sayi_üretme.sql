--rastgele say� �retme
-- 1 ile 5 aras�
declare @�strast int
set @�strast =5


declare @altrast int
set @altrast =1

select round(((@�strast-@altrast)*RAND()+1),0)
