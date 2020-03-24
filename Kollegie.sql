Drop table Bolig;
Drop table lejer;
drop table kollegie;

Create table Kollegie (
navn varchar (50) not null,
adresse varchar (50) primary key
);

Create table Lejer (
navn varchar (50) not null,
adresse varchar (50) not null,
uddannelse varchar (50)  not null,
lejerCPR varchar (50) primary key
);


Create table Bolig (
kvm real not null,
adresse varchar (50) primary key,
prisPrMåned real not null,
kollegieadresse varchar (50) not null,
lejerCPR varchar (50) not null,
Boligtype varchar (50) not null, 
constraint TYPE_bolig Check (Boligtype = 'Dobbeltværelse' OR Boligtype = 'Værelse' OR Boligtype = 'Lejlighed'),
egetbad bit,
tekøkken bit,
antalværelser int,
dyrTilladt bit,
foreign key (kollegieadresse) references Kollegie,
foreign key (lejerCPR) references Lejer
);

