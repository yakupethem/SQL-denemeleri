select country,gender,sum(salary) as salaryTotal  from employees
group by 
grouping sets
(
	--(country,gender),
	(country),
	(gender),
	()
)
order by grouping(country),grouping(gender),gender

---------------------------------------------------

select country,gender,sum(salary) as salaryTotal  from employees
group by cube(country,gender)  ---------olasý tüm kombinasyonlarý getirir	