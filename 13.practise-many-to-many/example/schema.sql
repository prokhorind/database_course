CREATE SCHEMA education;

CREATE TABLE education.students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE education.courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);

CREATE TABLE education.student_courses (
    student_id INT REFERENCES education.students(student_id) ON DELETE CASCADE,
    course_id INT REFERENCES education.courses(course_id) ON DELETE CASCADE,
    PRIMARY KEY (student_id, course_id)
);









