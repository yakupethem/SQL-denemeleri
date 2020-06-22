select *,
LAST_VALUE(name) over (partition by gender order by salary
rows between unbounded preceding and unbounded following) as LAST
from employes