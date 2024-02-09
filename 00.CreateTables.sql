CREATE TABLE ANAGRAFICA (
  idAnagrafica int primary key identity not null,
  Nome nvarchar(50) not null,
  Cognome nvarchar(50) not null,
  Indirizzo nvarchar(200) not null,
  Citta nvarchar(50) not null,
  CAP varchar(5) not null,
  CF nvarchar(16) unique not null
);

CREATE TABLE VERBALE (
  idVerbale int primary key identity not null,
  idAnagrafica int not null,
  idViolazione int not null,
  DataViolazione date not null,
  IndirizzoViolazione nvarchar(200) not null,
  NominativoAgente nvarchar(100) not null,
  DataTrascrizioneVerbale date not null,
  Importo money default 0.00,
  PuntiDecurtati smallint not null,
);

CREATE TABLE VIOLAZIONE (
  IdViolazione int primary key identity not null,
  Descrizione nvarchar(100) not null
);


-- COLLEGAMENTI dal DIAGRAMMA tra 
---> VERBALE a Anagrafica + Verbale
