/*Which day had the highest positivity rate in the month of December, for Toscana (9)*/

SELECT 
    R.date 
    , R.region_code
    , R.region_name 
    , R.total_confirmed_cases/R.tests_performed AS positivity_rate
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R 
WHERE 
    DATE(R.date) BETWEEN DATE('2020-12-01') AND DATE('2020-12-31')
    AND R.region_code = '9'
ORDER BY 
    4 DESC 
LIMIT 
    1;