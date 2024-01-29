use vid;

SELECT * 
FROM vid
 WHERE Publisher = 'Nintendo';
 
select*
from vid
where JP_Sales>4 AND Name LIKE 'n%';

select*
from vid
WHERE Global_Sales=(Select MIN(Global_Sales)
From vid);

SELECT Name, Global_Sales,
    CASE
        WHEN Global_Sales >= 50 THEN 'Blockbuster'
        WHEN Global_Sales >= 20 AND Global_Sales < 50 THEN 'Hit'
        WHEN Global_Sales >= 10 AND Global_Sales < 20 THEN 'Moderate'
        ELSE 'Low'
    END AS SalesCategory
FROM vid;

SELECT Name, Genre,
    CASE
        WHEN Genre IN ('Sports', 'Racing', 'Misc') THEN 'Popular Genre'
        WHEN Genre IN ('Platform', 'Puzzle', 'Simulation') THEN 'Classic Genre'
        ELSE 'Other Genre'
    END AS GenreCategory
FROM vid;

SELECT Publisher, SUM(Global_Sales) AS TotalSales
FROM vid
GROUP BY Publisher
ORDER BY TotalSales DESC
LIMIT 3;

SELECT Name, 
CASE 
         WHEN NA_Sales = (SELECT MAX(NA_Sales) FROM vid) THEN 'NA'
         WHEN EU_Sales = (SELECT MAX(EU_Sales) FROM vid) THEN 'EU'
         WHEN JP_Sales = (SELECT MAX(JP_Sales) FROM vid) THEN 'JP'
         WHEN Other_Sales = (SELECT MAX(Other_Sales) FROM vid) THEN 'Other'
       END AS Region_With_Highest_Sales
FROM vid;

SELECT Genre, SUM(Global_Sales) AS TotalSales
FROM vid
WHERE Year = 2000
GROUP BY Genre
ORDER BY TotalSales DESC;

SELECT Platform, COUNT(*) AS NumGames
FROM vid
GROUP BY Platform
ORDER BY NumGames DESC
LIMIT 1;

SELECT Publisher, SUM(NA_Sales + EU_Sales) AS TotalSales
FROM vid
GROUP BY Publisher
ORDER BY TotalSales DESC;

SELECT Year, SUM(Global_Sales) AS TotalSales
FROM vid
GROUP BY Year
ORDER BY TotalSales DESC
LIMIT 1;

SELECT Publisher
FROM vid
WHERE Platform IN ('Wii', 'DS')
GROUP BY Publisher
HAVING COUNT(DISTINCT Platform) = 2;

SELECT Name, Global_Sales
FROM vid
WHERE Year BETWEEN 1990 AND 1999 AND Global_Sales > 15;

SELECT Year, Name, Global_Sales
FROM vid
WHERE (Year, Global_Sales) IN (SELECT Year, MAX(Global_Sales) FROM vid GROUP BY Year);

SELECT Name, Global_Sales,
       CASE 
         WHEN Global_Sales <= 10 THEN 'Low'
         WHEN Global_Sales > 10 AND Global_Sales <= 50 THEN 'Medium'
         ELSE 'High'
       END AS SalesBracket
FROM vid;

SELECT Name, Year,
       CASE 
         WHEN Year BETWEEN 1980 AND 1989 THEN '1980s'
         WHEN Year BETWEEN 1990 AND 1999 THEN '1990s'
         WHEN Year BETWEEN 2000 AND 2009 THEN '2000s'
         WHEN Year >= 2010 THEN '2010s'
         ELSE 'Unknown'
       END AS ReleaseDecade
FROM vid;

SELECT Name
FROM vid
WHERE Name LIKE '%Mario%' AND Name LIKE '%Kart%';

SELECT Name
FROM vid
WHERE Name LIKE '[0-9]%';

SELECT Name, Platform,
       CASE 
         WHEN Platform = 'Wii' THEN 'Wii'
         WHEN Platform = 'DS' THEN 'DS'
         ELSE 'Other'
       END AS PlatformCategory
FROM vid;

SELECT Name, NA_Sales, EU_Sales, JP_Sales, Other_Sales,
       CASE
         WHEN NA_Sales > EU_Sales AND NA_Sales > JP_Sales AND NA_Sales > Other_Sales THEN 'North America'
         WHEN EU_Sales > NA_Sales AND EU_Sales > JP_Sales AND EU_Sales > Other_Sales THEN 'Europe'
         WHEN JP_Sales > NA_Sales AND JP_Sales > EU_Sales AND JP_Sales > Other_Sales THEN 'Japan'
         ELSE 'Other'
       END AS DominantRegion
FROM vid;

SELECT Name, Global_Sales,
       CASE
         WHEN Global_Sales > 50 THEN 'Popular'
         ELSE 'Average'
       END AS SalesCategory
FROM vid;
















