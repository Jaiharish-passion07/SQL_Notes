
	--👉SQL WINDOW FUNCTIONS👈--
	
	/* Intro:
		i) Window function or Analytic function is a function which uses values from one or multiple rows to return a value for each row. 
(This contrasts with an aggregate function, which returns a single value for multiple rows)
		ii) Window functions have an OVER clause; any function without an OVER clause is not a window function
		iii)But, unlike the aggregate functions, windowing functions do not collapse the result of the rows into a single value. 
Instead, all the rows maintain their original identity and the calculated result is returned for every row
*/

SELECT *
FROM air_bnb;

--💎General SQL Syntax for Window Function💎--

SELECT t1.host_id,t1.host_name,t1.neighbourhood_group,t1.room_type,
AVG(price) OVER() AS Avg_price
FROM air_bnb t1;

--💎General SQL Syntax for Window Function with Partition By clause💎--

/* Notes:
		i) It breaks up the rows into different partitions(Like Grouping Similar data) 
		ii)These partitions are then acted upon by the window function
*/

SELECT t1.host_id,t1.host_name,t1.neighbourhood_group,t1.room_type,
SUM(price) OVER(PARTITION BY neighbourhood_group) AS sum_price
FROM air_bnb t1;

--💎General SQL Syntax for Window Function with Order By clause💎--

/* Notes:
		i) To arrange rows within each partition like perform Ascending or Descending Order for Partition
*/

SELECT t1.host_id,t1.host_name,t1.neighbourhood_group,t1.room_type,t1.price,
SUM(price) OVER(PARTITION BY neighbourhood_group ORDER BY price DESC) AS sum_price
FROM air_bnb t1;

--Some common SQL Window Functions--

	--🎄ROW_NUMBER()🎄--

--🎆ROW_NUMBER without using Partition By🎆--

	/* Notes:
		i) It assigns a unique sequential number to each row of the table
*/
	
SELECT t1.host_id,t1.neighbourhood_group,t1.room_type,
ROW_NUMBER() OVER() AS RN_NUM
FROM air_bnb t1;

--🎆ROW_NUMBER with using Partition By🎆--

/* Notes:
		i) Since it is a window function, we can also limit it to partitions and then order those partitions
*/

SELECT t1.host_id,t1.neighbourhood_group,t1.room_type,
ROW_NUMBER() OVER(PARTITION BY room_type) AS RN_NUM
FROM air_bnb t1;

--🎆ROW_NUMBER with using Partition By and  Order By🎆--

SELECT t1.host_id,t1.neighbourhood_group,t1.room_type,
ROW_NUMBER() OVER(PARTITION BY room_type ORDER BY host_id) AS RN_NUM
FROM air_bnb t1;

	--🎄RANK()🎄--
	
/* Notes:
		i) It return the rank of each data based on some stmts
		ii)Rank will skip the rank value
*/

SELECT neighbourhood_group,room_type,price,
RANK() OVER(PARTITION BY neighbourhood_group ORDER BY price DESC) AS RNK
FROM air_bnb;

	--🎄DENSE_RANK()🎄--
	
/* Notes:
		i) It return the rank of each data based on some stmts
		ii)Dense Rank will not skip the rank value
*/

SELECT neighbourhood_group,room_type,price,
DENSE_RANK() OVER(PARTITION BY neighbourhood_group ORDER BY price DESC) AS DENSE_RNK
FROM air_bnb;

	--🎃^__Difference between Row_number,Rank and Dense_Rank__^🎃--

SELECT neighbourhood_group,room_type,price,
ROW_NUMBER() OVER(PARTITION BY neighbourhood_group ORDER BY price DESC) AS ROW_NUM,
RANK() OVER(PARTITION BY neighbourhood_group ORDER BY price DESC) AS RNK,
DENSE_RANK() OVER(PARTITION BY neighbourhood_group ORDER BY price DESC) AS DENSE_RNK
FROM air_bnb;

	--💎LEAD AND LAG()💎--

/* Notes:
		i) To compare the value of the current row to that of the preceding(previous) or succeeding(next) row. It helps in the easy analysis of the data
*/

	--🎄LAG()🎄--

SELECT neighbourhood_group,room_type,price AS current_row_price,
LAG(price) OVER(PARTITION BY neighbourhood_group ORDER BY price DESC) AS previous_row_price
FROM air_bnb;

	--🎄LEAD()🎄--

