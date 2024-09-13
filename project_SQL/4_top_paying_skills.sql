/*
Answer/ What are the top skills based on salary?
-Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
-Why ? It reveals how different skills impact salary lovels for Data Analysts and
helps identify the most financially rewarding skills to acquire or improve
*/
 
SELECT 
     skills ,
     ROUND(AVG(salary_year_avg),0) AS skills_pay 
FROM job_postings_fact AS job_t 
INNER JOIN skills_job_dim AS skills_to_j ON skills_to_j.job_id=job_t.job_id
INNER JOIN skills_dim AS skills_t ON skills_t.skill_id=skills_to_j.skill_id 
WHERE 
     job_title_short='Data Analyst' AND
     --job_work_from_home=TRUE AND 
     salary_year_avg IS NOT NULL

GROUP BY 
     skills -- or skills skills_t.skill_id 
ORDER BY 
     skills_pay DESC
LIMIT 25;

/*
Here's a breakdown of the results for top paying skills for Data Analysts:

High Demand for Big Data & ML Skills: Top salaries are commanded by analysts skilled in big data technologies (PySpark, Couchbase), machine learning tools (DataRobot, Jupyter), and Python libraries (Pandas, NumPy), reflecting the industry's high valuation of data processing and predictive modeling capabilities.
Software Development & Deployment Proficiency: Knowledge in development and deployment tools (GitLab, Kubernetes, Airflow) indicates a lucrative crossover between data analysis and engineering, with a premium on skills that facilitate automation and efficient data pipeline management.
Cloud Computing Expertise: Familiarity with cloud and data engineering tools (Elasticsearch, Databricks, GCP) underscores the growing importance of cloud-based analytics environments, suggesting that cloud proficiency significantly boosts earning potential in data analytics.

[
  {
    "skills": "svn",
    "skills_pay": "400000"
  },
  {
    "skills": "solidity",
    "skills_pay": "179000"
  },
  {
    "skills": "couchbase",
    "skills_pay": "160515"
  },
  {
    "skills": "datarobot",
    "skills_pay": "155486"
  },
  {
    "skills": "golang",
    "skills_pay": "155000"
  },
  {
    "skills": "mxnet",
    "skills_pay": "149000"
  },
  {
    "skills": "dplyr",
    "skills_pay": "147633"
  },
  {
    "skills": "vmware",
    "skills_pay": "147500"
  },
  {
    "skills": "terraform",
    "skills_pay": "146734"
  },
  {
    "skills": "twilio",
    "skills_pay": "138500"
  },
  {
    "skills": "gitlab",
    "skills_pay": "134126"
  },
  {
    "skills": "kafka",
    "skills_pay": "129999"
  },
  {
    "skills": "puppet",
    "skills_pay": "129820"
  },
  {
    "skills": "keras",
    "skills_pay": "127013"
  },
  {
    "skills": "pytorch",
    "skills_pay": "125226"
  },
  {
    "skills": "perl",
    "skills_pay": "124686"
  },
  {
    "skills": "ansible",
    "skills_pay": "124370"
  },
  {
    "skills": "hugging face",
    "skills_pay": "123950"
  },
  {
    "skills": "tensorflow",
    "skills_pay": "120647"
  },
  {
    "skills": "cassandra",
    "skills_pay": "118407"
  },
  {
    "skills": "notion",
    "skills_pay": "118092"
  },
  {
    "skills": "atlassian",
    "skills_pay": "117966"
  },
  {
    "skills": "bitbucket",
    "skills_pay": "116712"
  },
  {
    "skills": "airflow",
    "skills_pay": "116387"
  },
  {
    "skills": "scala",
    "skills_pay": "115480"
  }
]

*/
