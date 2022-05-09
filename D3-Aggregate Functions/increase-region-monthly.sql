/*Show the monthly increase of cases per regions per months of July 2021 to September 2021.
 Sort results by region name, then by date. */


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
ORDER BY    
    3 ASC, 1 ASC;