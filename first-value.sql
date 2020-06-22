select *,
FIRST_VALUE(name) over (partition by gender order by salary ) as firsValue
from employes