/*Which regions have an average fatality rate of less than 5%? 
Consider only days where total cases > 0, and sort results from highest fatality rate to lowest. */


SELECT 
    R.region_code
    , R.region_name 
    , AVG(R.deaths/R.total_confirmed_cases) AS avg_fatality_rate 
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R 
WHERE 
    total_confirmed_cases > 0 
GROUP BY 
    1,2
HAVING 
    AVG(R.deaths/R.total_confirmed_cases) <0.05
ORDER BY 
    3 DESC 