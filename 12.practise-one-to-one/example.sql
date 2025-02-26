create schema ed;


CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    class VARCHAR(10) NOT NULL
);

CREATE TABLE id_cards (
    id SERIAL PRIMARY KEY,
    student_id INT UNIQUE REFERENCES students(id), -- 1:1 зв’язок
    card_number VARCHAR(20) UNIQUE NOT NULL,      -- Унікальний номер картки
    issue_date DATE NOT NULL
);

INSERT INTO students (name, class) VALUES
('Олена Грищенко', '10-А'),
('Максим Коваль', '11-Б'),
('Дарина Лисенко', '10-Б');

INSERT INTO id_cards (student_id, card_number, issue_date) VALUES
(1, 'ID2024001', '2024-01-10'),
(2, 'ID2024002', '2024-01-15'),
(3, 'ID2024003', '2024-01-20');

SELECT s.id, s.name, s.class, c.card_number, c.issue_date
FROM students s
JOIN id_cards c ON s.id = c.student_id;
