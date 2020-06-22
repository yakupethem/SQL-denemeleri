select * from sysobjects where xtype='u'

-- IT: ,ternal table
--P:store procedure
--PK: primary key
--S:system table
--U:user talbe
--V:view
--IF:in-lined table-function
--F:foreign key constraint

----
select * from sys.tables
select * from sys.views
select * from sys.procedures
select * from sys.databases

--

select * from INFORMATION_SCHEMA.TABLES
select * from INFORMATION_SCHEMA.ROUTINES