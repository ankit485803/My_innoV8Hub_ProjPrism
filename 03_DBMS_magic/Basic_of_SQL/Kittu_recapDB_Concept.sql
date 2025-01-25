
-- hm 20th Jan 2025 (Monday - NESAC ISRO Meghalaya se Database ka concept reveise kar rahe h)

CREATE DATABASE apnaCollegeKittu;
CREATE DATABASE apnacollegekittu;
-- this both is written in same format because SQL is a case sensitive prog lang


create database xyz_company;
-- deleting db
DROP DATABASE  xyz_company;

USE apnacollegekittu;
CREATE TABLE student_meher ( 
	rollNo INT,
    name VARCHAR(30),
    age INT
);


-- aab intert karo data ko table mai

INSERT INTO student_meher
VALUE 
(101, "Hrisik", 23),
(102, "Jyoti", 22),
(103, "Bristy", 21),
(104, "Ankit", 20);

-- kaise table ko dekhe
SELECT * FROM student_meher;
















-- 25th Jan (Saturday: NESAC -- tracking party ankit)
-- now read diff operation in db 
CREATE DATABASE IF NOT EXISTS instagram;
SHOW DATABASES;
USE instagram;
CREATE TABLE user (
	id INT,
    age INT,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE,
    followers INT DEFAULT 0,
    following INT,
    CONSTRAINT CHECK (age >= 13),
    PRIMARY KEY (id)

);

INSERT INTO user 
(id, age, name, email, followers, following)
VALUES 
(1, 14, "Jyoti", "jyoti@kiits.ac.in", 1056, 87),
(2, 16, "Hrisik", "hrisik@cu.ac.in", 145, 58),
(3, 15, "Bristy", "bristy@purma.ac.in", 456, 65),
(4, 14, "Ankit", "ankit@iitp.ac.in", 0, 23);

-- dekho database se 
SELECT id, name, age, email, followers, following FROM user; 

CREATE TABLE post (
	id INT PRIMARY KEY,
    content VARCHAR(100),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

