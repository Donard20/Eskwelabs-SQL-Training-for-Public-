/*Show the increase in current cases per day, in region code = 6*/

SELECT 
    R.date 
    , R.region_code
    , R.region_name 
    , R.new_current_confirmed_cases
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R
WHERE 
    R.region_code = '6