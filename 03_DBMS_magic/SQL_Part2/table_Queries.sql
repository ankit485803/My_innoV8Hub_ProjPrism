

-- SET SQL_SAFE_UPDATE = 0;
-- yah by default 1 hota hai taki koi changes na ho sake


-- given database instagram and having two tables: user & post

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


CREATE TABLE post (
	id INT PRIMARY KEY,
    content VARCHAR(100),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);




-- now aag sikte hai Table Query





-- aab update karo table ko aap
UPDATE user
SET followers = 600
WHERE age = 14;

SET SQL_SAFE_UPDATE = 1;

SELECT * FROM user;

UPDATE user
SET followers = 600
WHERE age = 14;


-- Ques1: delete karo column ko, aur yaad rahe where clause ko use karna mat bhulna because delete is very danger whole data ko delete kar sakte hai ankit bhai okkk
DELETE FROM user
WHERE age = 14;

SELECT * FROM user; -- dekho 


-- ## new topic: Alter table means changes in columns


ALTER TABLE user
ADD COLUMN city varchar(35) DEFAULT "Delhi";
SELECT * FROM user;

ALTER TABLE user
DROP COLUMN age;
SELECT * FROM instaUser;


-- 


-- Ques2: rename karo table ko
ALTER TABLE user
RENAME TO instaUser;
SELECT * FROM user;


-- Truncate table 
TRUNCATE TABLE user;










