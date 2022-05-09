/*How many distinct provinces per region are recorded? 
Show the code, name, and abbreviation per province as well as the region name  */
 
SELECT DISTINCT  
    P.province_code
    , P.province_name
    , P.province_abbreviation
    , P.name 
FROM 
    `bigquery-public-data.covid19_italy.data_by_province` P 