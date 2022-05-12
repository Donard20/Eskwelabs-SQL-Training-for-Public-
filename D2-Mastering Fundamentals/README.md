<a href="https://github.com/Donard20" target="_blank"><img src="https://img.shields.io/badge/View-My%20Profile-informational?style=for-the-badge&logo=github"></a>   <a href="https://github.com/Donard20?tab=repositories" target="_blank"><img src="https://img.shields.io/badge/View-My%20Repositories-yellow?style=for-the-badge&logo=github"></a>   <a href="https://github.com/Donard20/Eskwelabs-SQL-Training-for-Public-" target="_blank"><img src="https://img.shields.io/badge/View-This%20Repository-green?style=for-the-badge&logo=github"></a>  <img src="https://img.shields.io/badge/View-LinkedIn-green?style=social&logo=linkedin"></a>

# 📜 Day 2 Training
<p align="center">
<img src="https://github.com/Donard20/Eskwelabs-SQL-Training-for-Public-/blob/main/IMG/D2.png" width=40% height=40%>

## 📖 Table Of Contents
* 🔥 [Aim for this lesson](#aim)
* 🗂️ [Dataset](#dataset)
* 🛠️ [Problem ](#problem-statement)
* 🚀 [Solutions](#solutions)

---

## 🔥 Aim for this lesson

> mastering the fundamentals of SQL and get familiarize in Google Big Query and  understanding the data.
 

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

1. Get the daily positivity rate for each region. Show data only for October 20 – October 25,
 and order results by date then by region name. 
positivity rate = total cases/ total tests
2. From your answer in 1 (i.e. using the same columns and conditions),
 which region and date registered the highest positivity rate? Adjust your query accordingly
3. Show the total confirmed cases for each province in Veneto (5), for Nov 30, Dec 31, and Jan 31 only 
4. Which day had the highest positivity rate in the month of December, for Toscana (9)
5. Which days registered the highest increase Consider 
 June 2020, October 2020, December 2020, and March 2021, 
 in Sicilia (19) and Basilicata (17) only.
6. Which days and regions had a negative increase in current confirmed cases? 
Consider only region names that start with the letter ‘P’, and 
January 01 – October 25 (2020 and 2021) only. Sort output by date
7. From your answer in the previous question (i.e. using the same columns and conditions),
 which day and region registered the lowest case count? Adjust your query accordingly. 


 <br />
  
<!-- https://www.tablesgenerator.com/markdown_tables -->
## 🚀 Solutions

### **Q1. Get the daily positivity rate for each region. Show data only for October 20 – October 25,
 and order results by date then by region name. 
positivity rate = total cases/ total tests**
```sql
SELECT 
    R.date 
    , R.region_code
    , R.region_name 
    , R.total_confirmed_cases/R.tests_performed AS positivity_rate 
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R
WHERE 
    DATE(R.date) BETWEEN DATE('2020-10-20') AND DATE('2020-10-25')
ORDER BY 
    1 ASC, 3 ASC;
``` 
  
| date                 | region_code | region_name           | positivity_rate      |
|----------------------|-------------|-----------------------|----------------------|
| 2020-10-20T17:00:00Z | 13          | Abruzzo               | 0.026130564842512756 |
| 2020-10-20T17:00:00Z | 17          | Basilicata            | 0.01456687671962368  |
| 2020-10-20T17:00:00Z | 18          | Calabria              | 0.012208487845076227 |
| 2020-10-20T17:00:00Z | 15          | Campania              | 0.036401562818801983 |
| 2020-10-20T17:00:00Z | 8           | Emilia-Romagna        | 0.029943430582631426 |
| 2020-10-20T17:00:00Z | 6           | Friuli Venezia Giulia | 0.013759128173867608 |
| 2020-10-20T17:00:00Z | 12          | Lazio                 | 0.022911772251026141 |

 
---

### **Q2. From your answer in 1 (i.e. using the same columns and conditions),
 which region and date registered the highest positivity rate? Adjust your query accordingly**
```sql
SELECT 
    R.date 
    , R.region_code
    , R.region_name 
    , R.total_confirmed_cases/R.tests_performed AS positivity_rate 
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R
WHERE 
    DATE(R.date) BETWEEN DATE('2021-10-20') AND DATE('2021-10-25')
ORDER BY 
    4 DESC 
LIMIT 1
``` 
  
| date                 | region_code | region_name | positivity_rate      |
|----------------------|-------------|-------------|----------------------|
| 2021-10-20T17:00:00Z | 11          | Marche      | 0.071956306616332011 |

---

### **Q3. Show the total confirmed cases for each province in Veneto (5), for Nov 30, Dec 31, and Jan 31 onlyy**
```sql
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
``` 
  
| date                 | region_code | name   | province_code | province_name                        | confirmed_cases |
|----------------------|-------------|--------|---------------|--------------------------------------|-----------------|
| 2020-11-30T17:00:00Z | 5           | Veneto | 899           | Fuori Regione / Provincia Autonoma   | 2461            |
| 2020-12-31T17:00:00Z | 5           | Veneto | 899           | Fuori Regione / Provincia Autonoma   | 3541            |
| 2021-01-31T17:00:00Z | 5           | Veneto | 899           | Fuori Regione / Provincia Autonoma   | 4199            |
| 2020-11-30T17:00:00Z | 5           | Veneto | 999           | In fase di definizione/aggiornamento | 358             |
| 2020-12-31T17:00:00Z | 5           | Veneto | 999           | In fase di definizione/aggiornamento | 548             |
| 2021-01-31T17:00:00Z | 5           | Veneto | 999           | In fase di definizione/aggiornamento | 597             |
| 2020-11-30T17:00:00Z | 5           | Veneto | 24            | Vicenza                              | 25962           |
| 2020-12-31T17:00:00Z | 5           | Veneto | 24            | Vicenza                              | 43116           |
| 2021-01-31T17:00:00Z | 5           | Veneto | 24            | Vicenza                              | 51279           |
 
 ---
 
### **Q4. Which day had the highest positivity rate in the month of December, for Toscana (9)**
```sql
SELECT 
    R.date 
    , R.region_code
    , R.region_name 
    , R.total_confirmed_cases/R.tests_performed AS positivity_rate
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R 
WHERE 
    DATE(R.date) BETWEEN DATE('2020-12-01') AND DATE('2020-12-31')
    AND R.region_code = '9'
ORDER BY 
    4 DESC 
LIMIT 
    1;
``` 
  
| date                 | region_code | region_name | positivity_rate    |
|----------------------|-------------|-------------|--------------------|
| 2020-12-01T17:00:00Z | 9           | Toscana     | 0.0659685717888808 |

 ---
 
### **Q5. Which days registered the highest increase Consider 
 June 2020, October 2020, December 2020, and March 2021, 
 in Sicilia (19) and Basilicata (17) only**
```sql
SELECT 
    R.date 
    , R.region_code
    , R.region_name 
    , R.new_current_confirmed_cases
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R 
WHERE 
    (DATE(R.date) BETWEEN DATE('2020-06-01') AND DATE('2020-06-30')
    OR DATE(R.date) BETWEEN DATE('2020-09-01') AND DATE('2020-09-30')
    OR DATE(R.date) BETWEEN DATE('2020-12-01') AND DATE('2020-12-31')
    OR DATE(R.date) BETWEEN DATE('2021-03-01') AND DATE('2021-03-31'))
    AND R.region_code IN ('17','19')
ORDER BY 
    4 DESC  
LIMIT 
    1
``` 
  
| date                 | region_code | region_name | new_current_confirmed_cases |
|----------------------|-------------|-------------|-----------------------------|
| 2021-03-31T17:00:00Z | 19          | Sicilia     | 1272                        |
 
 ---
 
### **Q6. Which days and regions had a negative increase in current confirmed cases? 
Consider only region names that start with the letter ‘P’, and 
January 01 – October 25 (2020 and 2021) only. Sort output by date **
```sql
SELECT 
    R.date 
    , R.region_code
    , R.region_name 
    , R.new_current_confirmed_cases
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R 
WHERE 
    (DATE(R.date) BETWEEN DATE('2020-06-01') AND DATE('2020-06-30')
    OR DATE(R.date) BETWEEN DATE('2020-09-01') AND DATE('2020-09-30')
    OR DATE(R.date) BETWEEN DATE('2020-12-01') AND DATE('2020-12-31')
    OR DATE(R.date) BETWEEN DATE('2021-03-01') AND DATE('2021-03-31'))
    AND R.region_code IN ('17','19')
ORDER BY 
    4 DESC  
LIMIT 
    1
``` 
| date                 | region_code | region_name  | new_current_confirmed_cases |
|----------------------|-------------|--------------|-----------------------------|
| 2020-02-27T18:00:00Z | 1           | Piemonte     | -1                          |
| 2020-03-09T18:00:00Z | 1           | Piemonte     | -18                         |
| 2020-04-01T17:00:00Z | 21          | P.A. Bolzano | -30                         |
| 2020-04-04T17:00:00Z | 21          | P.A. Bolzano | -8                          |
| 2020-04-08T17:00:00Z | 21          | P.A. Bolzano | -20                         |
| 2020-04-11T17:00:00Z | 21          | P.A. Bolzano | -48                         |
| 2020-04-13T17:00:00Z | 22          | P.A. Trento  | -2                          |

 ---
 
### **Q7. From your answer in the previous question (i.e. using the same columns and conditions),
 which day and region registered the lowest case count? Adjust your query accordingly. **
```sql
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
    4 ASC 
LIMIT 1 
``` 
| date                 | region_code | region_name  | new_current_confirmed_cases |
|----------------------|-------------|--------------|-----------------------------|
| 2021-01-31T17:00:00Z | 21          | P.A. Bolzano | -10713                      |
  
  
  
  
  
  
  
  
  
  
  
  

