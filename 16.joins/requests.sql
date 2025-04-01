--1. Знайти всі злочини разом із типами (INNER JOIN)
SELECT c.crime_id, c.description, ct.crime_type
FROM Crimes c
JOIN Crime_CrimeTypes cct ON c.crime_id = cct.crime_id
JOIN CrimeTypes ct ON cct.crime_type_id = ct.crime_type_id;


-- 2. Показати всі розслідування та офіцерів, які їх вели (LEFT JOIN)
SELECT ir.investigation_id, c.description AS crime, o.name AS officer, ir.date_of_result
FROM InvestigationResults ir
LEFT JOIN Crimes c ON ir.crime_id = c.crime_id
LEFT JOIN Officers o ON ir.officer_id = o.officer_id;

--3. Підрахунок кількості злочинів за кожним типом (JOIN + GROUP BY)
SELECT ct.crime_type, COUNT(cct.crime_id) AS crime_count
FROM CrimeTypes ct
LEFT JOIN Crime_CrimeTypes cct ON ct.crime_type_id = cct.crime_type_id
GROUP BY ct.crime_type;