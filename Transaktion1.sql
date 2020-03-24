drop table Person;
create table Person (
age int,
navn varchar (30),
adresse varchar (30),
cpr varchar (30)
);


insert into Person
values (20, 'Ole', 'vej1', '1');

insert into Person
values (20, 'Oliver', 'vej2', '2');

insert into Person
values (20, 'Jens', 'vej3', '3');

insert into Person
values (20, 'Zia', 'vej4', '4');

insert into Person
values (20, 'Kipchoge', 'vej5', '5');

insert into Person
values (20, 'Banke', 'vej6', '6');

insert into Person
values (20, 'Yikers', 'vej7', '7');

insert into Person
values (20, 'Yeet', 'vej8', '8');

insert into Person
values (20, 'Beet', 'vej9', '9');

insert into Person
values (20, 'Skeet', 'vej10', '10');



begin tran 
select * from Person
where person.navn = 'Oliver';

select * from Person
where person.navn = 'Oliver';

commit tran


begin tran 
select count(*)
from Person

select count(*)
from Person

commit tran

set Transaction isolation level read uncommitted
set transaction isolation level read committed
Set Transaction isolation level repeatable read
set transaction isolation level serializable

Begin tran
--Transaktion
commit tran
--eller
rollback tran

