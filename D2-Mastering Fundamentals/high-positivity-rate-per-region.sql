/*From your answer in 1 (i.e. using the same columns and conditions),
 which region and date registered the highest positivity rate? Adjust your query accordingly */

SELECT 
    R.date 
    , R.region_code
    , R.region_name 
    , R.total_confirmed_cases/R.tests_performed AS positivity_rate 
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R
WHERE 
    DATE(R.date) BETWEEN DATE('2021-10-20') AND DATE('2021-10-25')
ORDER BY 
    4 DESC 
LIMIT 1