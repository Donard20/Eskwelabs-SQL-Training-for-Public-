<a href="https://github.com/Donard20" target="_blank"><img src="https://img.shields.io/badge/View-My%20Profile-informational?style=for-the-badge&logo=github"></a>   <a href="https://github.com/Donard20?tab=repositories" target="_blank"><img src="https://img.shields.io/badge/View-My%20Repositories-yellow?style=for-the-badge&logo=github"></a>   <a href="https://github.com/Donard20/Eskwelabs-SQL-Training-for-Public-" target="_blank"><img src="https://img.shields.io/badge/View-This%20Repository-green?style=for-the-badge&logo=github"></a>  <img src="https://img.shields.io/badge/View-LinkedIn-green?style=social&logo=linkedin"></a>

# 📜 Introduction to SQL [Day 1 Training]
<p align="center">
<img src="https://github.com/Donard20/Eskwelabs-SQL-Training-for-Public-/blob/main/IMG/D1.png" width=40% height=40%>

## 📖 Table Of Contents
* 🔥 [Aim for this lesson](#aim)
* 🗂️ [Dataset](#dataset)
* 🛠️ [Problem ](#problem-statement)
* 🚀 [Solutions](#solutions)

---

## 🔥 Aim for this lesson

> To get familiarize in Google Big Query, understanding the data and creating our first query codes.
 

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

1. Show the total cumulative cases per day on a national level
2. How many distinct provinces per region are recorded? 
Show the code, name, and abbreviation per province as well as the region name
3. Show the increase in current cases per day, in region code = 6
4. How many distinct provinces per region are recorded? 
Show the code, name, and abbreviation per province as well as the region name ?

 <br />
  
<!-- https://www.tablesgenerator.com/markdown_tables -->
## 🚀 Solutions

### **Q1. Show the total cumulative cases per day on a national level**
```sql
SELECT  
    N.date 
    , N.total_confirmed_cases
FROM 
    `bigquery-public-data.covid19_italy.national_trends` N
``` 
  
| date                 | total_confirmed_cases |
|----------------------|-----------------------|
| 2021-11-19T17:00:00Z | 4904441               |
| 2021-11-20T17:00:00Z | 4915981               |
| 2020-10-28T17:00:00Z | 589766                |
| 2021-09-22T17:00:00Z | 4645853               |
| 2022-03-12T17:00:00Z | 13323128              |

 
---

### **Q2. How many distinct provinces per region are recorded? 
Show the code, name, and abbreviation per province as well as the region name**
```sql
SELECT DISTINCT  
    P.province_code
    , P.province_name
    , P.province_abbreviation
    , P.name 
FROM 
    `bigquery-public-data.covid19_italy.data_by_province` P
``` 
  
| province_code | province_name                        | province_abbreviation | name                  |
|---------------|--------------------------------------|-----------------------|-----------------------|
| 879           | Fuori Regione / Provincia Autonoma   |                       | Abruzzo               |
| 880           | Fuori Regione / Provincia Autonoma   |                       | Basilicata            |
| 881           | Fuori Regione / Provincia Autonoma   |                       | P.A. Bolzano          |
| 882           | Fuori Regione / Provincia Autonoma   |                       | Calabria              |
| 883           | Fuori Regione / Provincia Autonoma   |                       | Campania              |
| 884           | Fuori Regione / Provincia Autonoma   |                       | Emilia-Romagna        |
| 885           | Fuori Regione / Provincia Autonoma   |                       | Friuli Venezia Giulia |
| 886           | Fuori Regione / Provincia Autonoma   |                       | Lazio                 |

---

### **Q3. Show the positivity rate and fatality rate for each day, on a national level.
 Take note that positivity rate = total cases/total performed,
  while  fatality rate = total deaths/total cases**
```sql
SELECT 
    N.date 
    , N.total_confirmed_cases
    , N.tests_performed
    , N.deaths
    , N.total_confirmed_cases/N.tests_performed AS positivity_rate 
    , N.deaths/N.total_confirmed_cases AS fatality_rate 
FROM 
    `bigquery-public-data.covid19_italy.national_trends` N
```   
| date                 | region_code | region_name           | new_current_confirmed_cases |
|----------------------|-------------|-----------------------|-----------------------------|
| 2020-02-24T18:00:00Z | 6           | Friuli Venezia Giulia | 0                           |
| 2020-02-25T18:00:00Z | 6           | Friuli Venezia Giulia | 0                           |
| 2020-02-26T18:00:00Z | 6           | Friuli Venezia Giulia | 0                           |
| 2020-02-27T18:00:00Z | 6           | Friuli Venezia Giulia | 0                           |
| 2020-02-28T18:00:00Z | 6           | Friuli Venezia Giulia | 0                           |
| 2020-02-29T17:00:00Z | 6           | Friuli Venezia Giulia | 0                           |  
  
---

### **Q4. Show the increase in current cases per day, in region code = 6**
```sql
SELECT 
    R.date 
    , R.region_code
    , R.region_name 
    , R.new_current_confirmed_cases
FROM 
    `bigquery-public-data.covid19_italy.data_by_region` R
WHERE 
    R.region_code = '6'
```  
| date                 | total_confirmed_cases | tests_performed | deaths | positivity_rate      | fatality_rate         |
|----------------------|-----------------------|-----------------|--------|----------------------|-----------------------|
| 2021-11-19T17:00:00Z | 4904441               | 113437819       | 133082 | 0.043234620016804094 | 0.027134998667534181  |
| 2021-11-20T17:00:00Z | 4915981               | 114012631       | 133131 | 0.043117862967305791 | 0.027081268214828331  |
| 2020-10-28T17:00:00Z | 589766                | 15152038        | 37905  | 0.038923212837771393 | 0.064271253344546822  |
| 2021-09-22T17:00:00Z | 4645853               | 90166078        | 130488 | 0.051525508295924768 | 0.028086984241645182  |
| 2022-03-12T17:00:00Z | 13323128              | 192230588       | 156782 | 0.069308054137565245 | 0.011767656964640737  |
| 2021-04-11T17:00:00Z | 3769814               | 53054866        | 114254 | 0.071055009355786514 | 0.030307596077684469  |
| 2021-08-03T17:00:00Z | 4363374               | 78004897        | 128115 | 0.0559371804567603   | 0.029361452857353049  |
| 2020-10-13T17:00:00Z | 365467                | 12762699        | 36246  | 0.028635557416186029 | 0.0991772170948403    |
| 2020-05-10T17:00:00Z | 219070                | 2565912         | 30560  | 0.08537705112256383  | 0.13949879034098689   |

---


  
  
  
  
  
  
  
  
  
  
  
  

