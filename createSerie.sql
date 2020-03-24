drop table SkuespillerIEpsiode
drop table Seson
drop table Episode
drop table Serie
drop table Skuespiller
drop VIEW SkuespillerISæsonISerie
drop VIEW LængdenAfAlleSeson


create table Skuespiller(
navn varchar(40) primary key,
fodelselsAar char(4)
)

create table Serie(
titel varchar(30) primary key,
produktionsselskab varchar(30)
)

create table Seson(
id int primary key identity (1,1),
premiere date,
finale date,
sesonnummer int,
titelSerie varchar(30) foreign key references Serie(titel)
)

create table Episode(
nummer int primary key,
titel varchar(50),
laengde int,
sesonId int foreign key references Seson(id)
)

create table SkuespillerIEpsiode(
epsiodeNummer int foreign key references Episode(nummer),
navnSkuespiller varchar(40) foreign key references Skuespiller(navn)
)


--OPGAVE 3
SELECT DISTINCT Skuespiller.navn
FROM Skuespiller, Serie, SkuespillerIEpsiode, Episode, Seson
WHERE Skuespiller.navn = SkuespillerIEpsiode.navnSkuespiller 
AND SkuespillerIEpsiode.epsiodeNummer = Episode.nummer
AND Episode.sesonId = Seson.id
AND Seson.titelSerie = Serie.titel
AND Serie.titel = 'Venner';


--OPGAVE 4
SELECT COUNT(DISTINCT Skuespiller.navn) AS Antal, Serie.titel AS Serietitel 
FROM Skuespiller, Serie, SkuespillerIEpsiode, Episode, Seson
WHERE Skuespiller.navn = SkuespillerIEpsiode.navnSkuespiller 
AND SkuespillerIEpsiode.epsiodeNummer = Episode.nummer
AND Episode.sesonId = Seson.id
AND Seson.titelSerie = Serie.titel
GROUP BY Serie.titel;


--OPGAVE 5
CREATE VIEW SkuespillerISæsonISerie AS
SELECT DISTINCT Skuespiller.navn, Serie.titel, Seson.sesonnummer
FROM Skuespiller, Serie, SkuespillerIEpsiode, Episode, Seson
WHERE Skuespiller.navn = SkuespillerIEpsiode.navnSkuespiller 
AND SkuespillerIEpsiode.epsiodeNummer = Episode.nummer
AND Episode.sesonId = Seson.id
AND Seson.titelSerie = Serie.titel
AND Serie.titel = 'Scrubs'
AND Seson.sesonnummer = 1;

--OPGAVE 6
DROP PROCEDURE SkuespillerISerie
CREATE PROCEDURE SkuespillerISerie @SæsonNr INT, @SerieTitel varchar(30) AS
BEGIN
SELECT DISTINCT Skuespiller.navn, Serie.titel, Seson.sesonnummer
FROM Skuespiller, Serie, SkuespillerIEpsiode, Episode, Seson
WHERE Skuespiller.navn = SkuespillerIEpsiode.navnSkuespiller 
AND SkuespillerIEpsiode.epsiodeNummer = Episode.nummer
AND Episode.sesonId = Seson.id
AND Seson.titelSerie = Serie.titel
AND Seson.sesonnummer = @SæsonNr
AND Serie.titel = @SerieTitel
END;

EXECUTE SkuespillerISerie 1, 'Scrubs';


--OPGAVE 7
SELECT SUM(Episode.laengde) AS 'Sæson længde', Serie.titel
FROM Episode, Serie, Seson
WHERE Episode.sesonId = Seson.id
AND Seson.titelSerie = Serie.titel
GROUP BY Serie.titel;


--OPGAVE 8
SELECT SUM(Episode.laengde) AS 'Sæson længde', Seson.titelSerie, Seson.sesonnummer
FROM Episode, Seson
WHERE Episode.sesonId = Seson.id
AND Seson.titelSerie = 'Venner'
GROUP BY Seson.sesonnummer, Seson.titelSerie;


--OPGAVE 9
CREATE VIEW LængdenAfAlleSeson AS
SELECT SUM(Episode.laengde) AS 'Sæson længde', Seson.sesonnummer, Serie.titel
FROM Episode, Seson, Serie
WHERE Episode.sesonId = Seson.id
AND Seson.titelSerie = Serie.titel
GROUP BY Seson.sesonnummer, Serie.titel;


--OPGAVE 10
DROP PROCEDURE SamletLængdeAfSæson
CREATE PROCEDURE SamletLængdeAfSæson @SesonNr INT, @SerieTitel varchar(30) AS
BEGIN
SELECT DISTINCT Serie.titel, Seson.sesonnummer, SUM(Episode.laengde) AS 'Sæson længde'
FROM Serie, Episode, Seson
WHERE Episode.sesonId = Seson.id
AND Seson.titelSerie = Serie.titel
AND Serie.titel = @SerieTitel AND Seson.sesonnummer = @SesonNr
GROUP BY Serie.titel, Seson.sesonnummer
END;

EXECUTE SamletLængdeAfSæson 1, 'Scrubs';