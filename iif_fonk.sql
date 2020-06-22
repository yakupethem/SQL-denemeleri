select Name,Gender ,
		iif(Gender='male',1,2) as genderId ---eger male true ise 1 false ise 2  genderId sütununa yaz
from tblEmployee