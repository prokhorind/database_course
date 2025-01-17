SELECT * FROM Cities;

SELECT Name FROM Superheroes;

SELECT Name, RealName FROM Superheroes;


SELECT Villains.Name
FROM Villains
INNER JOIN Cities ON Villains.CityID = Cities.CityID
WHERE Cities.Name = 'Metropolis';


SELECT Cities.Name, COUNT(Superheroes.SuperheroID) AS HeroCount
FROM Cities
LEFT JOIN Superheroes ON Cities.CityID = Superheroes.CityID
GROUP BY Cities.Name;


SELECT
    sh.Name AS SuperheroName,
    v.Name AS VillainName
FROM
    SuperheroVillainRelations svr
JOIN
    Superheroes sh ON svr.SuperheroID = sh.SuperheroID
JOIN
    Villains v ON svr.VillainID = v.VillainID;




SELECT 'Superhero' AS Type, Superheroes.Name AS Name
FROM Superheroes
INNER JOIN Cities ON Superheroes.CityID = Cities.CityID
WHERE Cities.Name = 'Gotham'

UNION

SELECT 'Villain' AS Type, Villains.Name AS Name
FROM Villains
INNER JOIN Cities ON Villains.CityID = Cities.CityID
WHERE Cities.Name = 'Gotham';
