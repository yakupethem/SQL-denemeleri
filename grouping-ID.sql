select Continent,Country,City,sum(SaleAmount)as Total ,
	GROUPING(Continent) as GP1,
	GROUPING(Country) as GP2,
	GROUPING(City) as GP3
from Sales2
group by rollup(Continent,Country,City)
----------------------------------------

select Continent,Country,City,sum(SaleAmount)as Total ,
	GROUPING(Continent) +
	GROUPING(Country) +
	GROUPING(City) as GP,
	GROUPING_ID(Continent,Country,City) as GPID  --2 tabanýnda
from Sales2
group by rollup(Continent,Country,City)
having GROUPING_ID(Continent,Country,City)=1
--order by GPID

------------------------------------------

select  
case when
	GROUPING(Continent)=1 then 'hepsi' else ISNULL(Continent,'bilinmiyor')end as GP1,
case when
	GROUPING(Country) = 1 then 'hepsi' else ISNULL(Country,'bilinmiyor')end as GP2,
case when
	GROUPING(City)=1 then 'hepsi' else ISNULL(City,'bilinmiyor')end as GP3,

sum(SaleAmount)as Total

from Sales2
group by rollup(Continent,Country,City)