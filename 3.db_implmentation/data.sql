-- Insert data into Cities table
INSERT INTO Cities (Name, Country) VALUES ('Gotham', 'USA');
INSERT INTO Cities (Name, Country) VALUES ('Metropolis', 'USA');
INSERT INTO Cities (Name, Country) VALUES ('Central City', 'USA');
INSERT INTO Cities (Name, Country) VALUES ('Star City', 'USA');
INSERT INTO Cities (Name, Country) VALUES ('New York', 'USA');

-- Insert data into Superheroes table
INSERT INTO Superheroes (Name, RealName, CityID) VALUES ('Batman', 'Bruce Wayne', 1);
INSERT INTO Superheroes (Name, RealName, CityID) VALUES ('Superman', 'Clark Kent', 2);
INSERT INTO Superheroes (Name, RealName, CityID) VALUES ('Flash', 'Barry Allen', 3);
INSERT INTO Superheroes (Name, RealName, CityID) VALUES ('Green Arrow', 'Oliver Queen', 4);
INSERT INTO Superheroes (Name, RealName, CityID) VALUES ('Wonder Woman', 'Diana Prince', 2);
INSERT INTO Superheroes (Name, RealName, CityID) VALUES ('Spider-Man', 'Peter Parker', 5);
INSERT INTO Superheroes (Name, RealName, CityID) VALUES ('Iron Man', 'Tony Stark', 5);
INSERT INTO Superheroes (Name, RealName, CityID) VALUES ('Hulk', 'Bruce Banner', 5);
INSERT INTO Superheroes (Name, RealName, CityID) VALUES ('Aquaman', 'Arthur Curry', 4);
INSERT INTO Superheroes (Name, RealName, CityID) VALUES ('Cyborg', 'Victor Stone', 2);

-- Insert data into Villains table
INSERT INTO Villains (Name, RealName, CityID) VALUES ('Joker', 'Unknown', 1);
INSERT INTO Villains (Name, RealName, CityID) VALUES ('Lex Luthor', 'Alexander Luthor', 2);
INSERT INTO Villains (Name, RealName, CityID) VALUES ('Reverse-Flash', 'Eobard Thawne', 3);
INSERT INTO Villains (Name, RealName, CityID) VALUES ('Deathstroke', 'Slade Wilson', 4);
INSERT INTO Villains (Name, RealName, CityID) VALUES ('Green Goblin', 'Norman Osborn', 5);
INSERT INTO Villains (Name, RealName, CityID) VALUES ('Doctor Octopus', 'Otto Octavius', 5);
INSERT INTO Villains (Name, RealName, CityID) VALUES ('Thanos', 'Unknown', NULL);
INSERT INTO Villains (Name, RealName, CityID) VALUES ('Loki', 'Loki Laufeyson', NULL);
INSERT INTO Villains (Name, RealName, CityID) VALUES ('Ultron', 'Unknown', NULL);
INSERT INTO Villains (Name, RealName, CityID) VALUES ('Black Manta', 'David Hyde', 4);

-- Insert data into SuperheroVillainRelations table
INSERT INTO SuperheroVillainRelations (SuperheroID, VillainID) VALUES (1, 1); -- Batman vs Joker
INSERT INTO SuperheroVillainRelations (SuperheroID, VillainID) VALUES (2, 2); -- Superman vs Lex Luthor
INSERT INTO SuperheroVillainRelations (SuperheroID, VillainID) VALUES (3, 3); -- Flash vs Reverse-Flash
INSERT INTO SuperheroVillainRelations (SuperheroID, VillainID) VALUES (4, 4); -- Green Arrow vs Deathstroke
INSERT INTO SuperheroVillainRelations (SuperheroID, VillainID) VALUES (6, 5); -- Spider-Man vs Green Goblin
INSERT INTO SuperheroVillainRelations (SuperheroID, VillainID) VALUES (6, 6); -- Spider-Man vs Doctor Octopus
INSERT INTO SuperheroVillainRelations (SuperheroID, VillainID) VALUES (7, 8); -- Iron Man vs Loki
INSERT INTO SuperheroVillainRelations (SuperheroID, VillainID) VALUES (8, 9); -- Hulk vs Ultron
INSERT INTO SuperheroVillainRelations (SuperheroID, VillainID) VALUES (9, 10); -- Aquaman vs Black Manta
INSERT INTO SuperheroVillainRelations (SuperheroID, VillainID) VALUES (10, 2); -- Cyborg vs Lex Luthor
