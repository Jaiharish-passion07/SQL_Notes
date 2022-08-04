--🎄Dislay Date  ISO Format🎄--

SHOW Datestyle;

--🎄Create Table Air_bnb🎄--

CREATE TABLE Air_bnb(
	id INTEGER PRIMARY KEY,
	name TEXT,
	host_id INTEGER,
	host_name TEXT,
	neighbourhood_group TEXT,
	neighbourhood TEXT,
	latitude NUMERIC,
	longitude NUMERIC,
	room_type TEXT,
	price NUMERIC,
	minimum_nights NUMERIC,
	number_of_reviews NUMERIC,
	last_review DATE,
	reviews_per_month NUMERIC,
	calculated_host_listings_count NUMERIC,
	availability_365 NUMERIC
);

--🎄Copying airbnb data from os path and Importing into table 'Air_bnb'🎄 --

COPY Air_bnb FROM 'J:\Airbnb NYC 2019.csv' WITH CSV HEADER;

--🎄Selecting  all columns🎄--

SELECT * FROM air_bnb;

--🎄Datatypes all columns🎄--

SELECT COLUMN_NAME,DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME   = 'air_bnb';

--🎄Counting Null values of each columns🎄--

CREATE VIEW null_values_each_clomn AS
SELECT 
SUM(CASE  
	WHEN (id ISNULL) THEN 1
	ELSE 0
END) AS id_,
SUM(CASE 
	WHEN (name ISNULL) THEN 1
	ELSE 0
END) AS name_,
SUM(CASE 
	WHEN  (host_id ISNULL)THEN 1
	ELSE 0
END) AS host_id_,
SUM(CASE  
	WHEN (host_name ISNULL) THEN 1
	ELSE 0
END) AS host_name_,
SUM(CASE 
	WHEN (neighbourhood_group ISNULL) THEN 1
	ELSE 0
END) AS neighbourhood_group,
SUM(CASE 
	WHEN  (neighbourhood ISNULL)THEN 1
	ELSE 0
END) AS neighbourhood_,
SUM(CASE  
	WHEN (latitude ISNULL) THEN 1
	ELSE 0
END) AS latitude_,
SUM(CASE 
	WHEN (longitude ISNULL) THEN 1
	ELSE 0
END) AS longitude_,
SUM(CASE 
	WHEN  (room_type ISNULL)THEN 1
	ELSE 0
END) AS room_type_,
SUM(CASE  
	WHEN (price ISNULL) THEN 1
	ELSE 0
END) AS price_,
SUM(CASE 
	WHEN (minimum_nights ISNULL) THEN 1
	ELSE 0
END) AS minimum_nights_,
SUM(CASE 
	WHEN  (number_of_reviews ISNULL)THEN 1
	ELSE 0
END) AS number_of_reviews_,
SUM(CASE 
	WHEN (last_review ISNULL) THEN 1
	ELSE 0
END) AS last_review_,
SUM(CASE 
	WHEN  (reviews_per_month ISNULL)THEN 1
	ELSE 0
END) AS reviews_per_month_,
SUM(CASE 
	WHEN (calculated_host_listings_count ISNULL) THEN 1
	ELSE 0
END) AS calculated_host_listings_count_,
SUM(CASE 
	WHEN  (availability_365 ISNULL)THEN 1
	ELSE 0
END) AS availability_365_
FROM air_bnb;

--Retriving count of null_values--

SELECT *
FROM null_values_each_clomn;