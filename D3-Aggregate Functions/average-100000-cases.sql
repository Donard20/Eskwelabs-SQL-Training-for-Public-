/*Based on the previous question, which months registered 
more an average of more than 100000 current cases?
 Sort results by date ascending. */

SELECT 
    DATE_TRUNC(N.date, MONTH) AS month 
    , AVG(N.total_current_confirmed_cases) AS avg_current_cases 
FROM 
    `bigquery-public-data.covid19_italy.national_trends` N 
GROUP BY 
    1 
HAVING 
    AVG(N.total_current_confirmed_cases) > 100000
ORDER BY 
    1 ASC