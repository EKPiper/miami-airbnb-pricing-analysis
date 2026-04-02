# Cleaned Remaining Data

ALTER TABLE miamidata
DROP COLUMN `Country`;

SELECT * FROM miamidata;
UPDATE miamidata
SET `Neighborhood` = CASE 
		WHEN `Neighborhood`= "" THEN NULL
		ELSE `Neighborhood` END,
	`Cancellation Policy` = CASE
		WHEN `Cancellation Policy`= "" THEN NULL
        ELSE `Cancellation Policy` END,
	`Cleaning Fee (USD)` = CASE
		WHEN `Cleaning Fee (USD)` = "" THEN NULL
        ELSE `Cleaning Fee (USD)` END,
	`Extra People Fee (USD)` = CASE
		WHEN `Extra People Fee (USD)` = "" THEN NULL
        ELSE `Extra People Fee (USD)` END,
	`Check-In Start` = CASE
		WHEN `Check-In Start` = "" THEN NULL
        ELSE `Check-In Start`END,
	`Check-In End` = CASE
		WHEN `Check-In End`= "" THEN NULL
        ELSE `Check-In End` END,
	`Checkout Time` = CASE
		WHEN `Checkout Time` = "" THEN NULL
        ELSE `Checkout Time` END, 
	`Pets Allowed` = CASE
		WHEN `Pets Allowed` = "" THEN NULL
        ELSE `Pets Allowed` END;
	
    
ALTER TABLE miamidata
RENAME COLUMN `Property Type` TO property_type,
RENAME COLUMN `Airbnb Location Rating` TO Airbnb_Location_Rating,
RENAME COLUMN `Average Daily Rate (USD)` TO Average_Daily_Rate_USD;
	
    
# Calculate Average Listing Price by Neighborhood
	SELECT * FROM miamidata;

	SELECT Neighborhood, 
		   ROUND(AVG(Average_Daily_Rate_USD),2) AS Avg_Price
	FROM miamidata
		WHERE Neighborhood IS NOT NULL
		GROUP BY Neighborhood
	HAVING COUNT(*) >= 10
	ORDER BY Avg_Price DESC;
		

# Top 10 Most Expensive Listings 
SELECT * FROM miamidata;

SELECT 
	   Neighborhood, 
       Average_Daily_Rate_USD, 
       Airbnb_Location_Rating
FROM miamidata
	WHERE Average_Daily_Rate_USD IS NOT NULL
	AND Neighborhood IS NOT NULL 
ORDER BY Average_Daily_Rate_USD DESC
Limit 10;


# Price vs. Rating
SELECT 
    Average_Daily_Rate_USD,
    Airbnb_Location_Rating
FROM miamidata
WHERE 
    Average_Daily_Rate_USD IS NOT NULL
    AND Airbnb_Location_Rating IS NOT NULL
    AND Airbnb_Location_Rating > 0
ORDER BY Average_Daily_Rate_USD DESC;
    
    





        
    
	
	
	
        
