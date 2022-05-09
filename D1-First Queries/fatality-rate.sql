/*Show the positivity rate and fatality rate for each day, on a national level.
 Take note that positivity rate = total cases/total performed,
  while  fatality rate = total deaths/total cases */

SELECT 
    N.date 
    , N.total_confirmed_cases
    , N.tests_performed
    , N.deaths
    , N.total_confirmed_cases/N.tests_performed AS positivity_rate 
    , N.deaths/N.total_confirmed_cases AS fatality_rate 
FROM 
    `bigquery-public-data.covid19_italy.national_trends` N