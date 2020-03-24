drop table Kunde;
drop table Postering;

create table Kunde (
kundeid int,
navn varchar(25),
postnr char(4)
);

create table Postering (
kundeid int,
beloeb int
);


insert into Kunde values (1, 'Ole', '6000');

insert into Kunde values (3, 'Oliver', '8000');

insert into Kunde values (5, 'Zia', '7000');

insert into Postering values(2,2000);

insert into Postering values(2,2000);

insert into Postering values(4,4000);

insert into Postering values(6,6000);

insert into Postering values(3,3000);

insert into Postering values(5,5000);

select * from kunde