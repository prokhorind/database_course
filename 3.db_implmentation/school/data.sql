-- Inserting data into the Classes table
INSERT INTO `Classes` (`Class`, `Students`, `Class Teacher`, `Sports`)
VALUES
(10, 30, 'Mr. Ivanov', 15),
(11, 25, 'Mrs. Petrova', 10),
(9, 28, 'Mr. Kovalenko', 20);

-- Inserting data into the Students table
INSERT INTO `Students` (`LastName`, `Address`, `BirthDate`, `Height`, `Favorite Subject`, `Informatics`, `History`, `Class`)
VALUES
('Shevchenko', 'Kyiv, Shevchenka Str. 10', '2006-03-12', 170, 'Math', 95, 80, 10),
('Kovtun', 'Kyiv, Khreshchatyk Str. 5', '2005-05-20', 160, 'Physics', 90, 85, 10),
('Ivanova', 'Odesa, Deribasivska Str. 12', '2006-07-25', 165, 'Literature', 88, 92, 11),
('Petrenko', 'Lviv, Hrushevskoho Str. 15', '2005-11-30', 175, 'Biology', 80, 75, 11),
('Melnyk', 'Kharkiv, Sumska Str. 8', '2006-02-10', 162, 'Chemistry', 85, 90, 9),
('Sydorenko', 'Dnipropetrovsk, Centralna Str. 3', '2005-09-14', 168, 'History', 82, 95, 9);
