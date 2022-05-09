/*From your answer in the previous question (i.e. using the same columns and conditions),
 which day and region registered the lowest case count? Adjust your query accordingly. */


SELECT 
    R.date 
    , R.region_code 
    , R.region_name 
    , R.new_current_confirmed_cases
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R
WHERE 
    R.region_name LIKE 'P%'
    AND (DATE(R.date) BETWEEN DATE('2021-01-01') AND DATE('2021-10-25')
    OR DATE(R.date) BETWEEN DATE('2020-01-01') AND DATE('2020-10-25'))
    AND new_current_confirmed_cases < 0 
ORDER BY 
    4 ASC 
LIMIT 1