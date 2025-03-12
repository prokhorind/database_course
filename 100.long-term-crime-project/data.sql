-- Insert into CrimeTypes
INSERT INTO CrimeTypes (crime_type_id,crime_type) VALUES
(1,'Robbery');

-- Insert into Crimes
INSERT INTO Crimes (crime_id,description, date_of_crime) VALUES
(1, 'Bank heist', '2025-01-25');

-- Insert into Officers
INSERT INTO Officers (officer_id, name, badge_number) VALUES
(1, 'John Doe', '12345');

-- Insert into Suspects
INSERT INTO Suspects (suspect_id, name, date_of_birth) VALUES
(1, 'Mark Wilson', '1999-07-30');

-- Insert into InvestigationResults
INSERT INTO InvestigationResults (crime_id, description, date_of_result, officer_id) VALUES
(1, 'Suspect arrested', '2025-02-10', 1),
(1, 'Suspect convicted', '2025-02-20', 1),
(1, 'Investigation closed', '2025-03-01', 1),
(1, 'Sentenced to prison', '2025-03-10', 1),
(1, 'Plea bargain', '2025-03-15', 1);

-- Insert into Crime_CrimeTypes
INSERT INTO Crime_CrimeTypes (crime_id, crime_type_id) VALUES
(1, 1);


-- Insert into GuiltyParties
INSERT INTO GuiltyParties (crime_id, suspect_id, last_words) VALUES
(1, 1, 'I am guilty');



-- Insert into CrimeTypes
INSERT INTO CrimeTypes (crime_type_id,crime_type) VALUES
(2, 'Theft');

-- Insert into Crimes
INSERT INTO Crimes (crime_id,description, date_of_crime) VALUES
(2, 'Car theft', '2025-02-10');

-- Insert into Officers
INSERT INTO Officers (officer_id, name, badge_number) VALUES
(2, 'Emily White', '67890');

-- Insert into Suspects
INSERT INTO Suspects (suspect_id, name, date_of_birth) VALUES
(2, 'Daniel Miller', '1997-04-04');

-- Insert into InvestigationResults
INSERT INTO InvestigationResults (crime_id, description, date_of_result, officer_id) VALUES
(2, 'Suspect arrested', '2025-02-18', 2),
(2, 'Suspect convicted', '2025-02-25', 2),
(2, 'Investigation closed', '2025-03-05', 2),
(2, 'Sentenced to prison', '2025-03-12', 2),
(2, 'Plea bargain', '2025-03-20', 2);

-- Insert into Crime_CrimeTypes
INSERT INTO Crime_CrimeTypes (crime_id, crime_type_id) VALUES
(2, 2);

-- Insert into GuiltyParties
INSERT INTO GuiltyParties (crime_id, suspect_id, last_words) VALUES
(2, 2, 'I will return it');