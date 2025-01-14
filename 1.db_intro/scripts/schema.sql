-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

-- That file uses encoding UTF-8

CREATE TABLE `КЛАСИ`
 (
	`Клас`			double NOT NULL PRIMARY KEY,
	`Учнів`			double,
	`Класний керівник`			varchar (255),
	`Займаються спортом`			double
);

-- CREATE INDEXES ...
ALTER TABLE `КЛАСИ` ADD INDEX `Учнів` (`Учнів`);

CREATE TABLE `УЧНІ`
 (
	`Прізвище`			varchar (255) PRIMARY KEY,
	`Адреса`			varchar (255),
	`Дата народження`			datetime,
	`Зріст`			double,
	`Улюблений предмет`			varchar (255),
	`Інформатика`			double,
	`Історія`			double,
	`Клас`			double
);

-- CREATE INDEXES ...
ALTER TABLE `УЧНІ` ADD INDEX `Адреса` (`Адреса`);


-- CREATE Relationships ...

ALTER TABLE `УЧНІ` ADD CONSTRAINT `УЧНІ_Клас_fk` FOREIGN KEY (`Клас`) REFERENCES `КЛАСИ`(`Клас`) ON DELETE CASCADE;






