	
	--👉SQL AGGREGATION FUNCTIONS👈--
	
	/*
	i)COUNT
	ii)SUM
	iii)AVERAGE
	iv)MAX
	v)MIN
	*/
	
--🎄COUNT KEYWORD🎄--

/* Notes:
		i) While using with '*' it return the count of all rows if null included in the table
		ii) But While using with 'column_name' it return the count of that column rows by not include null in the table
*/


SELECT COUNT(*) AS toal_count
FROM store;

SELECT COUNT(customer_name) AS toal_count
FROM store;

--🎄SUM KEYWORD🎄--

/* Notes:
		i) It sum all values and NULL values are treated as Zero
*/

SELECT SUM(sales) AS sum_sales,
	   SUM(quantity) AS sum_quantity
FROM store;

--🎄AVERAGE KEYWORD🎄--

SELECT AVG(sales) AS avg_sales,
	   AVG(quantity) AS avg_quantity
FROM store;

--🎄MINIMUM KEYWORD🎄--

SELECT MIN(sales) AS min_sales,
	   MIN(quantity) AS min_quantity
FROM store;
		
		--✨Working with date using MIN method-->It return earliest date✨--
		
SELECT MIN(ship_date) AS early_ship_date,
       MIN(order_date) AS early_order_date
FROM store;

--🎄MAXIMUM KEYWORD🎄--

SELECT MAX(sales) AS max_sales,
	   MAX(quantity) AS max_quantity
FROM store;

	   --✨Working with date using MAX method-->It return last date✨--
		
SELECT MAX(ship_date) AS last_ship_date,
       MAX(order_date) AS last_order_date
FROM store;

	--👉SQL GROUPBY CLAUSE👈--
	
	/*Notes: 
			i)Group by Clause works with only Aggregation function
			ii)Group the values based on the column data*/
	
--🎆QUERY-1 EXAMPLE🎆--

SELECT SUM(sales) AS sum_sales,
	   SUM(quantity) AS sum_quantity,
	   states AS grouped_states
FROM store
GROUP BY states;

--🎆QUERY-2 EXAMPLE🎆--

SELECT AVG(sales) AS avg_sales,
	   AVG(quantity) AS avg_quantity,
	   states AS grouped_states
FROM store
GROUP BY states;

--👉SQL HAVING CLAUSE👈--
	
	/*Notes: 
			i)Filter the grouped results returned by Group by clause
			ii)Group the values based on the column data
			iii)HAVING Clause works only with GROUP BY Clause*/
	
	/*Important Notes: 
			i)WHERE Clause and HAVING Clause both are used to filter the data
			ii)Small difference is :
							a)WHERE clause filters rows before grouping take place
							b)HAVING clause filters rows after grouping take place
							*/
--🎆QUERY-1 EXAMPLE🎆--

SELECT SUM(sales) AS sum_sales,
	   SUM(quantity) AS sum_quantity,
	   states AS grouped_states
FROM store
GROUP BY states
HAVING SUM(sales)>=120;

--🎆QUERY-2 EXAMPLE🎆--

SELECT SUM(sales) AS sum_sales,
	   SUM(quantity) AS sum_quantity,
	   states AS grouped_states
FROM store
WHERE states NOT IN ('Oklahoma','North Carolina')
GROUP BY states
HAVING SUM(quantity)<=120;

--👉SQL HAVING CLAUSE👈--


	


