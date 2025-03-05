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

