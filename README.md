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

### Findings from the Analysis

1. The company employs a total of 22,214 individuals, with an average age of 35 years. There is a higher representation of male employees compared to females.
2. White individuals constitute the majority racial group, while Native Hawaiian and American Indian individuals are the least represented.
3. The age of employees ranges from 21 to 58 years, with the youngest being 21 and the oldest being 58.
4. Employees were categorized into five age groups: 18-24, 25-34, 35-44, 45-54, and 55-64. The largest proportion of employees falls within the 35-44 age group (4,997 employees), followed by the 25-34 age group (4,932), while the smallest group is 55-64 (1,021 employees).
5. The majority of employees (75%) work at the headquarters, with the remaining 25% working remotely.
6. The average length of employment for terminated employees is approximately 8 years.
7. Gender distribution across departments is relatively balanced, with a slightly higher proportion of male employees across all departments. The Engineering department boasts the highest number of employees, while the Auditing department has the fewest.
8. The Auditing department (termination rate of 0.18) experiences the highest termination rate, followed by the Legal department (0.13). The Marketing department exhibits the lowest termination rate at 0.09.
9. A significant portion of employees originate from the state of Ohio.
10. Over the years, there has been a net increase in the number of employees.

### Limitations

1. **Exclusion of Negative Age Records**: During the data analysis process, a total of 967 records were identified with negative values in the age column. These records were excluded from the analysis using the condition 'WHERE age >= 18', ensuring that only individuals aged 18 years and above were considered for the analysis.
2. **Exclusion of Future Term Dates**: Another limitation encountered was the presence of term dates that extended far into the future, totaling 1,599 records. To maintain the integrity of the analysis, only term dates less than or equal to the current date were included. This filtering process was implemented using a WHERE clause during the analysis phase.
