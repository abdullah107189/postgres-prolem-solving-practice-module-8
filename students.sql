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
-- 1. add to column
ALTER TABLE students
    ADD COLUMN email VARCHAR(50);


-- 2. Rename column name
ALTER TABLE students
    RENAME COLUMN email to student_email;

-- 3. set constraint and unique 
ALTER TABLE students
   ADD CONSTRAINT unique_email UNIQUE(student_email)

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