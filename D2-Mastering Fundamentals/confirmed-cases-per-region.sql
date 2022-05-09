/*Show the total confirmed cases for each province in Veneto (5), for Nov 30, Dec 31, and Jan 31 only */

SELECT 
    P.date 
    , P.region_code 
    , P.name 
    , P.province_code
    , P.province_name 
    , P.confirmed_cases
FROM 
    `bigquery-public-data.covid19_italy.data_by_province` P 
WHERE 
    P.region_code = '5'
    AND (DATE(P.date) = DATE('2020-11-30') 
        OR DATE(P.date) = DATE('2020-12-31')
        OR DATE(P.date) = DATE('2021-01-31'));