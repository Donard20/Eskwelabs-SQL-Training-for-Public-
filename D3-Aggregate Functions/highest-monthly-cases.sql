/*Which regions and months registered the highest monthly total increase in cases? 
Consider only regions 1,6,8,10, and 15. Also only show months where avg recovery rate is > 0.9 
(recovery rate = total recovered/total cases). */

SELECT 
    DATE_TRUNC(R.date, MONTH) AS month  
    , R.region_code 
    , R.region_name 
    , AVG(R.recovered/R.total_confirmed_cases) As recovery_rate 
    , SUM(R.new_total_confirmed_cases) AS total_increase 
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R 
WHERE 
    region_code IN ('1','6','8','10','15')
GROUP BY 
    1,2,3 
HAVING 
    AVG(R.recovered/R.total_confirmed_cases) > 0.9