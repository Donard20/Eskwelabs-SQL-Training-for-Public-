<a href="https://github.com/Donard20" target="_blank"><img src="https://img.shields.io/badge/View-My%20Profile-informational?style=for-the-badge&logo=github"></a>   <a href="https://github.com/Donard20?tab=repositories" target="_blank"><img src="https://img.shields.io/badge/View-My%20Repositories-yellow?style=for-the-badge&logo=github"></a>   <a href="https://github.com/Donard20/Eskwelabs-SQL-Training-for-Public-" target="_blank"><img src="https://img.shields.io/badge/View-This%20Repository-green?style=for-the-badge&logo=github"></a>  <img src="https://img.shields.io/badge/View-LinkedIn-green?style=social&logo=linkedin"></a>

# 📜 Aggregate Functions [Day 3 Training]
<p align="center">
<img src="https://github.com/Donard20/Eskwelabs-SQL-Training-for-Public-/blob/main/IMG/D3.png" width=40% height=40%>

## 📖 Table Of Contents
* 🔥 [Aim for this lesson](#aim)
* 🗂️ [Dataset](#dataset)
* 🛠️ [Problem ](#problem-statement)
* 🚀 [Solutions](#solutions)

---

## 🔥 Aim for this lesson

> Fundamental training using Aggregates in SQL and troubleshoot challenges.
 

---

  ## 🗂️ Dataset
 
### **```bigquery-public-data.covid19_italy.national_trends```**

<details>
<summary>
View table
</summary>
<p align="center">
<img src="https://github.com/Donard20/Eskwelabs-SQL-Training-for-Public-/blob/main/IMG/national_trend.png" width=50% height=50%>


 </details>
  
  ### **```bigquery-public-data.covid19_italy.data_by_region```**

<details>
<summary>
View table
</summary>
<p align="center">
<img src="https://github.com/Donard20/Eskwelabs-SQL-Training-for-Public-/blob/main/IMG/data_region.png" width=50% height=50%>


 </details>
  
  
   ### **```bigquery-public-data.covid19_italy.data_by_province```**

<details>
<summary>
View table
</summary>
<p align="center">
<img src="https://github.com/Donard20/Eskwelabs-SQL-Training-for-Public-/blob/main/IMG/data_prov.png" width=50% height=50%>


 </details>

## 🛠️ [Problem ](#problem-statement)

1. What is the first and latest date recorded? Show both in one query.  
2. What is the national average total current cases across all dates?
3. Show the average total current cases per month? Sort results per month, ascending 
Note: you can aggregate on the whole month by using DATE_TRUNC([date or timestamp column], PART).
 For ex: DATE_TRUNC(date, MONTH) will return the first day of the month for each date in the column. 
4. Based on the previous question, which months registered 
more an average of more than 100000 current cases?
 Sort results by date ascending.
5. Show the monthly increase of cases per regions per months of July 2021 to September 2021.
 Sort results by region name, then by date.
6. From the previous question, which regions and month registered an increase of more than 10000? 
7. Which regions have an average fatality rate of less than 5%? 
Consider only days where total cases > 0, and sort results from highest fatality rate to lowest.
8. Which province names have more than 1 unique code assigned to them?  
HINT: you can use COUNT(DISTINCT()) to count only distinct values.
9. Which regions had more than 10 days with a case increase > 2500?  
Sort results showing the highest day-count first.


 <br />
  
<!-- https://www.tablesgenerator.com/markdown_tables -->
## 🚀 Solutions
 

### **Q1. What is the first and latest date recorded? Show both in one query.**
```sql
SELECT 
    MIN(N.date) AS min_date 
    , MAX(N.date) AS max_date 
FROM  
    `bigquery-public-data.covid19_italy.national_trends` N
``` 
 
| min_date             | max_date             |
|----------------------|----------------------|
| 2020-02-24T18:00:00Z | 2022-05-11T17:00:00Z |

 ---
  
 ### **Q2. What is the national average total current cases across all dates?.**
```sql
SELECT 
    AVG(N.total_current_confirmed_cases) AS avg_current_cases 
FROM 
    `bigquery-public-data.covid19_italy.national_trends` N
``` 
 
| avg_current_cases |
|-------------------|
| 437657.1992574262 |
  
 ---
  
 ### **Q3. Show the average total current cases per month? Sort results per month, ascending Note: you can aggregate on the whole month by using DATE_TRUNC([date or timestamp column], PART).For ex: DATE_TRUNC(date, MONTH) will return the first day of the month for each date in the column.**
```sql
SELECT 
    DATE_TRUNC(N.date, MONTH) AS month 
    , AVG(N.total_current_confirmed_cases) AS avg_current_cases 
FROM 
    `bigquery-public-data.covid19_italy.national_trends` N 
GROUP BY 
    1 
ORDER BY 
    1 ASC 
``` 
 
| month                | avg_current_cases  |
|----------------------|--------------------|
| 2020-02-01T00:00:00Z | 562.5              |
| 2020-03-01T00:00:00Z | 30515.967741935496 |
| 2020-04-01T00:00:00Z | 100594.49999999999 |
| 2020-05-01T00:00:00Z | 72097.741935483864 |
| 2020-06-01T00:00:00Z | 26713.966666666667 |
| 2020-07-01T00:00:00Z | 13155.709677419354 |
  
 ---
  
 ### **Q4. Based on the previous question, which months registered  more an average of more than 100000 current cases? Sort results by date ascending.**
```sql
SELECT 
    DATE_TRUNC(N.date, MONTH) AS month 
    , AVG(N.total_current_confirmed_cases) AS avg_current_cases 
FROM 
    `bigquery-public-data.covid19_italy.national_trends` N 
GROUP BY 
    1 
HAVING 
    AVG(N.total_current_confirmed_cases) > 100000
ORDER BY 
    1 ASC 
``` 
 
| month                | avg_current_cases  |
|----------------------|--------------------|
| 2020-04-01T00:00:00Z | 100594.49999999999 |
| 2020-10-01T00:00:00Z | 140673.38709677424 |
| 2020-11-01T00:00:00Z | 661696.16666666651 |
| 2020-12-01T00:00:00Z | 659546.16129032255 | 
  
 ---
  
 ### **Q5. Show the monthly increase of cases per regions per months of July 2021 to September 2021. Sort results by region name, then by date**
```sql
SELECT 
    DATE_TRUNC(R.date,MONTH) AS month 
    , R.region_code
    , R.region_name 
    , SUM(R.new_total_confirmed_cases) AS total_case_increase 
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R 
WHERE 
    DATE(R.date) BETWEEN DATE('2021-07-01') AND DATE('2021-09-30')
GROUP BY 
   1,2,3
ORDER BY    
    3 ASC, 1 ASC;
``` 
 
| month                | region_code | region_name           | total_case_increase |
|----------------------|-------------|-----------------------|---------------------|
| 2021-07-01T00:00:00Z | 13          | Abruzzo               | 1403                |
| 2021-08-01T00:00:00Z | 13          | Abruzzo               | 2848                |
| 2021-09-01T00:00:00Z | 13          | Abruzzo               | 2196                |
| 2021-07-01T00:00:00Z | 17          | Basilicata            | 452                 | 
  
 ---
  
 ### **Q6. From the previous question, which regions and month registered an increase of more than 10000?**
```sql
SELECT 
    DATE_TRUNC(R.date,MONTH) AS month 
    , R.region_code
    , R.region_name 
    , SUM(R.new_total_confirmed_cases) AS total_case_increase 
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R 
WHERE 
    DATE(R.date) BETWEEN DATE('2021-07-01') AND DATE('2021-09-30')
GROUP BY 
   1,2,3
HAVING 
    SUM(R.new_total_confirmed_cases) > 10000
ORDER BY    
    3 ASC, 1 ASC;
``` 
 
| month                | region_code | region_name    | total_case_increase |
|----------------------|-------------|----------------|---------------------|
| 2021-08-01T00:00:00Z | 15          | Campania       | 14714               |
| 2021-09-01T00:00:00Z | 15          | Campania       | 10629               |
| 2021-08-01T00:00:00Z | 8           | Emilia-Romagna | 17719               |
| 2021-09-01T00:00:00Z | 8           | Emilia-Romagna | 11946               |
  
 ---
  
 ### **Q7. Which regions have an average fatality rate of less than 5%? Consider only days where total cases > 0, and sort results from highest fatality rate to lowest.**
```sql
SELECT 
    R.region_code
    , R.region_name 
    , AVG(R.deaths/R.total_confirmed_cases) AS avg_fatality_rate 
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R 
WHERE 
    total_confirmed_cases > 0 
GROUP BY 
    1,2
HAVING 
    AVG(R.deaths/R.total_confirmed_cases) <0.05
ORDER BY 
    3 DESC
``` 
 
| region_code | region_name           | avg_fatality_rate    |
|-------------|-----------------------|----------------------|
| 6           | Friuli Venezia Giulia | 0.046033040270443748 |
| 16          | Puglia                | 0.043807876211410975 |
| 22          | P.A. Trento           | 0.043229144727641972 |
| 9           | Toscana               | 0.040851276546268377 |
  
 ---
  
 ### **Q8. Which province names have more than 1 unique code assigned to them?  HINT: you can use COUNT(DISTINCT()) to count only distinct values**
```sql
SELECT 
    P.province_name 
    , COUNT(DISTINCT(P.province_code)) AS count 
FROM 
    `bigquery-public-data.covid19_italy.data_by_province` P 
GROUP BY 
    1 
HAVING 
    COUNT(DISTINCT(P.province_code)) > 1
``` 
 
| province_name                        | count |
|--------------------------------------|-------|
| Fuori Regione / Provincia Autonoma   | 21    |
| In fase di definizione/aggiornamento | 21    | 
  
 ---
  
 ### **Q9. Which regions had more than 10 days with a case increase > 2500?  Sort results showing the highest day-count first**
```sql
SELECT 
    R.region_code 
    , R.region_name 
    , COUNT(DISTINCT(R.date)) AS days 
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R
WHERE 
    R.new_total_confirmed_cases > 2500
GROUP BY 
    1,2 
HAVING 
    COUNT(DISTINCT(R.date)) > 10
ORDER BY 
    3 DESC 
``` 
 
| region_code | region_name           | days |
|-------------|-----------------------|------|
| 3           | Lombardia             | 260  |
| 5           | Veneto                | 204  |
| 15          | Campania              | 178  |
| 12          | Lazio                 | 150  |
| 8           | Emilia-Romagna        | 145  | 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

