# Data Cleaning Process

SELECT * 
FROM netflix_userbase;

# Rename Coloumns

ALTER TABLE netflix_userbase
RENAME COLUMN User ID TO User_ID,
RENAME COLUMN Subscription Type TO Subscription_Type,
RENAME COLUMN Monthly Revenue TO Monthly_Revenue, 
RENAME COLUMN Join Date TO Join_Date,
RENAME COLUMN Last Payment Date TO Last_Payment_Date,
RENAME COLUMN Plan Duration TO Plan_Duration;

# Change data types

ALTER TABLE netflix_userbase
MODIFY COLUMN Join_Date DATE,
MODIFY COLUMN Last_Payment_Date DATE;

ALTER TABLE netflix_userbase
MODIFY COLUMN Monthly_Revenue DECIMAL(10, 2);

# Removing Duplicates

SELECT User_ID, COUNT(User_ID)
FROM netflix_userbase
GROUP BY User_ID
HAVING COUNT(User_ID) > 1;