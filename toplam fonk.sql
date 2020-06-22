select * ,sum(salary) over (order by Id )as toplam 
from employes 