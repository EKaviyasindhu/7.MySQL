-- Data Definition Language
-- 1) Creating a Database
-- Creat a database named 'practice_db'

CREATE DATABASE practice_db;

-- Switch to the new Database
USE practice_db;

-- To View the Database
SHOW DATABASES;

-- Creating Tables
-- Creating a table named 
CREATE TABLE students(
	student_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID,  Auto Increment
    first_name VARCHAR(50) NOT NULL,			-- Cannaot be Null
    last_name VARCHAR(50),						-- optional
    email VARCHAR(100) UNIQUE,					-- Must be Unique
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Default to Today's date and time
);

-- select * from students;
-- desc students;
describe students;

-- 3) Altering Tables 
-- Add a new column 'phone_number' to the 'students' table 
ALTER TABLE students
ADD phone_number VARCHAR(15);

-- Modify the last_name column to be NOT NULL
ALTER TABLE students
MODIFY last_name  VARCHAR(50) NOT NULL;

-- Rename Column last_name to last_names
ALTER TABLE students
RENAME COLUMN last_name TO last_names;

-- Rename Table name 'students' to 'university_students'
ALTER TABLE students
RENAME TO university_students;

-- 4) Dropping Table
-- Dropping table university_students
DROP TABLE university_students;

-- create a table with constraints
CREATE TABLE courses(
	course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL UNIQUE,
    credits INT CHECK (credits BETWEEN 1 AND 5) -- Ensure credits are between 1 and 5
);

-- Create a table with a foreign key
CREATE TABLE enrollments(
enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
course_id INT,
FOREIGN KEY (student_id) REFERENCES students(student_id),
FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Remove all rows from the 'students' table
TRUNCATE TABLE students;

-- To delete single column
ALTER TABLE students
DROP COLUMN phone_number