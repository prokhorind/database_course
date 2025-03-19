-- 1. Get the names of all officers
SELECT name FROM Officers;

-- 2. Find suspects and their birthdates
SELECT name, date_of_birth FROM Suspects;

-- 3. Count the total number of crimes
SELECT COUNT(*) AS total_crimes FROM Crimes;

-- 4. Get the total number of officers
SELECT COUNT(*) AS total_officers FROM Officers;

-- 5. Get the total number of investigations conducted
SELECT COUNT(*) AS total_investigations FROM InvestigationResults;

-- 6. Find all crimes that have investigation results
SELECT DISTINCT c.description
FROM Crimes c
JOIN InvestigationResults ir ON c.crime_id = ir.crime_id;

-- 7. Find all crimes with no investigation results
SELECT c.description
FROM Crimes c
LEFT JOIN InvestigationResults ir ON c.crime_id = ir.crime_id
WHERE ir.investigation_id IS NULL;

-- 8. Find the latest crime recorded
SELECT description, date_of_crime
FROM Crimes
ORDER BY date_of_crime DESC
LIMIT 1;

-- 9. Find the earliest recorded crime
SELECT description, date_of_crime
FROM Crimes
ORDER BY date_of_crime ASC
LIMIT 1;

-- 10. Count the number of crimes per year
SELECT EXTRACT(YEAR FROM date_of_crime) AS year, COUNT(*) AS num_crimes
FROM Crimes
GROUP BY year
ORDER BY year DESC;

-- 11. Count the number of investigations per crime
SELECT crime_id, COUNT(*) AS num_investigations
FROM InvestigationResults
GROUP BY crime_id;

-- 12. Find the officers who have conducted investigations
SELECT DISTINCT o.name
FROM Officers o
JOIN InvestigationResults ir ON o.officer_id = ir.officer_id;

-- 13. Get a list of all guilty suspects
SELECT s.name
FROM Suspects s
JOIN GuiltyParties gp ON s.suspect_id = gp.suspect_id;

-- 14. Find the number of suspects involved in crimes
SELECT COUNT(DISTINCT suspect_id) AS total_suspects FROM GuiltyParties;

-- 15. Find the crimes where suspects pleaded guilty
SELECT c.description, gp.last_words
FROM Crimes c
JOIN GuiltyParties gp ON c.crime_id = gp.crime_id
WHERE gp.last_words ILIKE '%guilty%';

-- 16. Find the most common crime type
SELECT ct.crime_type, COUNT(*) AS count
FROM Crime_CrimeTypes cct
JOIN CrimeTypes ct ON cct.crime_type_id = ct.crime_type_id
GROUP BY ct.crime_type
ORDER BY count DESC
LIMIT 1;

-- 17. Find the most recent investigation result
SELECT description, date_of_result
FROM InvestigationResults
ORDER BY date_of_result DESC
LIMIT 1;

-- 18. Find the most common investigation result
SELECT description, COUNT(*) AS count
FROM InvestigationResults
GROUP BY description
ORDER BY count DESC
LIMIT 1;

-- 19. List all suspects with their associated crimes
SELECT s.name, c.description
FROM Suspects s
JOIN GuiltyParties gp ON s.suspect_id = gp.suspect_id
JOIN Crimes c ON gp.crime_id = c.crime_id;

-- 20. List all crimes with their types
SELECT c.description, ct.crime_type
FROM Crimes c
JOIN Crime_CrimeTypes cct ON c.crime_id = cct.crime_id
JOIN CrimeTypes ct ON cct.crime_type_id = ct.crime_type_id;
