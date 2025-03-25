select *
from international_debt;

--1.What is the total amount of debt owed by all countries in the dataset?

select (sum(debt)/1000000)::numeric(20,2) as total_amount
from international_debt;

--2.How many distinct countries are recorded in the dataset?

select count(distinct country_name)
from international_debt;

--3.What are the distinct types of debt indicators, and what do they represent?

select distinct(indicator_name)
from international_debt;


--4.Which country has the highest total debt, and how much does it owe?

SELECT country_name, SUM(debt) AS Max_Debt
FROM international_debt 
GROUP BY country_name 
ORDER BY Max_Debt DESC
LIMIT 1;

--5.What is the average debt across different debt indicators?

SELECT (AVG(debt)/1000000)::numeric(20,2) AS Avg_Debt_Millions, indicator_code
FROM dataanalytics.international_debt id 
GROUP BY id.indicator_code 
ORDER BY Avg_Debt_Millions DESC  ;

--6.Which country has made the highest amount of principal repayments?
SELECT (SUM(debt)/1000000)::numeric(20,2) AS Sum_of_Debt_Millions,country_name
FROM international_debt 
WHERE indicator_code = 'DT.AMT.DLXF.CD'
GROUP BY country_name 
ORDER BY Sum_of_Debt_Millions DESC
LIMIT 1;
--7.What is the most common debt indicator across all countries?

SELECT indicator_name, COUNT(*)
FROM dataanalytics.international_debt id 
GROUP BY indicator_name
ORDER BY count DESC ;
--8.Identify any other key debt trends and summarize your findings.
--How debt is distributed across different countries

SELECT country_name, SUM(debt)/1000000 AS total_debt_millions
FROM international_debt
GROUP BY country_name
ORDER BY total_debt_millions DESC;


