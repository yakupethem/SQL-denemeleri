select * , ntile(2) over (partition by gender order by salary)as [ntile]
from employes
------ntile par�alara ay�r�r 
--partition opsiyonel order zorunlu