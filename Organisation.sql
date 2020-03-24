DROP TABLE MEDARBEJDER;

CREATE TABLE Medarbejder (
navn VARCHAR(30),
efternavn VARCHAR (30),
reference char (30),
medarbejdenummer char (30),
PRIMARY KEY (medarbejdenummer));

insert into Medarbejder (reference, medarbejdenummer, navn, efternavn)
values ('3', '1', 'Alf', 'Pallesen');

insert into Medarbejder (reference, medarbejdenummer, navn, efternavn)
values ('3', '2', 'Ib', 'Pedersen');

insert into Medarbejder (reference, medarbejdenummer, navn, efternavn)
values ('4', '3', 'Finn', 'Pølseskind');

insert into Medarbejder (reference, medarbejdenummer, navn, efternavn)
values (null, '4', 'Ole', 'Ølhund');

select B.navn + ' ' + B.efternavn AS Medarbejder , A.navn +' '+ A.efternavn AS Leder
from Medarbejder A
Inner join Medarbejder B ON a.medarbejdenummer = b.reference;