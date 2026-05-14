WITH remote_job_postings AS (
    SELECT 
        skills_to_job.skill_id,
        COUNT(*) AS skill_count
    FROM 
        skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
    WHERE job_postings.job_work_from_home = true AND
            job_postings.job_title_short = 'Data Analyst'
    GROUP BY skill_id
)

SELECT 
    remote_job_postings.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_job_postings
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_postings.skill_id
ORDER BY skill_count DESC
LIMIT 5