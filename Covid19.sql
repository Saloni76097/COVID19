SELECT * FROM CovidData

--FINDING SOLUTIONS TO THE FOLLOWINGS

--A.)Datewise Likelihood of dying due to covid- TotalCases Vs TotalDeath- in India and United States
--(INCLUDING NULL VALUES)

SELECT date,location,total_cases,total_deaths
FROM CovidData
WHERE location IN ('India', 'United States')

--(EXCLUDING NULL VALUES)

SELECT date,location,total_cases,total_deaths
FROM CovidData
WHERE location IN ('India', 'United States') AND total_cases IS NOT NULL AND total_deaths IS NOT NULL

--B.)Total percentage of deaths out of the entire population- in India and United States

FOR INDIA
SELECT MAX(CAST(total_deaths as int))/AVG(population) * 100 
FROM CovidData
WHERE location IN ('India')

FOR United States
SELECT MAX(CAST(total_deaths as int))/AVG(population) * 100 
FROM CovidData 
WHERE location IN ('United States')

--C.)Country with highest death as a % of population

SELECT location, MAX(CAST(total_deaths as int))/AVG(population) * 100 AS death_percentage
FROM CovidData 
GROUP BY location 
ORDER BY death_percentage DESC

--D.)Total percentage of positive cases in India And United States

--FOR INDIA
SELECT MAX(CAST(total_cases as int))/AVG(population) * 100 AS positive_percentage 
FROM CovidData
WHERE location IN ('India')

--FOR UNITED STATES
SELECT MAX(CAST(total_cases as int))/AVG(population) * 100 AS positive_percentage 
FROM CovidData
WHERE location IN ('United States')

--E.)Total percentage of positive cases in World

SELECT location, MAX(CAST(total_cases as int))/AVG(population) * 100 AS positive_percentage 
FROM CovidData 
GROUP BY location 
ORDER BY positive_percentage DESC

--F.)Continentwise positive cases

SELECT continent, MAX(CAST(total_cases AS int)) AS TOTAL_CASE
FROM CovidData 
GROUP BY continent 
ORDER BY TOTAL_CASE DESC

--G.)Continentwise Deaths

SELECT continent, MAX(CAST(total_deaths AS int)) AS TOTAL_DEATHS
FROM CovidData 
GROUP BY continent 
ORDER BY TOTAL_DEATHS DESC

--H.)Daily newcases vs hospitalizations vs icu_patients- India AND United States

--FOR India
SELECT date,new_cases,icu_patients,hosp_patients
FROM CovidData
WHERE location IN ('India')

--FOR United States
SELECT date,new_cases,icu_patients,hosp_patients
FROM CovidData
WHERE location IN ('United States')

--I.)Countrywise above 65 age person

SELECT date,location,aged_65_older
FROM CovidData
