-- 1. List all Crimes and their Types
SELECT Crimes.crime_id, Crimes.description, CrimeTypes.crime_type
FROM Crimes
JOIN Crime_CrimeTypes ON Crimes.crime_id = Crime_CrimeTypes.crime_id
JOIN CrimeTypes ON Crime_CrimeTypes.crime_type_id = CrimeTypes.crime_type_id;

-- 2. Find all Officers involved in Investigations
SELECT DISTINCT Officers.name, Officers.badge_number
FROM Officers
JOIN InvestigationResults ON Officers.officer_id = InvestigationResults.officer_id;

-- 3. List all Suspects and their Date of Birth
SELECT name, date_of_birth
FROM Suspects;

-- 4. List all Crimes with their Investigation Results
SELECT Crimes.description, InvestigationResults.description AS result, InvestigationResults.date_of_result
FROM Crimes
JOIN InvestigationResults ON Crimes.crime_id = InvestigationResults.crime_id;

-- 5. Find all Crimes with multiple Crime Types
SELECT Crimes.crime_id, Crimes.description, COUNT(Crime_CrimeTypes.crime_type_id) AS crime_type_count
FROM Crimes
JOIN Crime_CrimeTypes ON Crimes.crime_id = Crime_CrimeTypes.crime_id
GROUP BY Crimes.crime_id
HAVING COUNT(Crime_CrimeTypes.crime_type_id) > 1;

-- 6. List all Guilty Parties with their Crimes and Last Words
SELECT Crimes.description, Suspects.name AS guilty_party, GuiltyParties.last_words
FROM Crimes
JOIN GuiltyParties ON Crimes.crime_id = GuiltyParties.crime_id
JOIN Suspects ON GuiltyParties.suspect_id = Suspects.suspect_id;

-- 7. Find the Number of Crimes each Officer has Handled
SELECT Officers.name, COUNT(InvestigationResults.crime_id) AS crime_count
FROM Officers
JOIN InvestigationResults ON Officers.officer_id = InvestigationResults.officer_id
GROUP BY Officers.name;

-- 8. List all Investigation Results for a Specific Crime
SELECT InvestigationResults.description, InvestigationResults.date_of_result
FROM InvestigationResults
WHERE crime_id = 1;  -- Change 1 to the specific crime_id you want to analyze

-- 9. Find all Crimes Committed by a Specific Suspect
SELECT Crimes.description, Crimes.date_of_crime
FROM Crimes
JOIN GuiltyParties ON Crimes.crime_id = GuiltyParties.crime_id
JOIN Suspects ON GuiltyParties.suspect_id = Suspects.suspect_id
WHERE Suspects.name = 'Mark Wilson';  -- Change 'Mark Wilson' to the specific suspect name

-- 10. List all Crime Types and the Number of Crimes for Each Type
SELECT CrimeTypes.crime_type, COUNT(Crime_CrimeTypes.crime_id) AS crime_count
FROM CrimeTypes
JOIN Crime_CrimeTypes ON CrimeTypes.crime_type_id = Crime_CrimeTypes.crime_type_id
GROUP BY CrimeTypes.crime_type;

-- 11. Find Details of a Specific Crime
SELECT Crimes.crime_id, Crimes.description, Crimes.date_of_crime, Officers.name AS officer_name, Officers.badge_number
FROM Crimes
JOIN InvestigationResults ON Crimes.crime_id = InvestigationResults.crime_id
JOIN Officers ON InvestigationResults.officer_id = Officers.officer_id
WHERE Crimes.crime_id = 1;  -- Change 1 to the specific crime_id you want to analyze

-- 12. List All Suspects Involved in a Specific Crime
SELECT Suspects.name, Suspects.date_of_birth
FROM Suspects
JOIN GuiltyParties ON Suspects.suspect_id = GuiltyParties.suspect_id
WHERE GuiltyParties.crime_id = 1;  -- Change 1 to the specific crime_id you want to analyze

-- 13. Find Investigation Results for a Specific Crime
SELECT InvestigationResults.description, InvestigationResults.date_of_result, Officers.name AS officer_name
FROM InvestigationResults
JOIN Officers ON InvestigationResults.officer_id = Officers.officer_id
WHERE InvestigationResults.crime_id = 1;  -- Change 1 to the specific crime_id you want to analyze

-- 14. List Crime Types Associated with a Specific Crime
SELECT CrimeTypes.crime_type
FROM CrimeTypes
JOIN Crime_CrimeTypes ON CrimeTypes.crime_type_id = Crime_CrimeTypes.crime_type_id
WHERE Crime_CrimeTypes.crime_id = 1;  -- Change 1 to the specific crime_id you want to analyze

-- 15. Find Last Words of Guilty Parties for a Specific Crime
SELECT Suspects.name AS guilty_party, GuiltyParties.last_words
FROM GuiltyParties
JOIN Suspects ON GuiltyParties.suspect_id = Suspects.suspect_id
WHERE GuiltyParties.crime_id = 1;  -- Change 1 to the specific crime_id you want to analyze
