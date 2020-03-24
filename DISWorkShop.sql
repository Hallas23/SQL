drop table Kunde;
drop table Bestilling;

create table Kunde (
kundeid int,
navn varchar(25),
postnr char(4)
);

create table Bestilling (
kundeid int,
varenavn varchar(25),
antalvarer int
);


insert into Kunde values (2, 'Ida', '4000');

insert into Kunde values (4, 'Mathilde', '8000');

insert into Kunde values (6, 'Trump', '6500');


insert into Bestilling values(2, 'Øl',2000);

insert into Bestilling values(4, 'Toej',4000);

insert into Bestilling values(6, 'Stoffer' ,6000);

insert into Bestilling values(3, 'Sand' ,3000);

insert into Bestilling values(5, 'Kode', 5000);


create view alleKunder
as
	select *
	from Kunde
	UNION
	select * 
	from dbB.dbo.Kunde


select * from [alleKunder];

select * from kunde

drop trigger ligeEllerUlige;

CREATE TRIGGER ligeEllerUlige
ON alleKunder
INSTEAD OF INSERT
AS
BEGIN
   IF (SELECT kundeid FROM inserted) % 2 = 0
   BEGIN
      INSERT INTO Kunde
	   VALUES ((SELECT kundeid FROM inserted), (SELECT navn FROM inserted), (SELECT postnr FROM inserted));
   END
   ELSE
   BEGIN
        INSERT INTO dbB.dbo.Kunde
	   VALUES ((SELECT kundeid FROM inserted), (SELECT navn FROM inserted), (SELECT postnr FROM inserted));
    END
END
GO

insert into alleKunder values (21, 'Jens', '2100');

select alleKunder.kundeid, sum(dbB.dbo.Postering.beloeb)
from alleKunder, dbB.dbo.Postering
where alleKunder.kundeid = dbB.dbo.Postering.kundeid
group by alleKunder.kundeid

create view Antalbestillinger
as
select alleKunder.kundeid, Count(Bestilling.kundeid) AS Antal
from alleKunder, Bestilling
where alleKunder.kundeid = Bestilling.kundeid
group by alleKunder.kundeid

select * from Antalbestillinger