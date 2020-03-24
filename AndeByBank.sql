DROP TABLE Prioritet;
DROP TABLE L�n
DROP TABLE Transaktion;
DROP TABLE KundeHarKonto;
DROP TABLE Konto;
DROP TABLE Kunde;
DROP TABLE Medarbejder;
DROP TABLE Afdeling;
DROP TABLE Bank;
DROP TABLE PostDistrikt;

CREATE TABLE PostDistrikt (
postNr INT,
bynavn CHAR(20),
PRIMARY KEY (postNr) );

CREATE TABLE Bank (
navn CHAR(30),
adresse CHAR(30),
postNr INT,
PRIMARY KEY (navn),
FOREIGN KEY (postNr) REFERENCES PostDistrikt (postNr) );

CREATE TABLE Afdeling (
regNr INT,
navn CHAR(20),
adresse CHAR(30),
postNr INT,
tlfNr CHAR(11),
bank CHAR(30),
PRIMARY KEY (regNr),
FOREIGN KEY (bank) REFERENCES Bank (navn),
FOREIGN KEY (postNr) REFERENCES PostDistrikt (postNr));

CREATE TABLE Medarbejder (
cprNr CHAR(10),
afdeling INT,
titel CHAR(20),
navn CHAR(30),
adresse CHAR(30),
postNr INT,
PRIMARY KEY (cprNr),
FOREIGN KEY (postNr) REFERENCES PostDistrikt (postNr),
FOREIGN KEY (afdeling) REFERENCES Afdeling (regNr) );

CREATE TABLE Kunde (
cprNr CHAR(10),
navn CHAR(30),
adresse CHAR(30),
postNr INT,
PRIMARY KEY (cprNr),
FOREIGN KEY (postNr) references PostDistrikt (postNr) );

CREATE TABLE Konto (
regNr INT,
ktoNr BIGINT,
tekst CHAR(20),
saldo REAL,
renteIndl�n REAL,
renteUdl�n REAL,
PRIMARY KEY (regNr, ktoNr),
FOREIGN KEY (regNr) REFERENCES Afdeling (regNr) );

CREATE TABLE KundeHarKonto (
cprNr CHAR(10),
regNr INT,
ktonr BIGINT,
FOREIGN KEY (regNr, ktoNr) REFERENCES Konto  (regNr, ktoNr),
FOREIGN KEY (cprNr) REFERENCES kunde(cprNr) );

CREATE TABLE Transaktion (
regNr INT,
ktoNr BIGINT,
dato DATE,
tekst CHAR(20),
bel�b REAL,
FOREIGN KEY (regNr, ktoNr) REFERENCES Konto  (regNr, ktoNr));

CREATE TABLE L�n (
regNr INT,
ktoNr BIGINT,
l�neret REAL,
PRIMARY KEY (regNr, ktoNr),
FOREIGN KEY (regNr, ktoNr) references Konto (regNr, ktoNr) );

CREATE TABLE Prioritet (
regNr INT,
ktoNr BIGINT,
hovedstol REAL,
PRIMARY KEY (regNr, ktoNr),
FOREIGN KEY (regNr, ktoNr) REFERENCES Konto (regNr, ktoNr) );

insert into PostDistrikt (postNr, bynavn)
values ( 1313, 'Andeby');
insert into PostDistrikt (postNr, bynavn)
values ( 9191, 'G�ser�d');
insert into PostDistrikt (postNr, bynavn)
values ( 3456, 'Grisel�se');
insert into PostDistrikt (postNr, bynavn)
values ( 9999, 'Tosse');
insert into Bank (navn, adresse, postNr)
values ( 'Andeby Bank A/S', 'Joakim von And Boulevarden 4', 1313);
insert into Afdeling (regNr, navn, adresse, postNr, tlfNr)
values ( 1234, 'Andeby Nygade', 'Andeby Nygade 21', 1313, 
'+4589135689');
insert into Afdeling (regNr, navn, adresse, postNr, tlfNr)
values ( 1216, 'G�ser�d', 'G�ser�d Bygade 14', 9191, '+4589121241');
insert into Afdeling (regNr, navn, adresse, postNr, tlfNr)
values ( 1220, 'Grisel�se', 'Gammel Torv 2', 3456, '+4589421212');

