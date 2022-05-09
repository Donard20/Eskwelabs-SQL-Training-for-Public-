/*Get the daily positivity rate for each region. Show data only for October 20 – October 25,
 and order results by date then by region name. 
positivity rate = total cases/ total tests */

SELECT 
    R.date 
    , R.region_code
    , R.region_name 
    , R.total_confirmed_cases/R.tests_performed AS positivity_rate 
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R
WHERE 
    DATE(R.date) BETWEEN DATE('2020-10-20') AND DATE('2020-10-25')
ORDER BY 
    1 ASC, 3 ASC;