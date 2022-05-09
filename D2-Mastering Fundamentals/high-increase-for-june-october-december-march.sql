/*Which days registered the highest increase Consider 
 June 2020, October 2020, December 2020, and March 2021, 
 in Sicilia (19) and Basilicata (17) only.*/


SELECT 
    R.date 
    , R.region_code
    , R.region_name 
    , R.new_current_confirmed_cases
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R 
WHERE 
(DATE(R.date) BETWEEN DATE('2020-06-01') AND DATE('2020-06-30')
    OR DATE(R.date) DATE('2020-09-01') AND DATE('2020-09-30')
    OR DATE(R.date) DATE('2020-12-01') AND DATE('2020-12-31')
    OR DATE(R.date) DATE('2021-03-01') AND DATE('2021-03-31'))
    AND (R.region_code IN ('17','19'))
ORDER BY 
    4 DESC 
LIMIT 
    1;