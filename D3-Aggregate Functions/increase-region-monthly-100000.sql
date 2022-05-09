/*From the previous question, which regions and month registered an increase of more than 10000? */

SELECT 
    DATE_TRUNC(R.date,MONTH) AS month 
    , R.region_code
    , R.region_name 
    , SUM(R.new_total_confirmed_cases) AS total_case_increase 
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R 
WHERE 
    DATE(R.date) BETWEEN DATE('2021-07-01') AND DATE('2021-09-30')
GROUP BY 
   1,2,3
HAVING 
    SUM(R.new_total_confirmed_cases) > 10000
ORDER BY    
    3 ASC, 1 ASC;