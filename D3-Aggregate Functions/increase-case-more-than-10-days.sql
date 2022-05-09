/*Which regions had more than 10 days with a case increase > 2500?  
Sort results showing the highest day-count first */



SELECT 
    R.region_code 
    , R.region_name 
    , COUNT(DISTINCT(R.date)) AS days 
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R
WHERE 
    R.new_total_confirmed_cases > 2500
GROUP BY 
    1,2 
HAVING 
    COUNT(DISTINCT(R.date)) > 10
ORDER BY 
    3 DESC