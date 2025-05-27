-- Active: 1748101600106@@127.0.0.1@5432@ph
-- Active: 1748101600106@@127.0.0.1@5432@ph

-- creating table
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    roll INTEGER UNIQUE,
    s_name VARCHAR(50),
    age SMALLINT,
    department VARCHAR(20),
    score SMALLINT,
    academic_result VARCHAR(20),
    last_login DATE
);
-- rename id to s_id for better know id
ALTER TABLE students
    RENAME id to s_id;
-- change VARCHAR(20) to VARCHAR(50)
ALTER TABLE students
    alter column department TYPE VARCHAR(50)

SELECT * FROM students;
INSERT INTO students (roll, s_name, age, department, score, academic_result, last_login) VALUES
(127, 'Tina Phillips', 27, 'Chemistry', 45, 'Good', '2024-05-09');


(101, 'Alice Smith', 20, 'Computer Science', 85, 'Excellent', '2025-05-20'),
(102, 'Bob Johnson', 21, 'Electrical Engineering', 78, 'Good', '2025-05-19'),
(103, 'Charlie Brown', 19, 'Mathematics', 92, 'Excellent', '2025-05-21'),
(104, 'Diana Miller', 20, 'Physics', 70, 'Average', '2025-05-18'),
(105, 'Eve Davis', 22, 'Chemistry', 88, 'Excellent', '2025-05-22'),
(106, 'Frank White', 21, 'Computer Science', 75, 'Good', '2025-05-17'),
(107, 'Grace Taylor', 19, 'Electrical Engineering', 65, 'Pass', '2025-05-20'),
(108, 'Henry Wilson', 20, 'Mathematics', 80, 'Good', '2025-05-16'),
(109, 'Ivy Moore', 22, 'Physics', 95, 'Excellent', '2025-05-23'),
(110, 'Jack Green', 20, 'Chemistry', 72, 'Average', '2025-05-15'),
(111, 'Karen Hall', 21, 'Computer Science', 90, 'Excellent', '2025-05-24'),
(112, 'Liam King', 19, 'Electrical Engineering', 68, 'Pass', '2025-05-14'),
(113, 'Mia Wright', 20, 'Mathematics', 83, 'Good', '2025-05-25'),
(114, 'Noah Turner', 22, 'Physics', 79, 'Good', '2025-05-13'),
(115, 'Olivia Scott', 20, 'Chemistry', 86, 'Excellent', '2025-05-26'),
(116, 'Peter Adams', 21, 'Computer Science', 71, 'Average', '2025-05-12'),
(117, 'Quinn Baker', 19, 'Electrical Engineering', 91, 'Excellent', '2025-05-27'),
(118, 'Rachel Carter', 20, 'Mathematics', 60, 'Fail', '2025-05-11'),
(119, 'Sam Roberts', 22, 'Physics', 84, 'Good', '2025-05-10'),
(120, 'Tina Phillips', 20, 'Chemistry', 77, 'Good', '2025-05-09');

INSERT INTO student
-- 1. add to column
ALTER TABLE students
    ADD COLUMN email VARCHAR(50);


-- 2. Rename column name
ALTER TABLE students
    RENAME COLUMN email to student_email;

-- 3. set constraint and unique 
ALTER TABLE students
   ADD CONSTRAINT unique_email UNIQUE(student_email)

ALTER TABLE students
   ALTER COLUMN student_email set DEFAULT 'n/a';

-- creating new table for set primary key 
CREATE Table courses(
    c_id SERIAL,
    c_name VARCHAR(50),
    c_instructor VARCHAR(50)
)

-- 4. Add Primary key new TABLE courses;
ALTER TABLE courses
    ADD constraint pk_c_id PRIMARY KEY(c_id);
INSERT INTO courses (c_name, c_instructor) VALUES('math', 'mofijul');

-- 5. drop courses c_name column 
ALTER TABLE courses
    DROP COLUMN c_name;

SELECT * FROM courses;



 -----------------------------------------------------
-- 6. show score greater then 80 and not NULL;
 SELECT score FROM students
    WHERE (score >= 80) OR (score IS NOT NULL);

-- 7. use not operation 
SELECT * FROM students
    WHERE NOT department ='Physics';

-- 8. Fetch students whose names start with ‘A’ using LIKE and ILIKE.
SELECT * FROM students
    WHERE s_name LIKE 'a%';

-- **** i ILIKE is the best search because this is find any text like smaller , bigger any thing **
SELECT * FROM students
    WHERE s_name ILIKE 'a%'

-- 9. Select all students whose age is between 18 and 25.
SELECT * from students WHERE age BETWEEN 18 AND 25;

-- 10. Retrieve rows using IN for a specific set of roll numbers.
SELECT * FROM students WHERE roll IN(102, 105, 120);

----------------------------------------------------------------
-- 11. count student
SELECT count(*) FROM students;

-- 12. specific department of average score
SELECT department, avg(score) FROM students
    GROUP BY department

-- 13. maximum and minimum age
SELECT max(age) FROM students;
SELECT min(age) as "Small age" FROM students;

-------------------------------------------------
-- 14. Update the status of students who scored less than 50 to 'failed'.
UPDATE students
SET academic_result = 'Failed'
WHERE score < 50;

-- 15. Delete students who have not logged in since last year.
DELETE FROM students
WHERE last_login <= NOW() - INTERVAL '1 year';
-- WHERE last_login <= NOW() - INTERVAL '10 day';
-- WHERE last_login <= NOW() - INTERVAL '1 month';

-- 16. se LIMIT and OFFSET to fetch the second page of results (5 per page).
SELECT * FROM students LIMIT(5) OFFSET(5*0)
