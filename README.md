# HR Data Analysis

### Project Overview

The aim of this HR analytics project is to gain insights into the workforce dynamics and trends within the organization. By analyzing the HR dataset, we aim to uncover patterns related to employee demographics, tenure, turnover rates, departmental distributions, and more. Ultimately, this analysis will empower decision-makers to optimize HR strategies, improve employee retention, and enhance organizational performance.

### Data Source

The primary dataset utilized for this analysis is sourced from the "Human_Resources.csv" file, comprising comprehensive employee data essential for the HR analytics project.

### Tools Used

- MySQL Workbench: To clean and analyze the data.
- PowerBI Desktop: To visualize the outcomes.

### Data Preparation and Data Cleaning Process in MySQL Workbench

1. **Database Creation**: Establish a database named "Human_Resource_Project."
2. **Import Data**: Import the HR dataset from the "Human_Resources.csv" file into the database.
3. **Check Data Types**: Review data types of all columns using the "DESCRIBE" command.
4. **Standardize Date Formats**: Use SQL functions to standardize date formats and convert text to date data types.
5. **Handle Special Characters**: Rename columns with special characters using the "ALTER TABLE" command.
6. **Address Missing Values**: Identify and handle missing values, particularly in date columns like "termdate."
7. **Update Data Types**: Modify data types as needed, such as changing text to date or integer.
8. **Add New Columns**: Introduce new columns like "age" for additional analysis.
9. **Calculate Derived Metrics**: Calculate metrics like age based on existing data.
10. **Ensure Data Integrity**: Validate data integrity and consistency throughout the process.

### Questions Answered in Data Analysis Process in MySQL Workbench

1. Total Number of Employees.
2. Avearge age of Employees.
3. The gender breakdown of employees in the company.
4. Race/ethnicity breakdown of employees.
5. Age distribution of employees.
6. Number of employees at headquarters versus remote locations.
7. Average length of employment for terminated employees.
8. Gender distribution across departments and job titles.
9. Distribution of job titles across the company.
10. Department with the highest turnover rate.
11. Distribution of employees across locations by city and state.
12. Employee changes count over time based on hire and termination dates.
13. Tenure distribution for each department

#### Note: Data cleaning and data analysis SQL files are attached for reference.
