/*
Question: What are the top paying data analayst jobs?
- Identify yje top 10 highest paying data analyst roles that are avalilable remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into 
*/

SELECT
    job_id,
    job_title,
    job_via,
    job_location,
    job_schedule_type,
    salary_year_avg,
    company_dim.name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE job_title_short = 'Data Analyst'AND
        job_location = 'India' AND
        salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10