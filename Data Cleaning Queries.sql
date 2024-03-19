create database Human_Resource_Project;
use human_resource_project;
-- Check all data from hr table
select * from hr;

-- Data Cleaning Process

-- Rename id column (As this column name contains special characters)
alter table hr
change column ï»¿id emp_id varchar(20) null;

-- Check data types of all columns
describe hr;

-- 3.	Change the Birthdate column data type from text to date and standardize the date format.
UPDATE hr
SET birthdate = case
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%y'),'%Y-%m-%d')
    ELSE null
 end;
 
SELECT birthdate
    FROM hr;

-- birthdate column data type is still text, we need to change it to Date

Alter table hr
Modify column birthdate date;
describe hr;

-- By using the same query as birthdate column, we’ll update the hire_date column
UPDATE hr
SET hire_date = case
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%y'),'%Y-%m-%d')
    ELSE null
 end;
    
-- hire_date column data type is still text, we need to change it to Date

alter table hr
modify column hire_date date;
describe hr;
SELECT hire_date FROM hr;

select termdate from hr;
-- Update the termdate column, as termdate column has values with date and time together.
-- update hr
-- set termdate = case
	-- when termdate is not null and termdate!= ' ' then date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC')) 
-- Else '0000-00-00'
-- End;

UPDATE hr
SET termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC')) 
WHERE termdate is NOT null
        AND termdate!= '';
        
SELECT termdate FROM hr;

-- update hr
-- set termdate = '0000-00-00'
-- where termdate is null and termdate = ' ';
SELECT termdate FROM hr;

SET sql_mode = 'ALLOW_INVALID_DATES';  -- used to set the SQL mode to allow the insertion or update of invalid dates into a database.

UPDATE hr
SET termdate = '0000-00-00'
WHERE termdate is null AND termdate = ' ';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

describe hr;
SELECT * FROM hr;
SELECT termdate FROM hr;

-- We need to add new column ‘age’ which is useful for analysis process.
Alter table hr
Add column age int;

SELECT * FROM hr;

-- now need to add values into 'age' column, which is year differnce between birthdate and current date.
UPDATE hr
SET age = timestampdiff(Year, birthdate, curdate());

SELECT birthdate, age FROM hr;

-- there are some minus values in age column, so we'll check the age range of employee
SELECT min(age) AS youngest,
        max(age) AS oldest
FROM hr;

-- Check how many values have age < 18.
SELECT count(*)
FROM hr
WHERE age<18;

-- there are 967 records, we can exclude those during analysis process. 
SELECT * FROM hr;
SELECT count(*) FROM hr;