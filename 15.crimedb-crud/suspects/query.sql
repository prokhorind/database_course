-- 1. Створення таблиці Suspects
CREATE TABLE Suspects (
    suspect_id SERIAL PRIMARY KEY,  -- Унікальний ідентифікатор підозрюваного
    name VARCHAR(100),              -- Ім'я підозрюваного (до 100 символів)
    date_of_birth DATE              -- Дата народження
);

-- 2. Додавання нового підозрюваного з вказаним ID
INSERT INTO Suspects (suspect_id, name, date_of_birth)
VALUES (1, 'Jane Doe', '1990-05-15')
RETURNING suspect_id;  -- Повертає ID нового підозрюваного

-- 3. Перегляд усіх підозрюваних
SELECT * FROM Suspects;

-- 4. Пошук підозрюваного за ім’ям (нечутливий до регістру)
SELECT * FROM Suspects
WHERE name ILIKE '%jane%';

-- 5. Оновлення даних підозрюваного
UPDATE Suspects
SET name = 'Jane Smith', date_of_birth = '1991-07-20'
WHERE suspect_id = 1;

-- 6. Видалення підозрюваного
DELETE FROM Suspects WHERE suspect_id = 1;
