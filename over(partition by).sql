select name,salary,gender,
	count(gender) over(partition by gender) as genderstotal,
	avg(salary) over (partition by gender) as ortMaas,
	max(salary)  over (partition by gender) as maxMaas,
	min(salary) over (partition by gender) as minMaas

from employes