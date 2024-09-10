# Exploratory Data Analysis Process

SELECT * 
FROM netflix_userbase_clean;

# 1. Revenue by Device Type

SELECT Device, SUM(Monthly_Revenue) AS Total_Revenue
FROM netflix_userbase_clean
GROUP BY Device
ORDER BY Total_Revenue DESC;

# 2. Revenue by Device Type and Age Group

SELECT Device,
       CASE
           WHEN Age BETWEEN 18 AND 24 THEN '18-24'
           WHEN Age BETWEEN 25 AND 34 THEN '25-34'
           WHEN Age BETWEEN 35 AND 44 THEN '35-44'
           WHEN Age BETWEEN 45 AND 54 THEN '45-54'
           WHEN Age BETWEEN 55 AND 64 THEN '55-64'
           ELSE '65+'
       END AS Age_Group,
       SUM(Monthly_Revenue) AS Total_Revenue
FROM netflix_userbase_clean
GROUP BY Device, Age_Group
ORDER BY Device, Total_Revenue DESC;

# 3. Revenue by Device Type and Gender

SELECT Device, Gender, SUM(Monthly_Revenue) AS Total_Revenue
FROM netflix_userbase_clean
GROUP BY Device, Gender
ORDER BY Device, Total_Revenue DESC;

# 4. Revenue by Device Type and Subscription Type

SELECT Device, Subscription_Type, SUM(Monthly_Revenue) AS Total_Revenue
FROM netflix_userbase_clean
GROUP BY Device, Subscription_Type
ORDER BY Device, Total_Revenue DESC;

# 5. Revenue by Device Type and Country

SELECT Device, Country, Total_Revenue
FROM (
    SELECT 
        Device, 
        Country, 
        SUM(Monthly_Revenue) AS Total_Revenue,
        ROW_NUMBER() OVER (PARTITION BY Device ORDER BY SUM(Monthly_Revenue) DESC) AS R
    FROM netflix_userbase_clean
    GROUP BY Device, Country
) AS RankedCountries
WHERE R <= 5
ORDER BY Device, Total_Revenue DESC;