SELECT neighbourhood_group,room_type,price AS current_row_price,
LEAD(price) OVER(PARTITION BY neighbourhood_group ORDER BY price DESC) AS NEXT_row_price
FROM air_bnb;

--🎆lead and lag using Case Stmt🎆--

SELECT neighbourhood_group,room_type,price AS current_row_price,
LEAD(price,1) OVER(PARTITION BY neighbourhood_group) AS NEXT_row_price,
CASE 
	WHEN price > LEAD(price,1) OVER(PARTITION BY neighbourhood_group) THEN 'Greater_price'
	WHEN price < LEAD(price,1) OVER(PARTITION BY neighbourhood_group) THEN 'Lesser_price'
	WHEN price = LEAD(price,1) OVER(PARTITION BY neighbourhood_group) THEN 'Equal_price'
	ELSE 'No price'
END AS lead_price_case
FROM air_bnb;


	--🎄FIRST_VALUE()🎄--
	
/* Notes:
		Return the first value of record from each partition
*/

SELECT neighbourhood_group,room_type,price,
FIRST_VALUE(neighbourhood_group) OVER(PARTITION BY room_type ORDER BY price DESC) AS first_value_rec
FROM air_bnb;

--🎄LAST_VALUE()🎄--
	
/* Notes:
		i)Return the last value of record from each partition
		ii)While using Last value the Frame impact the expected results
		🌛We change the default frame stmt into user prefered stmt to get expected result🌜
		
*/
--💙💛What is Frame?💛💙--

/* Notes:
		i)We know that window function consists of each partition
		ii)A Frame is a subset of the current partition(Each record in a partition is a Frame or sub partition)
		🚩DEFAULT Frame is 🟢range between unbounded preceding and current row🟢  ➡It perform operation from starting position of record to current position of record for each frame(sub partition) of each partition
		🚩To get expected result for Last_value method Altered Frame is 🟢range between unbounded preceding and unbounded following🟢  ➡It perform operation from starting position of record to last position of record for each frame(sub partition) of each partition
*/


SELECT neighbourhood_group,room_type,price,
LAST_VALUE(neighbourhood_group) OVER(PARTITION BY room_type ORDER BY price DESC) AS last_value_rec
FROM air_bnb;

--🎆Query Example combine both first and last🎆--

SELECT neighbourhood_group,room_type,price,
FIRST_VALUE(neighbourhood_group) OVER(PARTITION BY room_type ORDER BY price DESC) AS first_value_rec,
LAST_VALUE(neighbourhood_group) OVER(PARTITION BY room_type ORDER BY price DESC range between unbounded preceding and unbounded following) AS last_value_rec
FROM air_bnb;

--🎆Alternate way of writing SQL queries🎆--

SELECT *,
FIRST_VALUE(product_name) OVER w AS most_exp_product,
LAST_VALUE(product_name) OVER w AS least_exp_product    
FROM product
WINDOW w as (PARTITION BY product_category ORDER BY price DESC
            range between unbounded preceding and unbounded following);

--🎄Nth_VALUE()🎄--

/* Notes:
		i)Return the nth value of record from each partition
		ii)While using nth value the Frame impact the expected results
		🌛We change the default frame stmt into user prefered stmt to get expected result🌜

*/

SELECT *,
FIRST_VALUE(product_name) OVER w AS most_exp_product,
LAST_VALUE(product_name) OVER w AS least_exp_product,
Nth_VALUE(product_name,2) OVER w AS sec_most_exp_product    
FROM product
WINDOW w as (PARTITION BY product_category ORDER BY price DESC
            range between unbounded preceding and unbounded following);
			
--🎄Ntile()🎄--

/* Notes:
		i)For each partition,it segregates into sub partition and group them into each bucket result
*/

SELECT product_category,
CASE WHEN abc.BUCKETS=1 THEN 'Expensive phones'
	 WHEN abc.BUCKETS=2 THEN 'Medium phones'
	 WHEN abc.BUCKETS=3 THEN 'Cheapest phones'
END phone_cate
FROM 
	(SELECT *,
	NTILE(3) OVER(ORDER BY PRICE DESC) AS BUCKETS
	FROM product
	WHERE  product_category='Phone') abc;


