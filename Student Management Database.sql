-- Task1 : STUDENT MANAGEMENT DATABASE

-- CREATE DATABASE
DROP DATABASE StudentManagement;
CREATE DATABASE StudentManagement;

-- USE DATABASE
USE StudentManagement;

-- CREATE STUDENT TABLE
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    Grade VARCHAR(10),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT
);

-- INSERT DATA INTO STUDENTS
INSERT INTO Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) VALUES
('Anchal', 'Female', 20, 'A', 85, 78, 90),
('Rahul', 'Male', 21, 'B', 70, 65, 60),
('Priya', 'Female', 19, 'A', 92, 88, 95),
('Amit', 'Male', 22, 'C', 55, 60, 58),
('Sneha', 'Female', 20, 'B', 80, 75, 85),
('Rohan', 'Male', 21, 'A', 88, 82, 84),
('Kavita', 'Female', 23, 'C', 60, 55, 65),
('Vikas', 'Male', 22, 'B', 77, 70, 72),
('Neha', 'Female', 19, 'A', 91, 89, 93),
('Arjun', 'Male', 20, 'B', 83, 76, 79);

-- SQL QUERIES
-- 1. SHOW ALL STUDENTS
SELECT * FROM Students;

-- 2. AVERAGE SCORE IN EACH SUBJECT
SELECT 
    AVG(MathScore) AS Avg_Math,
    AVG(ScienceScore) AS Avg_Science,
    AVG(EnglishScore) AS Avg_English
FROM Students;

-- 3. TOP PERFORMER
SELECT Name, 
       (MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
ORDER BY TotalScore DESC
LIMIT 1;

-- 4. COUNT STUDENTS PER GRADE
SELECT Grade, COUNT(*) AS TotalStudents
FROM Students
GROUP BY Grade;

-- 5. AVERAGE SCORE BY GENDER
SELECT Gender,
       AVG(MathScore) AS Avg_Math,
       AVG(ScienceScore) AS Avg_Science,
       AVG(EnglishScore) AS Avg_English
FROM Students
GROUP BY Gender;

-- 6. STUDENTS WITH MATH SCORE > 80
SELECT * 
FROM Students
WHERE MathScore > 80;

-- 7. UPDATE A STUDENT'S GRADE
UPDATE Students
SET Grade = 'A'
WHERE StudentID = 2;
-- END OF TASK1


-- TASK2 : COURSES & ENROLLMENTS

-- CREATE COURSES TABLE
USE StudentManagement;
CREATE TABLE IF NOT EXISTS Courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

-- CREATE ENROLLMENTS TABLE
CREATE TABLE IF NOT EXISTS Enrollments (
    student_id INT,
    course_id INT,
    grade INT,
    FOREIGN KEY (student_id) REFERENCES Students(StudentID),
    FOREIGN KEY (course_id) REFERENCES Courses(id)
);

-- INSERT DATA INTO COURSES
INSERT INTO Courses (name) VALUES
('Math'),
('Science'),
('English');

-- INSERT DATA INTO ENROLLMENTS
INSERT INTO Enrollments (student_id, course_id, grade) VALUES
(1,1,85),(1,2,78),(1,3,90),
(2,1,70),(2,2,65),(2,3,60),
(3,1,92),(3,2,88),(3,3,95),
(4,1,30),(4,2,35),(4,3,40),
(5,1,80),(5,2,75),(5,3,85);

-- QUERIES

-- 1. LIST STUDENTS IN EACH COURSE
SELECT c.name AS Course, s.Name AS Student
FROM Enrollments e
JOIN Students s ON e.student_id = s.StudentID
JOIN Courses c ON e.course_id = c.id
ORDER BY c.name;

-- 2. AVERAGE GRADE PER COURSE
SELECT c.name AS Course, AVG(e.grade) AS Avg_Grade
FROM Enrollments e
JOIN Courses c ON e.course_id = c.id
GROUP BY c.name;

-- 3. TOP 3 STUDENTS OVERALL
SELECT s.Name, SUM(e.grade) AS TotalScore
FROM Enrollments e
JOIN Students s ON e.student_id = s.StudentID
GROUP BY s.Name
ORDER BY TotalScore DESC
LIMIT 3;

-- 4. COUNT STUDENTS WHO FAILED (GRADE < 40)
SELECT COUNT(DISTINCT student_id) AS FailedStudents
FROM Enrollments
WHERE grade < 40;

-- END OF TASK2
