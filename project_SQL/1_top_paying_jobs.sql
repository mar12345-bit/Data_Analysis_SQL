/*
Question : what are the top -paying Data Analyst jobs?
-Identify the top 10 highest-paying Data Analyst roles that are available remotely
-Focuses on job postings with specified salaries (remove nulls)
-why ? Highlight the top-paying opportunities for Data Analysts, offering insights into employment
*/
SELECT 
     job_id,
     job_title,
     job_location,
     job_schedule_type,
     salary_year_avg,
     job_posted_date,
     name AS company_name
FROM 
     job_postings_fact AS job_t
LEFT JOIN company_dim  AS company_t ON job_t.company_id=company_t.company_id
 WHERE 
     job_title_short='Data Analyst' AND
     job_location='Anywhere' AND
     salary_year_avg IS NOT NULL

 ORDER BY salary_year_avg DESC
 LIMIT 10
