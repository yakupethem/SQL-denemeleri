alter table tablePerson add constraint tablePerson_genderID_FK
foreign key (genderID) references tableGender(ID)