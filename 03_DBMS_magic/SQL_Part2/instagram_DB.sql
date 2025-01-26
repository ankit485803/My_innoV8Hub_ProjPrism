



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








-- 26th Jan 2025 (Sunday - Republic Day) SQL part2

SHOW DATABASES;
USE instagram;
SELECT *
FROM user
WHERE followers >= 100;

-- Que1: check the user whose age < 16
SELECT name, age
FROM user
WHERE age < 16;

-- Qeus2: Limit ko use karke fix 
SELECT name, age, email
FROM user
WHERE age < 14
LIMIT 2;

-- Que3: Sort karo followers ko descending order mai
SHOW DATABASES;
USE instagram;
SELECT name, age, followers
FROM user
-- ORDER BY age ASC;
ORDER BY followers DESC;

-- Ques4: find karo max followes from our database instagram?
SELECT max(followers)
FROM user;
SELECT min(age)
FROM user;

-- Ques5: aise user ko nike count kiska age 14 ho
SELECT count(age)
FROM user
WHERE age = 14;

SELECT sum(followers)
FROM user;


-- Que6: age se hisab se group banawo 
SELECT age, count(id)
FROM user
GROUP BY age;

-- apply karo having clause
SELECT age, max(followers)
FROM user
GROUP BY age
HAVING max(followers) > 200;









CREATE TABLE post (
	id INT PRIMARY KEY,
    content VARCHAR(100),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);