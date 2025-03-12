-- Insert into CrimeTypes
INSERT INTO CrimeTypes (crime_type_id, crime_type) VALUES
(3, 'Burglary'),
(4, 'Fraud'),
(5, 'Arson'),
(6, 'Vandalism');

-- Insert into Crimes
INSERT INTO Crimes (crime_id, description, date_of_crime) VALUES
(3, 'Home burglary with fraudulent documents', '2025-03-01'),
(4, 'Physical assault during a fight', '2025-03-12'),
(5, 'Setting fire to a warehouse and causing property damage', '2025-03-18');

-- Insert into Crime_CrimeTypes
INSERT INTO Crime_CrimeTypes (crime_id, crime_type_id) VALUES
(3, 3), (3, 4),  -- Home burglary (Burglary, Fraud)
(4, 5),  -- Physical assault (Assault)
(5, 5), (5, 6);  -- Arson & Vandalism


-- Insert into Suspects
INSERT INTO Suspects (suspect_id, name, date_of_birth) VALUES
(3, 'Alice Johnson', '1998-11-15'),
(4, 'Bob Smith', '2000-02-22');

-- Insert into InvestigationResults
INSERT INTO InvestigationResults (investigation_id, crime_id, description, date_of_result, officer_id) VALUES
-- Bank heist (Crime 1)

-- Home burglary (Crime 3)
(11, 3, 'Suspect arrested', '2025-03-05', 1),
(12, 3, 'Suspect convicted', '2025-03-12', 1),
(13, 3, 'Investigation closed', '2025-03-20', 1),
(14, 3, 'Sentenced to prison', '2025-03-25', 1),
(15, 3, 'Plea bargain', '2025-03-28', 1),

-- Physical assault (Crime 4)
(16, 4, 'Suspect arrested', '2025-03-15', 2),
(17, 4, 'Suspect convicted', '2025-03-22', 2),
(18, 4, 'Investigation closed', '2025-03-30', 2),
(19, 4, 'Sentenced to prison', '2025-04-05', 2),
(20, 4, 'Plea bargain', '2025-04-10', 2),

-- Arson & Vandalism (Crime 5)
(21, 5, 'Suspects arrested', '2025-03-20', 1),
(22, 5, 'Suspect Alice Johnson convicted', '2025-03-25', 1),
(23, 5, 'Suspect Bob Smith acquitted', '2025-03-25', 1),
(24, 5, 'Investigation closed', '2025-03-30', 1),
(25, 5, 'Sentenced to prison', '2025-04-05', 1),
(26, 5, 'Plea bargain', '2025-04-10', 1);

-- Insert into GuiltyParties
INSERT INTO GuiltyParties (guilty_party_id, crime_id, suspect_id, last_words) VALUES
(6, 3, 1, 'I regret my actions'),  -- Home burglary (Mark Wilson)
(7, 5, 3, 'I am sorry for what I did');  -- Arson (Alice Johnson)
-- No entry for Bob Smith, as he was acquitted.