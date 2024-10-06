CREATE DATABASE StudentManagementSystem;

USE StudentManagementSystem;

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    enrollment_date DATE NOT NULL,
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_description TEXT,
    faculty_id INTEGER,
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
);

CREATE TABLE enrollments (
    enrollment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    course_id INTEGER,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE faculty (
    faculty_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    hire_date DATE NOT NULL,
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY AUTOINCREMENT,
    department_name VARCHAR(100) NOT NULL
);

INSERT INTO departments (department_name) VALUES
('Computer Science'),
('Mathematics'),
('History'),
('Physics'),
('Chemistry');

INSERT INTO students (first_name, last_name, date_of_birth, email, enrollment_date, department_id) VALUES
('Rahul', 'Sharma', '2001-03-15', 'rahul.sharma@example.com', '2023-09-01', 1),
('Priya', 'Verma', '2000-06-20', 'priya.verma@example.com', '2023-09-01', 1),
('Amit', 'Gupta', '2002-01-10', 'amit.gupta@example.com', '2023-09-01', 2),
('Sneha', 'Iyer', '1999-12-05', 'sneha.iyer@example.com', '2023-09-01', 3),
('Vikram', 'Kumar', '2003-05-25', 'vikram.kumar@example.com', '2023-09-01', 4);

INSERT INTO faculty (first_name, last_name, email, hire_date, department_id) VALUES
('Dr. Ramesh', 'Patel', 'ramesh.patel@example.com', '2020-07-15', 1),
('Dr. Anita', 'Singh', 'anita.singh@example.com', '2019-08-20', 2),
('Dr. Meena', 'Desai', 'meena.desai@example.com', '2018-09-10', 3),
('Dr. Rajesh', 'Nair', 'rajesh.nair@example.com', '2021-01-25', 4),
('Dr. Kavita', 'Joshi', 'kavita.joshi@example.com', '2022-03-12', 5);

INSERT INTO courses (course_name, course_description, faculty_id) VALUES
('Computer Science 101', 'Introduction to Computer Science', 1),
('Mathematics 101', 'Basic Mathematics Concepts', 2),
('History 101', 'World History Overview', 3),
('Physics 101', 'Fundamentals of Physics', 4),
('Chemistry 101', 'Introduction to Chemistry', 5);

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2023-09-02'),
(1, 2, '2023-09-02'),
(2, 1, '2023-09-03'),
(3, 3, '2023-09-04'),
(4, 4, '2023-09-05'),
(5, 5, '2023-09-06');

SELECT 
    s.first_name,
    s.last_name,
    c.course_name,
    f.first_name AS faculty_first_name,
    f.last_name AS faculty_last_name
FROM 
    students s
JOIN 
    enrollments e ON s.student_id = e.student_id
JOIN 
    courses c ON e.course_id = c.course_id
JOIN 
    faculty f ON c.faculty_id = f.faculty_id;

SELECT 
    d.department_name,
    COUNT(s.student_id) AS student_count
FROM 
    departments d
LEFT JOIN 
    students s ON d.department_id = s.department_id
GROUP BY 
    d.department_name;
