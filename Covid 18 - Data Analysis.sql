
--Import Covid File to SQL

-- Use SELECT to view the data

SELECT * FROM PortfolioProject..CovidDeath
WHERE continent is not null

SELECT location, date, total_cases, new_cases, total_cases, population 
FROM PortfolioProject..CovidDeath
WHERE continent is not null
ORDER BY location, date


-- Looking at Total Cases vs Total Deaths

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercetage 
FROM PortfolioProject..CovidDeath
WHERE continent is not null
ORDER BY location, date

-- Look for your country

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercetage 
FROM PortfolioProject..CovidDeath
WHERE location like 'Philippines'
ORDER BY location, date


-- Shows what percentahe of population
SELECT location, date, total_cases, population, (total_cases/population)*100 AS PercentPopulationInfected 
FROM PortfolioProject..CovidDeath
WHERE continent is not null
-- WHERE location like 'Philippines'
ORDER BY location, date



-- Looking at Countries with Highest Infection Rate compared to Population

SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeath
WHERE continent is not null
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC


-- Showing Countries with Highest Death Count per Population
-- Correcting MAX(Total_deaths) by using cast function

SELECT location, MAX(CAST(Total_deaths as int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeath
WHERE continent is not null
GROUP BY location
ORDER BY TotalDeathCount DESC


-- Let's break things down by continent
SELECT continent, MAX(CAST(Total_deaths as int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeath
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeathCount DESC


-- Let's break things down by location
SELECT location, MAX(CAST(Total_deaths as int)) AS TotalDeathCount
FROM PortfolioProject..CovidDeath
WHERE continent is null
GROUP BY location
ORDER BY TotalDeathCount DESC


-- Global Numbers
SELECT   SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS int)) AS total_deaths, SUM(CAST(new_deaths AS int))/SUM(new_cases)*100  AS DeathPercetage 
FROM PortfolioProject..CovidDeath
--WHERE location like 'Philippines'
WHERE continent is not null
--GROUP BY date
ORDER BY 1, 2



-- Joining Two Tables CovidDeaths & CovidVaccination
SELECT CD.continent
	, CD.location
	, CD.date
	, CD.population
	, CV.new_vaccinations 
	, SUM(CONVERT(bigint, CV.new_vaccinations)) OVER (Partition by CD.location Order by CD.location
		, CD.date) AS RollingPeopleVaccinated
	--, (RollingPeopleVaccinated
FROM PortfolioProject..CovidDeath CD
INNER JOIN PortfolioProject..CovidVaccination CV
ON CD.location = CV.location
AND CD.date=CV.date
WHERE CD.continent IS NOT NULL
ORDER BY 2,3


-- CTE 

With PopvsVac (Continent
				, Location
				, Date
				, Population
				, new_vaccinations 
				, RollingPeopleVaccinated)

AS 

(
SELECT CD.continent
	, CD.location
	, CD.date
	, CD.population
	, CV.new_vaccinations 
	, SUM(CONVERT(bigint, CV.new_vaccinations)) OVER (Partition by CD.location Order by CD.location
		, CD.date) AS RollingPeopleVaccinated
	--, (RollingPeopleVaccinated
FROM PortfolioProject..CovidDeath CD
INNER JOIN PortfolioProject..CovidVaccination CV
ON CD.location = CV.location
AND CD.date=CV.date
WHERE CD.continent IS NOT NULL
)

SELECT *, (RollingPeopleVaccinated/Population)*100 
FROM PopvsVac


-- TEMP TABLE
DROP TABLE IF EXISTS #PercentPopulationVaccinated

CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric, 
New_Vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated

SELECT CD.continent
	, CD.location
	, CD.date
	, CD.population
	, CV.new_vaccinations 
	, SUM(CONVERT(bigint, CV.new_vaccinations)) OVER (Partition by CD.location Order by CD.location
		, CD.date) AS RollingPeopleVaccinated
	--, (RollingPeopleVaccinated
FROM PortfolioProject..CovidDeath CD
INNER JOIN PortfolioProject..CovidVaccination CV
ON CD.location = CV.location
AND CD.date=CV.date
-- WHERE CD.continent IS NOT NULL


SELECT *, (RollingPeopleVaccinated/Population)*100 
FROM #PercentPopulationVaccinated



---- Creating view to store data for later visualizations

CREATE VIEW PercentPopulationVaccinated 
AS
SELECT CD.continent
	, CD.location
	, CD.date
	, CD.population
	, CV.new_vaccinations 
	, SUM(CONVERT(bigint, CV.new_vaccinations)) OVER (Partition by CD.location Order by CD.location
		, CD.date) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeath CD
INNER JOIN PortfolioProject..CovidVaccination CV
ON CD.location = CV.location
AND CD.date=CV.date
WHERE CD.continent IS NOT NULL


--- Final Query
SELECT * FROM PercentPopulationVaccinated
