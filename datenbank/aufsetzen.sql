drop table if exists Module, ModulHierarchie, Lehrplan, SelbstlernRessource, Zuordnung;
drop type if exists bundesland, schulart;

create table Module
( Modul varchar(500) primary key
);

create type bundesland as enum
  ( 'Baden-Württemberg'
  , 'Bayern'
  , 'Berlin'
  , 'Brandenburg'
  , 'Bremen'
  , 'Hamburg'
  , 'Hessen'
  , 'Mecklenburg-Vorpommern'
  , 'Niedersachsen'
  , 'Nordrhein-Westfalen'
  , 'Rheinland-Pfalz'
  , 'Saarland'
  , 'Sachsen'
  , 'Sachsen-Anhalt'
  , 'Schleswig-Holstein'
  , 'Thüringen');

create type schulart as enum
  ( 'Grundschule'
  , 'Gemeinschaftsschule'
  , 'Realschule'
  , 'Gymnasium'
  );

create table Lehrplan
( Bundesland bundesland
, Schulart schulart
, Fach varchar(100)
, Klassenstufe smallint
, Modul varchar(500) references Module(Modul)
, LehrplanTitel varchar(500)
, LehrplanBeschreibung text
, LehrplanLehrziel text
, LehrplanQuelle varchar(500)
, EintragsDatum date
, primary key
  ( Bundesland
  , Schulart
  , Fach
  , Klassenstufe
  , Modul
  )
);

create table SelbstlernRessource
( Link varchar(500) primary key
, Beschreibung text default ''
, Upvotes int default 0
, Downvotes int default 0
);

create table Zuordnung
( Modul varchar(500) references Module(Modul)
, Link varchar(500) references SelbstlernRessource(Link)
, primary key
  ( Modul
  , Link
  )
);

create table ModulHierarchie
( Untermodul varchar(500) references Module(Modul)
, Übermodul varchar(500) references Module(Modul)
);