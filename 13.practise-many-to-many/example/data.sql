INSERT INTO education.students (name) VALUES
('Андрій Коваль'),
('Марина Петренко'),
('Олег Василенко');

INSERT INTO education.courses (course_name) VALUES
('Математика'),
('Програмування'),
('Фізика');

INSERT INTO education.student_courses (student_id, course_id) VALUES
(1, 1),  -- Андрій записаний на Математику
(1, 2),  -- Андрій записаний на Програмування
(2, 2),  -- Марина записана на Програмування
(3, 3);  -- Олег записаний на Фізику
