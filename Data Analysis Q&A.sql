-- QUESTIONS

-- 1. Total employees in company
SELECT DISTINCT count(emp_id) AS Total_Employees FROM hr;

-- 2. Average age of employee
SELECT round(avg(age), 0) AS Avg_Emp_Age FROM hr;

-- 3. What is the gender breakdown of employees in the company?
SELECT gender,
        count(*) AS Count
FROM hr
WHERE age>=18 AND termdate = 0000-00-00
GROUP BY gender;

-- 4. What is the race/ethnicity breakdown of employees in the company?
SELECT race,
        count(*) AS Count
FROM hr
WHERE age>=18 AND termdate = 0000-00-00
GROUP BY race
ORDER BY Count desc;

-- 5. What is the age distribution of employees in the company?
-- First we check the min and max age of employee
SELECT min(age) AS Youngest,
        max(age) AS Oldest
FROM hr
WHERE age>=18 AND termdate = 0000-00-00;

-- Now, create the age group using case when statement to check age distribution
select
	case
		WHEN age>=18 AND age<=24 THEN '18-24'
        WHEN age>=25 AND age<=34 THEN '25-34'
        WHEN age>=35 AND age<=44 THEN '35-44'
		WHEN age>=45 AND age<=54 THEN '45-54'
		WHEN age>=55 AND age<=64 THEN '55-64'
		ELSE '64 Above'
	END AS age_group,
 count(*) AS Count
    FROM hr
WHERE age>=18 AND termdate = 0000-00-00
GROUP BY  age_group
ORDER BY  age_group;
    
-- Also we can distribute using age group and gender
select
	case
		WHEN age>=18 AND age<=24 THEN '18-24'
        WHEN age>=25 AND age<=34 THEN '25-34'
        WHEN age>=35 AND age<=44 THEN '35-44'
		WHEN age>=45 AND age<=54 THEN '45-54'
		WHEN age>=55 AND age<=64 THEN '55-64'
		ELSE '64 Above'
	END AS age_group, gender,
 count(*) AS Count
    FROM hr
WHERE age>=18 AND termdate = 0000-00-00
GROUP BY  age_group, gender
ORDER BY  age_group, gender;
    
-- 6. How many employees work at headquarters versus remote locations?
SELECT location,
        count(*) AS Count
FROM hr 
WHERE age>=18 AND termdate = 0000-00-00 
GROUP BY location;

-- 7. What is the average length of employment for employees who have been terminated?
select
	round(avg(datediff(termdate,hire_date))/365,0) AS avg_len_employement
FROM hr
WHERE age>=18 AND termdate <> 0000-00-00 AND termdate<=curdate();

-- 8. How does the gender distribution vary across departments and job titles?
SELECT department,
        jobtitle,
        gender,
        count(*) AS Count
FROM hr
WHERE age>=18 AND termdate = 0000-00-00
GROUP BY department,jobtitle, gender
ORDER BY department, jobtitle;

-- 9. What is the distribution of job titles across the company?
SELECT jobtitle,
        count(*) AS Count
FROM hr
WHERE age>=18 AND termdate = 0000-00-00
GROUP BY jobtitle
ORDER BY jobtitle;

-- 10. Which department has the highest turnover rate?
SELECT department,
        total_emp,
        terminated_emp,
        terminated_emp/total_emp AS termination_rate
from(
SELECT department,
		count(*) AS total_emp,
        sum(CASE WHEN termdate <> 0000-00-00 AND termdate <= curdate() THEN 1 ELSE 0 end) AS terminated_emp
		FROM hr
		WHERE age>=18
		GROUP BY department
) AS subquery
ORDER BY termination_rate desc;

-- 11. What is the distribution of employees across locations by city and state?
-- we just use state because there is too many cities and it'll get conjested while ploting on map.
SELECT location_state,
        count(*) AS Count
FROM hr
WHERE age>=18 AND termdate = 0000-00-00
GROUP BY location_state
ORDER BY Count desc;

-- with city and state
SELECT location_state,
        location_city,
        count(*) AS Count
FROM hr
WHERE age>=18 AND termdate = 0000-00-00
GROUP BY location_state, location_city
ORDER BY Count desc;

-- 12. How has the company's employee count changed over time based on hire and term dates?
SELECT min(hire_date),
        max(hire_date)
FROM hr;
-- so the data is from 2000-10-17 to 2020-12-13
-- In this query, we need to calculate how many employees hired, how many terminated, net change(hires-terminations) 
-- and what is the percentage net change(hires-terminations/hires*100). We’re using subquery.
SELECT 
	year,
	hires,
	terminations,
	hires-terminations AS net_change,
	round((hires-terminations)/hires * 100, 2) AS net_change_percentage
from(
	SELECT 
year(hire_date) AS year,
count(*) AS hires,
sum(CASE WHEN termdate <> 0000-00-00 AND termdate <= curdate() THEN 1 ELSE 0 end) AS terminations
    FROM hr
    WHERE age>=18
    GROUP BY  year
 ) AS subquery
ORDER BY year;
    
-- 13. What is the tenure distribution for each department?
SELECT department, round(avg(datediff(termdate, hire_date)/365), 0) AS avg_tenure
FROM hr
WHERE age>=18 AND termdate <> 0000-00-00 AND termdate<=curdate()
GROUP BY department;