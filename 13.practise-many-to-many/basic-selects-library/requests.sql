INSERT INTO library.readers (name)
VALUES ('Сергій Мельник');  -- нічого не взяв

INSERT INTO library.books (title)
VALUES ('Пригоди Тома Сойєра');  -- ніхто не взяв

-- 🔧 CRUD ЗАПИТИ

-- 1. CREATE: Додати нового читача
INSERT INTO library.readers (name)
VALUES ('Наталія Шевченко');

-- 2. READ: Переглянути всіх читачів
SELECT * FROM library.readers;

-- 3. UPDATE: Змінити ім’я читача з reader_id = 1
UPDATE library.readers
SET name = 'Іван Іванович Петренко'
WHERE reader_id = 1;

-- 4. DELETE: Видалити книгу з book_id = 4 (Мистецтво війни), попередньо видалимо видачу
DELETE FROM library.rentals
WHERE book_id = 3;

DELETE FROM library.books
WHERE book_id = 3;


-- 🔍 SELECT ЗАПИТИ

-- 5. Список усіх читачів та їхні книги
SELECT r.name, b.title, rt.rental_date
FROM library.rentals rt
JOIN library.readers r ON rt.reader_id = r.reader_id
JOIN library.books b ON rt.book_id = b.book_id;

-- 6. Хто взяв книгу "1984"
SELECT r.name
FROM library.rentals rt
JOIN library.readers r ON rt.reader_id = r.reader_id
JOIN library.books b ON rt.book_id = b.book_id
WHERE b.title = '1984';

-- 7. Усі книги, які були видані після 3 лютого 2024
SELECT b.title, rt.rental_date
FROM library.rentals rt
JOIN library.books b ON rt.book_id = b.book_id
WHERE rt.rental_date > '2024-02-03';

-- 8. Імена читачів, які ще нічого не взяли
SELECT name
FROM library.readers
WHERE reader_id NOT IN (
    SELECT reader_id FROM library.rentals
);

-- 9. Кількість книг, які взяв кожен читач
SELECT r.name, COUNT(rt.book_id) AS books_taken
FROM library.readers r
LEFT JOIN library.rentals rt ON r.reader_id = rt.reader_id
GROUP BY r.name;

-- 10. Список книг, які ще ніхто не брав
SELECT title
FROM library.books
WHERE book_id NOT IN (
    SELECT book_id FROM library.rentals
);
