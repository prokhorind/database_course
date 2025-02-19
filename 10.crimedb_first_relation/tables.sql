
-- Crimes Table
CREATE TABLE Crimes (
    crime_id SERIAL PRIMARY KEY,
    description TEXT,
    date_of_crime DATE
);


-- Crime_CrimeTypes Table (Many-to-Many relationship between Crimes and CrimeTypes)
CREATE TABLE Crime_CrimeTypes (
    crime_id INT,
    crime_type_id INT,
    PRIMARY KEY (crime_id, crime_type_id),
    FOREIGN KEY (crime_id) REFERENCES Crimes (crime_id),
    FOREIGN KEY (crime_type_id) REFERENCES CrimeTypes (crime_type_id)
);
