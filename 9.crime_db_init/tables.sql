-- CrimeTypes Table
CREATE TABLE CrimeTypes (
    crime_type_id SERIAL PRIMARY KEY,
    crime_type VARCHAR(50)
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