DROP TABLE Ordre; 
DROP TABLE Kunde; 
DROP TABLE Medarbejder; 
DROP TABLE Vare; 
DROP TABLE PostDistrikt;

CREATE TABLE PostDistrikt (
	POSTNR INT NOT NULL,
	BYNAVN CHAR(20) NOT NULL,
	PRIMARY KEY (PostNr));

CREATE TABLE Vare (
	VareNr INT NOT NULL,
	Emne CHAR(20) NOT NULL,
	StkPris DECIMAL (9,2),
	LagerAntal INT,
	PRIMARY KEY (VareNr));

	CREATE TABLE Kunde ( 
	KundeId CHAR(10) NOT NULL, 
	Navn CHAR(30) NOT NULL, 
	Adresse CHAR(30) NOT NULL, 
	PostNr INT NOT NULL, 
	UNIQUE (Navn, Adresse), 
	CONSTRAINT KundeKey PRIMARY KEY (KundeId), 
	FOREIGN KEY (PostNr) REFERENCES PostDistrikt );

CREATE TABLE Medarbejder ( MedarbId CHAR(10) NOT NULL, Navn CHAR(30) NOT NULL, Adresse CHAR(30) NOT NULL, PostNr INT NOT NULL, UNIQUE (Navn, Adresse), PRIMARY KEY (MedarbId), FOREIGN KEY (PostNr) REFERENCES PostDistrikt );

CREATE TABLE Ordre ( KundeId CHAR(10) NOT NULL, VareNr INT NOT NULL, OrdreDato CHAR(10) NOT NULL, Antal INT, PRIMARY KEY (KundeId, VareNr, OrdreDato), FOREIGN KEY (KundeId) REFERENCES Kunde, FOREIGN KEY (VareNr) REFERENCES Vare );

INSERT INTO PostDistrikt (POSTNR, BYNAVN)
VALUES (8230, 'Åbyhøj');

INSERT INTO KUNDE (KundeId, Navn, Adresse, PostNr)
VALUES ('1', 'Hans Hansen', 'Hans Hansens vej 54', 8230);

INSERT INTO KUNDE (KundeId, Navn, Adresse, PostNr)
VALUES ('2', 'Ole Hansen', 'Hans Hansens vej 54', 8230);

INSERT INTO KUNDE (KundeId, Navn, Adresse, PostNr)
VALUES ('3', 'Hans Hansen', 'Heste Hansens vej 54', 8230);

INSERT INTO KUNDE (KundeId, Navn, Adresse, PostNr)
VALUES ('4', 'Hans Petersen', 'Hans Hansens vej 54', 8230);

UPDATE PostDistrikt
	SET BYNAVN = 'Viby J'
	WHERE POSTNR = 8260;

SELECT * FROM PostDistrikt

SELECT * FROM Kunde

SELECT * FROM Vare