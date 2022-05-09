/*Which province names have more than 1 unique code assigned to them?  
HINT: you can use COUNT(DISTINCT()) to count only distinct values 
*/

SELECT 
    P.province_name 
    , COUNT(DISTINCT(P.province_code)) AS count 
FROM 
    `bigquery-public-data.covid19_italy.data_by_province` P 
GROUP BY 
    1 
HAVING 
    COUNT(DISTINCT(P.province_code)) > 1