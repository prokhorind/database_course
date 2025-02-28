-- Вибірка всіх курсів, на які записаний студент "Андрій Коваль"
SELECT c.course_name
FROM education.courses c
JOIN education.student_courses sc ON c.course_id = sc.course_id
JOIN education.students s ON sc.student_id = s.student_id
WHERE s.name = 'Андрій Коваль';

-- Вибірка всіх студентів, які записані на курс "Програмування"
SELECT s.name
FROM education.students s
JOIN education.student_courses sc ON s.student_id = sc.student_id
JOIN education.courses c ON sc.course_id = c.course_id
WHERE c.course_name = 'Програмування';

-- Видалення курсу "Фізика"
DELETE FROM education.courses WHERE course_name = 'Фізика';

-- Вибірка всіх записів після видалення курсу "Фізика"
SELECT * FROM education.student_courses;