insert into Medarbejder (cprNr, afdeling, titel, navn, adresse, postNr)
values ( '1209631223', 1234, 'Afdelingsdirekt�r', 'Mickie Mouse', 
'Spidsmusehegnet 1', 1313);
insert into Medarbejder (cprNr, afdeling, titel, navn, adresse, postNr)
values ( '2210711443', 1234, 'Erhvervsr�dgiver', 'Fedtmule', 
'Spidsmusehegnet 3', 1313);
insert into Medarbejder (cprNr, afdeling, titel, navn, adresse, postNr)
values ( '3112692132', 1234, 'Erhvervsr�dgiver', 'Minnie Mouse', 'Andeby 
Nygade 11', 1313);
insert into Medarbejder (cprNr, afdeling, titel, navn, adresse, postNr)
values ( '1504788775', 1234, 'Privatr�dgiver', 'Sorteper', 
'Forbryderv�nget 9', 1313);
insert into Medarbejder (cprNr, afdeling, titel, navn, adresse, postNr)
values ( '2712598753', 1216, 'Privatr�dgiver', 'F�tter Guf', 
'Bondeg�rden 3', 9191);
insert into Kunde (cprNr, navn, adresse, postNr)
values ( '1209631223', 'Store Stygge Ulv', 'Skovkanten 1', 3456);
insert into Kunde (cprNr, navn, adresse, postNr)
values ( '2210711443', 'Lille Stygge Ulv', 'Skovkanten 1', 3456);
insert into Kunde (cprNr, navn, adresse, postNr)
values ( '3112692132', 'De tre sm� grise', 'Skovkanten 7', 3456);
insert into Kunde (cprNr, navn, adresse, postNr)
values ( '1504788758', 'Andersine', 'Andeby Nygade 57', 1313);
insert into Kunde (cprNr, navn, adresse, postNr)
values ( '2712598723', 'Anders And', 'Paradis�blevej 13', 1313);
insert into Konto (regNr, ktoNr, tekst, saldo, renteIndl�n, renteUdl�n)
values ( 1234, 1234567, 'L�nkonto', 10000.00, 1.2, 5.2);
insert into Konto (regNr, ktoNr, tekst, saldo, renteIndl�n, renteUdl�n)
values ( 1234, 1231236, 'L�nkonto', 5000.00, 1.2, 5.2);
insert into Konto (regNr, ktoNr, tekst, saldo, renteIndl�n, renteUdl�n)
values ( 1234, 1357967, 'L�nkonto', 12000.00, 1.2, 5.2);
insert into Konto (regNr, ktoNr, tekst, saldo, renteIndl�n, renteUdl�n)
values ( 1216, 1256788, 'L�nkonto', 15000.00, 1.2, 5.2);
insert into Konto (regNr, ktoNr, tekst, saldo, renteIndl�n, renteUdl�n)
values ( 1216, 2234567, 'Boligl�n', 2550000.00, 1.2, 5.2);
insert into Konto (regNr, ktoNr, tekst, saldo, renteIndl�n, renteUdl�n)
values ( 1234, 2231236, 'Boligl�n', 3175000.00, 1.2, 5.2);
insert into KundeHarKonto (cprNr, regNr, ktonr)
values ( '1209631223', 1234, 2231236 );
insert into KundeHarKonto (cprNr, regNr, ktonr)
values ( '2210711443', 1234, 2231236 );
insert into KundeHarKonto (cprNr, regNr, ktonr)
values ( '3112692132', 1216, 1256788 );
insert into KundeHarKonto (cprNr, regNr, ktonr)
values ( '3112692132', 1234, 1357967 );
insert into KundeHarKonto (cprNr, regNr, ktonr)
values ( '3112692132', 1234,  785);
insert into KundeHarKonto (cprNr, regNr, ktonr)
values ( '3112692132', 1234,  900);
insert into KundeHarKonto (cprNr, regNr, ktonr)
values ( '3112692132', 1234,  1110);
insert into KundeHarKonto (cprNr, regNr, ktonr)
values ( '3112692132', 1234,  1110);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
values ( 1234, 2231236, '2008-01-02', 'Indbetaling', 5000.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
values ( 1234, 2231236, '2008-04-01', 'Indbetaling', 25000.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
values ( 1234, 2231236, '2008-08-03', 'Udbetaling', 500.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
values ( 1234, 1357967, '2008-08-04', 'Uddbetaling', 1000.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
values ( 1234, 1357967, '2008-08-05', 'Uddbetaling', 50.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
values ( 1234, 1357967, '2008-08-06', 'Uddbetaling', 250.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
values ( 1234, 1357967, '2008-08-07', 'Uddbetaling', 1250.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
values ( 1234, 1357967, '2008-08-08', 'Uddbetaling', 255.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
values ( 1234, 1357967, '2008-08-10', 'Uddbetaling', 300.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
values ( 1234, 1357967, '2008-08-11', 'Uddbetaling', 410.00);
insert into Transaktion (regNr, ktoNr, dato, tekst, bel�b)
values ( 1234, 1357967, '2008-08-12', 'Udbetaling', 50.00);
insert into L�n (regNr, ktoNr, l�neret)
values ( 1234, 1234567, 10000.00);
insert into L�n (regNr, ktoNr, l�neret)
values ( 1234, 1231236, 5000.00);
insert into L�n (regNr, ktoNr, l�neret)
values ( 1234, 1357967, 12000.00);
insert into L�n (regNr, ktoNr, l�neret)
values ( 1216, 1256788, 15000.00);
insert into Prioritet (regNr, ktoNr, hovedstol)
values ( 1216, 2234567, 5550000.00);
insert into Prioritet (regNr, ktoNr, hovedstol)
values ( 1234, 2231236, 4500000.00);

--Opgave 1. Find gennemsnitssaldo pr. afdeling

SELECT Afdeling.navn, AVG (Konto.saldo)
from Afdeling
Inner JOIN Konto ON Konto.regNr = Afdeling.regNr
GROUP BY Afdeling.navn;	

--2. Find gennemsnitssaldo pr.afdeling for kunder med en l�nkonto

SELECT Afdeling.navn AS Afdeling, AVG (Konto.saldo) AS Saldogennemsnit
from Konto
Inner JOIN Afdeling ON Konto.regNr = Afdeling.regNr and Konto.tekst = 'l�nkonto'
GROUP BY Afdeling.navn;	

--3. Find antal kunder pr.afdeling

Select COUNT(Konto.regNr) AS Kunder
from Konto, Afdeling
WHERE Konto.regNr = Afdeling.regNr
GROUP BY Konto.regNr;

--4. Find de kunder, der ikke har en l�nkonto

Select Kunde.navn AS Navn
from Kunde, KundeHarKonto, Konto
WHERE Kunde.cprNr = KundeHarKonto.cprNr AND KundeHarKonto.ktonr = Konto.ktoNr AND Konto.tekst != 'l�nkonto';

--5. Find de postnumre, hvor der hverken bor kunder eller medarbejdere

Select PostDistrikt.postNr
from PostDistrikt
EXCEPT
select PostDistrikt.postNr
from PostDistrikt,Kunde,Medarbejder
WHERE Kunde.postNr = Postdistrikt.postNr OR Medarbejder.postNr = PostDistrikt.postNr;

--6.Find navn, kontonummer transaktionstekst og transaktionsbel�b for en given kunde. (sorteret efter transaktionsdato)

Select Kunde.navn, KundeHarKonto.ktonr, Transaktion.tekst, Transaktion.bel�b
from Kunde, KundeHarKonto, Transaktion, Konto
WHERE Kunde.cprNr = '1209631223' AND Kunde.cprNr = KundeHarKonto.cprNr AND KundeHarKonto.ktonr = Konto.ktoNr AND Konto.ktoNr = Transaktion.ktoNr;	

--7. For alle prioritetskonti �nskes forskellen p� saldo og hovedstol beregnet.

Select Prioritet.hovedstol - Konto.saldo
from Konto, Prioritet
WHERE Konto.ktoNr = Prioritet.ktoNr;

--8. Find de konti, der ikke har transaktioner.

select Konto.ktoNr
from Konto
EXCEPT
SELECT Konto.ktoNr
from Konto, Transaktion
WHERE  Konto.ktoNr = Transaktion.ktoNr;

/*Anvend en sub-query til at opdatere bel�bet p� prioriteten hos de kunder 
der har en hovedstol p� under 5 millioner. H�v hovedstolen til 6 millioner.*/

Select Prioritet.hovedstol
from Konto, Prioritet
WHERE Konto.ktoNr = Prioritet.ktoNr;

UPDATE Prioritet
set hovedstol = 6000000
WHERE hovedstol in (select hovedstol from Prioritet where hovedstol < 5000000);

UPDATE Prioritet
set hovedstol = 6000000
WHERE hovedstol < 5000000;

/*
Opgave 2 Anvend en eller flere sub-
queries til at finde antallet af transaktioner p� 
l�nkonti under 10.000 fra August 2008*/

SELECT COUNT(*) AS 'Antal transaktioner'
from Transaktion
WHERE dato in (select Transaktion.dato from Konto, Transaktion
where Konto.ktoNr = Transaktion.ktoNr AND Konto.tekst = 'l�nkonto' AND dato >= '2008-08-01' AND dato <= '2008-08-31' 
AND Transaktion.bel�b < 10000);

/*3.
Anvend en kombinations
query og find de medarbejdere der ikke bor i Andeby
*/

SELECT Medarbejder.navn AS 'Medarbejdere der ikke bor i Andeby'
from Medarbejder
EXCEPT 
select Medarbejder.navn
from Medarbejder, PostDistrikt
where Medarbejder.postNr = 1313;

/*Opgave 4.
Skriv en kombinations
query der anvender EXCEPT til at finde de l�nkonti 
der ikke har en kunde */

select Konto.ktoNr
from Konto
where Konto.tekst = 'l�nkonto'
EXCEPT
select Konto.ktoNr
from Konto, KundeHarKonto
Where konto.ktoNr = KundeHarKonto.ktonr;


--Lektion 6

/* 1.
Lav et view, der viser alle 
kunder med navn, adresse, postdistrikt, 
samt kundens konti med den aktuelle saldo.
*/

drop view kunder;
create view kunder AS	
select Kunde.navn, Kunde.adresse, Kunde.postNr, Konto.saldo
from Kunde, KundeHarKonto, PostDistrikt, Konto
WHERE Kunde.cprNr = KundeHarKonto.cprNr AND Kunde.postNr = PostDistrikt.postNr AND KundeHarKonto.ktonr = Konto.ktoNr;

select * from kunder;

--Opgave 2
/*1.
Lav en stored procedure, der returnerer
kontonummer, saldo,afdelingens registreringsnummer og navn. Test den.
*/

Create procedure Opgave1
AS
BEGIN
SELECT Afdeling.navn, Konto.ktonr, Konto.saldo, Afdeling.regNr
from Konto, Afdeling
WHERE Konto.regNr = Afdeling.regNr;
END;

execute Opgave1

/*2.
Lav en stored procedure, der givet et cpr-nummer(kundeId)
, returnerer kontohavers navn, kontonummer og saldo for alle den p�g�ldende kontohavers konti.
*/
DROP Procedure Opgave2;

CREATE PROCEDURE Opgave2
 @KundeId nvarchar(30)
AS
BEGIN
SELECT Kunde.navn, Konto.ktoNr, Konto.saldo
from Konto, Kunde, KundeHarKonto
WHERE @KundeId = Kunde.cprNr AND @KundeId = KundeHarKonto.cprNr AND KundeHarKonto.ktonr = Konto.ktoNr;
END;

delete from KundeHarKonto WHERE KundeHarKonto.cprNr = '2210711443';

execute Opgave2  '3112692132';

/*3.
Lav en stored procedure, der givet et 
cpr-nummer, returnerer (i en output parameter) kontohavers samlede indest�ende.*/

CREATE PROCEDURE Opgave3
  @KundeId nvarchar(30)
AS
BEGIN
SELECT SUM (Konto.saldo)
from Kunde, Konto, KundeHarKonto
WHERE @KundeId = Kunde.cprNr AND @KundeId = KundeHarKonto.cprNr AND KundeHarKonto.ktonr = Konto.ktoNr;
END;

exec Opgave3 '3112692132';

Create Procedure Opgave4
	@regNr int, @ktoNr BIGINT, @tekst varchar(30), @saldo REAL, @renteIndl�n REAL, @renteUdl�n REAL
AS
BEGIN
insert into Konto (regNr, ktoNr, tekst, saldo, renteIndl�n, renteUdl�n)
	values ( @regNr, @ktoNr, @tekst, @saldo, @renteIndl�n, @renteUdl�n);
END;

execute Opgave4 1234, 1110, OMEGA,42,5,5;	

select * from konto	

-- Opgave 3

/*1.
Lav en trigger, der for
hindrer
oprettelsen af en ny konto, hvis den p�g�ldende person 
allerede har 3 konti i forvejen. Gi
v en passende fejlmeddelelse.
*/

DROP TRIGGER max3Konto;
CREATE TRIGGER max3Konto
 on KundeHarKonto
FOR Insert 
AS IF (select count (KundeHarKonto.cprNr)
from KundeHarKonto, inserted WHERE KundeHarKonto.cprNr = inserted.cprNr ) > 3
begin
print 'Det er ikke muligt at oprette flere end 3 konti'
ROLLBACK transaction
END;

DROP Trigger DeleteKunde

CREATE TRIGGER DeleteKunde
on Kunde
FOR DELETE
AS
	IF (select count (KundeHarKonto.cprNr)
from KundeHarKonto, deleted WHERE KundeHarKonto.cprNr = deleted.cprNr ) < 1

begin 
DELETE from Kunde
WHERe Kunde.cprNr = (Select cprNr from deleted)
END;

select * from Kunde



select * from Transaktion