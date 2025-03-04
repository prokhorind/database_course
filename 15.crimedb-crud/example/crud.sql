-- 1. Create the Officers table
CREATE TABLE Officers (
    officer_id SERIAL PRIMARY KEY,  -- Unique identifier for each officer
    name VARCHAR(100),              -- Officer's name (up to 100 characters)
    badge_number VARCHAR(50)        -- Badge number (up to 50 characters)
);

-- 2. Insert a new officer with a specific ID
INSERT INTO Officers (officer_id, name, badge_number)
VALUES (1, 'John Doe', '12345')
RETURNING officer_id;  -- Returns the new officer's ID

-- 3. Read (view) all officers
SELECT * FROM Officers;

-- 4. Search for an officer by name or badge number (case-insensitive)
SELECT * FROM Officers
WHERE name ILIKE '%john%' OR badge_number ILIKE '%123%';

-- 5. Update an officer's details
UPDATE Officers
SET name = 'John Smith', badge_number = '67890'
WHERE officer_id = 1;

-- 6. Delete an officer
DELETE FROM Officers WHERE officer_id = 1;
