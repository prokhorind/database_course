-- CrimeTypes Table
CREATE TABLE CrimeTypes (
    crime_type_id SERIAL PRIMARY KEY,
    crime_type VARCHAR(50)
);

-- Crimes Table
CREATE TABLE Crimes (
    crime_id SERIAL PRIMARY KEY,
    description TEXT,
    date_of_crime DATE
);

-- Officers Table
CREATE TABLE Officers (
    officer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    badge_number VARCHAR(50)
);

-- Suspects Table
CREATE TABLE Suspects (
    suspect_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE
);

-- InvestigationResults Table
CREATE TABLE InvestigationResults (
    investigation_id SERIAL PRIMARY KEY,
    crime_id INT,
    description TEXT,
    date_of_result DATE,
    officer_id INT,
    FOREIGN KEY (crime_id) REFERENCES Crimes (crime_id),
    FOREIGN KEY (officer_id) REFERENCES Officers (officer_id)
);

-- Crime_CrimeTypes Table (Many-to-Many relationship between Crimes and CrimeTypes)
CREATE TABLE Crime_CrimeTypes (
    crime_id INT,
    crime_type_id INT,
    PRIMARY KEY (crime_id, crime_type_id),
    FOREIGN KEY (crime_id) REFERENCES Crimes (crime_id),
    FOREIGN KEY (crime_type_id) REFERENCES CrimeTypes (crime_type_id)
);

-- GuiltyParties Table (Many-to-Many relationship between Crimes and Suspects)
CREATE TABLE GuiltyParties (
    guilty_party_id SERIAL PRIMARY KEY,
    crime_id INT,
    suspect_id INT,
    last_words TEXT,
    FOREIGN KEY (crime_id) REFERENCES Crimes (crime_id),
    FOREIGN KEY (suspect_id) REFERENCES Suspects (suspect_id)
);
