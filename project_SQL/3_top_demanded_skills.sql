/*
Question: What are the most in-demand skills for data analysts ?
- Join job postings to inner join table  similar to query 2
-Identify the top 5 in-demand skills for a data analysts
-Focus on all job postings
-Why? Retrieves the top 5  skills with the highest demand in the job market
providing insights into the most vluable for job seekers
*/
SELECT 
     skills ,
     COUNT(*) AS skills_count -- or COUNT(skills_to_j.job_id)
FROM job_postings_fact AS job_t 
INNER JOIN skills_job_dim AS skills_to_j ON skills_to_j.job_id=job_t.job_id
INNER JOIN skills_dim AS skills_t ON skills_t.skill_id=skills_to_j.skill_id 
WHERE 
     job_title_short='Data Analyst' AND
     job_work_from_home=TRUE

GROUP BY 
     skills_t.skill_id -- or skills
ORDER BY 
     skills_count DESC
LIMIT 5
