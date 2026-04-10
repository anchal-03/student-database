DROP DATABASE StudentManagement;
CREATE DATABASE StudentManagement;
USE StudentManagement;

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
SELECT * FROM Students;
SELECT 
    AVG(MathScore) AS Avg_Math,
    AVG(ScienceScore) AS Avg_Science,
    AVG(EnglishScore) AS Avg_English
FROM Students;
SELECT Name, 
       (MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
ORDER BY TotalScore DESC
LIMIT 1;
SELECT Grade, COUNT(*) AS TotalStudents
FROM Students
GROUP BY Grade;
SELECT Gender,
       AVG(MathScore) AS Avg_Math,
       AVG(ScienceScore) AS Avg_Science,
       AVG(EnglishScore) AS Avg_English
FROM Students
GROUP BY Gender;
SELECT * 
FROM Students
WHERE MathScore > 80;
UPDATE Students
SET Grade = 'A'
WHERE StudentID = 2;