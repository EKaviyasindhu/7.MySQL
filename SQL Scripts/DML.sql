-- Insert
INSERT INTO students (first_name,last_name,email,enrollment_date)
VALUES ('John','Doe','john.doe@email.com','2025-08-28');

select * from students;

-- Insert Multiple columns
INSERT INTO students (first_name,last_name,email,enrollment_date)
VALUES ('joe','Smith','joe@email.com','2025-08-29'),
('Alice','Johnson','alice@email.com','2025-08-27');

-- Update table single column
UPDATE students 
SET email = 'john.new@email.com'
WHERE student_id = 1;

-- To disable safe update mode for this session
SET SQL_SAFE_UPDATES = 0;

-- Update table multiple column
UPDATE students 
SET last_name = 'Brown', email = 'joe.brown@email.com'
WHERE first_name = 'joe';

    
CREATE TABLE archived_students(
	student_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID,  Auto Increment
    first_name VARCHAR(50) NOT NULL,			-- Cannaot be Null
    last_name VARCHAR(50),						-- optional
    email VARCHAR(100) UNIQUE,					-- Must be Unique
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Default to Today's date and time
);

-- Insert using another table - fetching values from another table and insert into the current table
INSERT INTO archived_students (student_id, first_name, last_name, email, enrollment_date)
select student_id, first_name, last_name, email, enrollment_date
from students
where enrollment_date='2025-08-29';

select * from archived_students