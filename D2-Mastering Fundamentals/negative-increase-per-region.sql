/*Which days and regions had a negative increase in current confirmed cases? 
Consider only region names that start with the letter ‘P’, and 
January 01 – October 25 (2020 and 2021) only. Sort output by date */

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
    1 ASC