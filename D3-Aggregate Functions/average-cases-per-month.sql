/*Show the average total current cases per month? Sort results per month, ascending 
Note: you can aggregate on the whole month by using DATE_TRUNC([date or timestamp column], PART).
 For ex: DATE_TRUNC(date, MONTH) will return the first day of the month for each date in the column. 
*/

SELECT 
    DATE_TRUNC(N.date, MONTH) AS month 
    , AVG(N.total_current_confirmed_cases) AS avg_current_cases 
FROM 
    `bigquery-public-data.covid19_italy.national_trends` N 
GROUP BY 
    1 
ORDER BY 
    1 ASC 