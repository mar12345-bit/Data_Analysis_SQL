/*
Answer: What are the most optimal skills to learn = it's in high demand + high-paying skill?
-Identify skills in high demand and associated with high average salaries for Data Analyst roles
-Concentrates on remote positions with specified salaries
-Why? Targets skills that offer job security (high demand ) and financial benefits (high salaries)
 offering strategic insights for career develoment in data analysis
*/

WITH demanded_skills AS (
     SELECT 
          skills_t.skill_id,
          skills ,
          COUNT(*) AS skills_count -- or COUNT(skills_to_j.job_id)
     FROM job_postings_fact AS job_t 
     INNER JOIN skills_job_dim AS skills_to_j ON skills_to_j.job_id=job_t.job_id
     INNER JOIN skills_dim AS skills_t ON skills_t.skill_id=skills_to_j.skill_id 
     WHERE 
          job_title_short='Data Analyst' AND
          job_work_from_home=TRUE AND
          salary_year_avg IS NOT NULL

     GROUP BY 
          skills_t.skill_id -- or skills
), most_paying_skills AS (
     SELECT 
          skills_t.skill_id,
          skills ,
          ROUND(AVG(salary_year_avg),0) AS skills_pay 
     FROM job_postings_fact AS job_t 
     INNER JOIN skills_job_dim AS skills_to_j ON skills_to_j.job_id=job_t.job_id
     INNER JOIN skills_dim AS skills_t ON skills_t.skill_id=skills_to_j.skill_id 
     WHERE 
          job_title_short='Data Analyst' AND
          job_work_from_home=TRUE AND 
          salary_year_avg IS NOT NULL

     GROUP BY 
          skills_t.skill_id -- or skills OR skills_t.skill_id 
   
)

/*SELECT *
FROM most_paying_skills
LIMIT 25*/
SELECT 
     demanded_skills.skill_id,
     demanded_skills.skills,
     skills_count,
     skills_pay
FROM 
     demanded_skills 
INNER JOIN most_paying_skills ON demanded_skills.skill_id=most_paying_skills.skill_id
WHERE skills_count>10
ORDER BY 
     skills_pay DESC,
     skills_count DESC
     


-- rewrite the same query more concisely
SELECT 
     skills_t.skill_id,
     skills ,
     COUNT(*) AS skills_count,
     ROUND(AVG(salary_year_avg),0) AS skills_pay 
FROM job_postings_fact AS job_t 
INNER JOIN skills_job_dim AS skills_to_j ON skills_to_j.job_id=job_t.job_id
INNER JOIN skills_dim AS skills_t ON skills_t.skill_id=skills_to_j.skill_id 
WHERE 
     job_title_short='Data Analyst' AND
     job_work_from_home=TRUE AND 
     salary_year_avg IS NOT NULL

GROUP BY 
     skills_t.skill_id -- or skills OR skills_t.skill_id 
HAVING COUNT(*)>10
ORDER BY 
     skills_pay DESC,
     skills_count DESC
