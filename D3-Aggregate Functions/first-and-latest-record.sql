/*What is the first and latest date recorded? Show both in one query.  */

SELECT 
    MIN(N.date) AS min_date 
    , MAX(N.date) AS max_date 
FROM  
    `bigquery-public-data.covid19_italy.national_trends` N