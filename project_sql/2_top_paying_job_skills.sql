/*
 Question: What skills are required for the top-paying data analyst jobs?
 - Use the top 10 highest-paying Data Analyst jobs from first query
 - Add the specific skills required for these roles
 - Why? It provides a detailed look at which high-paying jobs demand certain skills, 
 helping job seekers understand which skills to develop that align with top salaries
 */
with top_paying_jobs AS (
    SELECT job_postings_fact.job_id,
        job_title,
        company_dim.name as company_name,
        salary_year_avg
    FROM job_postings_fact
        left JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
    where job_title_short = 'Data Analyst'
        and job_location = 'Anywhere'
        and salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    Limit 10
)
SELECT top_paying_jobs.*,
    skills
FROM top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;
/*
 Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
 SQL is leading with a bold count of 8.
 Python follows closely with a bold count of 7.
 Tableau is also highly sought after, with a bold count of 6.
 Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.
 */