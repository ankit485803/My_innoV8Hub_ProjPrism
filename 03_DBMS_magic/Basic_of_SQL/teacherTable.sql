


CREATE DATABASE teacherDB;

USE teacherDB;


CREATE TABLE teacherTable (
	id 	INT PRIMARY KEY,
	name VARCHAR(50),
	subject VARCHAR(50),
	salary INT
);

INSERT INTO teacherTable
(id, name, subject, salary)
VALUES
(101, "kuldipsir", "maths", 50000),
(103, "jaydeeochandra", "cs", 95000),
(105, "kpsingh", "dataanalytics", 25000),
(107, "smitamam", "english", 65000);


SELECT * FROM teacherTable;


-- hm aab question karte hai

 
SELECT * FROM teacherTable
WHERE salary > 10000;



ALTER TABLE teacherTable
CHANGE COLUMN salary ctc INT;


SELECT * FROM teacherTable
WHERE ctc > 45000;


UPDATE teacherTable
SET ctc = ctc + ctc * 0.25;


SELECT * FROM teacherTable;

ALTER TABLE teacherTable
ADD COLUMN city VARCHAR(50) DEFAULT "Gurgeon";


ALTER TABLE teacherTable
ADD COLUMN salaryExtra INT DEFAULT 15000;


ALTER TABLE teacherTable
DROP COLUMN salaryExtra;






-- abbbbbbbbbbbbbbbbbbbbbbbbbbb Q2  solution 



CREATE TABLE studentTable (
   rollno INT PRIMARY KEY,
   name VARCHAR(30),
   city VARCHAR(30),
   marks INT
);

ALTER TABLE studentTable
DROP COLUMN marks;

ALTER TABLE studentTable
ADD COLUMN cgpa INT;


-- UPDATE studentTable
-- SET rollno INT PRIMARY KEY = roll INT


INSERT INTO studentTable 
(rollno, name, city, cgpa)
VALUES
(102, "mahendraKrGupta", "iitbhumunashwer",  8),
(104, "krinshnaPratapSingh", "iitallabad", 9.2),
(106, "nutanKrTomar",  "iitp", 7),
(108, "kuldipSinghPatel", "iitp", 8);


SELECT * FROM  studentTable;

SELECT DISTINCT city, MAX(cgpa)
FROM studentTable
GROUP BY city;

SELECT DISTINCT city
FROM studentTable;

SELECT AVG(cgpa)
FROM studentTable;

ALTER TABLE studentTable
ADD COLUMN grade VARCHAR(2);

UPDATE studentTable
SET grade = "0"
WHERE cgpa >= 7;

UPDATE studentTable
SET grade = "A"
WHERE cgpa >= 7 AND cgpa <= 10;

UPDATE studentTable
SET grade = "B"
WHERE cgpa >= 6 AND cgpa < 7;














