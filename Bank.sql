drop table Transaktion;
drop table KundeKonto;
drop table Konto;
drop table Kunde;
drop table Medarbejder;
DROP TABLE Afdeling;
DROP TABLE Bank;



CREATE TABLE Bank (
	Navn VARCHAR(50) NOT NULL,
	Adresse VARCHAR(50) NOT NULL,
	postNr int NOT NULL,
	byNavn VARCHAR(50) NOT NULL,
	BankID INT NOT NULL,
	PRIMARY KEY (BankId));

CREATE TABLE Afdeling (
	RegNr INT NOT NULL,
	BankID INT NOT NULL,
	navn VARCHAR(50) NOT NULL,
	adresse VARCHAR(50) NOT NULL,
	postNr INT NOT NULL,
	tlfnr VARCHAR(50) NOT NULL,
	primary key (RegNr),
	FOREIGN KEY (BankID) REFERENCES Bank );


	CREATE TABLE Medarbejder (
	CprNr INT NOT NULL,
	navn VARCHAR (20) NOT NULL,
	titel VARCHAR(20) NOT NULL,
	postNr INT NOT NULL,
	adresse VARCHAR (20) NOT NULL,
	bynavn VarChar (20) NOT NULL,
	RegNr INT NOT NULL,
	primary key (CprNr),
	FOREIGN KEY (RegNr) REFERENCES Afdeling);

	Create table Kunde (
	CprNr INT NOT NULL,
	Navn VARCHAR(200) NOT NULL,
	Adresse varchar(200) NOT NULL,
	PostNr INT NOT NULL,
	Bynavn varchar(200) NOT NULL,
	primary key (CprNr));

	CREATE TABLE Konto (
	RegNr INT NOT NULL,
	ktonr INT NOT NULL,
	tekst VARCHAR(20) NOT NULL,
	saldo decimal (9,4) NOT NULL,
	renteindlån INT NOT NULL,
	renteudlån INT NOT NULL,
	FOREIGN KEY (RegNr) REFERENCES Afdeling,
	primary key (ktonr));

	CREATE TABLE KundeKonto (
	ID int NOT NULl,
	ktonr int NOT NULL,
	CprNr int NOT NULL,
	FOREIGN KEY (CprNr) REFERENCES Kunde,
	FOREIGN KEY (ktonr) REFERENCES Konto,
	primary key (ID));

	Create Table Transaktion (
	transID int NOT NULL,
	RegNr int NOT NULL,
	ktonr int NOT NULL,
	tekst VARCHAR NOT NULL,
	dato date NOT NULL,
	beløb decimal (9,4) NOT NULL,
	FOREIGN KEY (ktonr) REFERENCES Konto,
	primary key (transID));

INSERT INTO KUNDE (CprNr, navn, adresse, postNr, bynavn)
VALUES (1, 'Hans Hansen', 'Hans Hansens vej 54', 8200, 'Fredericia');

INSERT INTO KUNDE (CprNr, navn, adresse, postNr, bynavn)
VALUES (2, 'Ole Hansen', 'Hans Hansens vej 54', 8200, 'Odense');

INSERT INTO KUNDE (CprNr, navn, adresse, postNr, bynavn)
VALUES (3, 'Hans Hansen', 'Heste Hansens vej 54', 8230, 'Grøndland');

INSERT INTO KUNDE (CprNr, navn, adresse, postNr, bynavn)
VALUES (4, 'Hans Petersen', 'Hans Hansens vej 54', 8230, 'Andeby');

INSERT INTO Bank (Navn, Adresse, postNr, byNavn, BankID)
VALUES ('Jyske Bank', 'OleVej', 7000, 'Fredericia', 1337);

INSERT INTO Bank (Navn, Adresse, postNr, byNavn, BankID)
VALUES ('Rey Mysterio', 'MysterioVej', 619, 'Unknown', 619);

INSERT INTO Afdeling (RegNr, BankID, navn, adresse, postNr, tlfnr)
VALUES (539, 1337, 'Banke Bank', 'Cena 112', 5000, 12345678);

INSERT INTO Afdeling (RegNr, BankID, navn, adresse, postNr, tlfnr)
VALUES (420, 619, 'Chair Noise', 'Dog', 5000, 42042019);

INSERT INTO Medarbejder(CprNr, navn, titel, postNr, adresse, bynavn, RegNr)
VALUES (1616, 'BOOOOY', 'Mester', 7000, 'Mestervej', 'Mesterby', 420);

INSERT INTO Medarbejder(CprNr, navn, titel, postNr, adresse, bynavn, RegNr)
VALUES (4500, 'GIIIRL', 'Mester', 7000, 'Mestervej', 'Mesterby', 539);

INSERT INTO Konto (RegNr, ktonr, tekst,saldo, renteindlån,renteudlån)
VALUES (420, 666, 'Konto', 24000,5,10);

INSERT INTO Konto (RegNr, ktonr, tekst,saldo, renteindlån,renteudlån)
VALUES (420, 555, 'Konto', 10000,5,10);

INSERT INTO KundeKonto (ID,ktonr, CprNr)
VALUES (1, 666, 4);

select * from Kunde 
WHERE postNr = 8200;

select * from KundeKonto
select * from Konto
select * from Medarbejder
select * from Afdeling
select * from Bank
select * from Kunde


select Konto.ktonr, Konto.saldo
from Konto
where Konto.ktonr = '666' and Konto.ktonr = Konto.ktonr

UPDATE Konto
set saldo = saldo - 20
where Konto.ktonr = '666' and Konto.ktonr = Konto.ktonr

UPDATE Konto
set saldo = saldo + 20
where Konto.ktonr = '555' and Konto.ktonr = Konto.ktonr

