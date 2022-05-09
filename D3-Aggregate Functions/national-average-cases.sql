/*What is the national average total current cases across all dates? */

SELECT 
    AVG(N.total_current_confirmed_cases) AS avg_current_cases 
FROM 
    `bigquery-public-data.covid19_italy.national_trends` N 