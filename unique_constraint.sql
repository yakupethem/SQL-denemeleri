alter table tablePerson
add constraint [UQ_tablePerson] unique(name)

alter table tablePerson
drop constraint [UQ_tablePerson]

