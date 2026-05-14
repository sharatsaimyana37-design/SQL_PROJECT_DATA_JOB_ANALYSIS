SELECT
    job
FROM
    job_postings_fact
GROUP BY
    Date_month
ORDER BY
    date_month