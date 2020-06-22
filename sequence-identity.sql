create table employes(
ýd int primary key identity(1,1),
name nvarchar(50),
gender nvarchar(10)
)
go

create sequence sequenceObject
as int
start with 1
increment by 1

create table customers(
id int primary key,
name nvarchar(50),
gender nvarchar(10)

)
go

create table users(
id int primary key,
name nvarchar(50),
gender nvarchar(10)

)
go

insert into customers values(next value for sequenceObject,'ben','male')
insert into customers values(next value for sequenceObject,'sara','famale')

insert into users values(next value for sequenceObject,'tom','male')
insert into users values(next value for sequenceObject,'pam','famale')
insert into users values(next value for sequenceObject,'david','male')
go

select * from customers
select * from users
