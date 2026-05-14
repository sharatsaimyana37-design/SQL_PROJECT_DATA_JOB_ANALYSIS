SELECT 
    quarter1_job_postings.job_title_short,
    quarter1_job_postings.job_location,
    quarter1_job_postings.job_via,
    quarter1_job_postings.job_posted_date::DATE,
    quarter1_job_postings.salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    WHERE salary_year_avg > 70000 AND job_title_short = 'Data Analyst'

    UNION ALL

    SELECT *
    FROM february_jobs
    WHERE salary_year_avg > 70000 AND job_title_short = 'Data Analyst'

    UNION ALL

    SELECT *
    FROM march_jobs
    WHERE salary_year_avg > 70000 AND job_title_short = 'Data Analyst'
) AS quarter1_job_postings
ORDER BY quarter1_job_postings.salary_year_avg DESC