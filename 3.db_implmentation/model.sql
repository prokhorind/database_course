-- Create the Cities table
CREATE TABLE Cities (
    CityID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(100)
);

-- Create the Superheroes table
CREATE TABLE Superheroes (
    SuperheroID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    RealName VARCHAR(100),
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES Cities(CityID) ON DELETE SET NULL
);

-- Create the Villains table
CREATE TABLE Villains (
    VillainID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    RealName VARCHAR(100),
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES Cities(CityID) ON DELETE SET NULL
);

-- Create a table to establish relationships between Superheroes and Villains
CREATE TABLE SuperheroVillainRelations (
    RelationID INT AUTO_INCREMENT PRIMARY KEY,
    SuperheroID INT,
    VillainID INT,
    FOREIGN KEY (SuperheroID) REFERENCES Superheroes(SuperheroID) ON DELETE CASCADE,
    FOREIGN KEY (VillainID) REFERENCES Villains(VillainID) ON DELETE CASCADE
);

-- Optionally, you can create indexes for faster queries
CREATE INDEX idx_superheroes_city ON Superheroes(CityID);
CREATE INDEX idx_villains_city ON Villains(CityID);