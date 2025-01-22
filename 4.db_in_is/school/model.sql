
CREATE TABLE `Prokhorin_Students`
 (
	`LastName`			varchar (255) PRIMARY KEY,
	`BirthDate`			datetime,
	`Height`			double,
	`Class`				int
);

ALTER TABLE `Prokhorin_Students` ADD CONSTRAINT `Prokhorin_Students_Class_fk` FOREIGN KEY (`Class`) REFERENCES `Prokhorin_Classes`(`Class`) ON DELETE CASCADE;