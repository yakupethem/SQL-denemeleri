select * , ntile(2) over (partition by gender order by salary)as [ntile]
from employes
------ntile parçalara ayýrýr 
--partition opsiyonel order zorunlu