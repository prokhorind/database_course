-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

-- This file uses UTF-8 encoding

CREATE TABLE `Classes`
 (
	`Class`			double NOT NULL PRIMARY KEY,
	`Students`		double,
	`Class Teacher`	varchar (255),
	`Sports`		double
);

-- CREATE INDEXES ...
ALTER TABLE `Classes` ADD INDEX `Students` (`Students`);

CREATE TABLE `Students`
 (
	`LastName`			varchar (255) PRIMARY KEY,
	`Address`			varchar (255),
	`BirthDate`			datetime,
	`Height`			double,
	`Favorite Subject`	varchar (255),
	`Informatics`		double,
	`History`			double,
	`Class`				double
);

-- CREATE INDEXES ...
ALTER TABLE `Students` ADD INDEX `Address` (`Address`);

-- CREATE Relationships ...

ALTER TABLE `Students` ADD CONSTRAINT `Students_Class_fk` FOREIGN KEY (`Class`) REFERENCES `Classes`(`Class`) ON DELETE CASCADE;
