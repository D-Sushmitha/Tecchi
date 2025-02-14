ONLINE LEARNING PLATFORM:-

CREATE DATABASE LearningDB;
USE LearningDB;

CREATE TABLE Courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT
);
desc Courses;

CREATE TABLE Instructors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    expertise VARCHAR(50) NOT NULL
);
desc Instructors;

CREATE TABLE Students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);
desc Students;

CREATE TABLE Enrollments (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (course_id) REFERENCES Courses(id)
);
desc Enrollments;

INSERT INTO Courses (title, description) VALUES
('Python Programming', 'Learn Python from beginner to advanced.'),
('Data Science', 'Comprehensive guide to data analysis and machine learning.'),
('Web Development', 'Master HTML, CSS, and JavaScript for web development.'),
('Cybersecurity', 'Learn the fundamentals of cybersecurity and ethical hacking.');
select * from Courses;

INSERT INTO Instructors (name, expertise) VALUES
('Dr. Alice Roberts', 'Python & Machine Learning'),
('John Smith', 'Data Science & AI'),
('Emma Johnson', 'Web Development & Design'),
('Michael Brown', 'Cybersecurity & Network Security');
select * from Instructors;

INSERT INTO Students (name, email) VALUES
('David Wilson', 'david@example.com'),
('Sophia Lee', 'sophia@example.com'),
('James Anderson', 'james@example.com'),
('Emily Davis', 'emily@example.com');
select * from Students;

INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-02-10'),
(2, 2, '2024-02-11'),
(3, 3, '2024-02-12'),
(4, 4, '2024-02-13'),
(1, 2, '2024-02-14'),
(2, 3, '2024-02-15'),
(3, 4, '2024-02-16');
select * from Enrollments;

SELECT 
    Enrollments.enrollment_date,
    Students.name AS student_name, 
    Courses.title AS course_title
FROM Enrollments
JOIN Students ON Enrollments.student_id = Students.id
JOIN Courses ON Enrollments.course_id = Courses.id;

SELECT 
    Courses.title AS course_title, 
    COUNT(Enrollments.student_id) AS total_students
FROM Enrollments
JOIN Courses ON Enrollments.course_id = Courses.id
GROUP BY Courses.title
ORDER BY total_students DESC;


