/*Show the total cumulative cases per day on a national level */

SELECT  
    N.date 
    , N.total_confirmed_cases
FROM 
    `bigquery-public-data.covid19_italy.national_trends` N