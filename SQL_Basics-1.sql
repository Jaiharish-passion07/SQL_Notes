   --👉✨SQL ORDER✨👈:

/*
	     🌻SELECT🌻
		  |
		  👇
	      🌻FROM🌻
		  |
		  👇
	      🌻JOIN🌻
		  |
		  👇
	      🌻WHERE🌻
		  |
		  👇
	     🌻GROUP BY🌻
		  |
		  👇
	     🌻HAVING🌻
		  |
		  👇
	     🌻ORDERBY🌻
		  |
		  👇
	      🌻LIMIT🌻

*/

--👉Some Statements👈:

/*
1)CLAUSE->Perform Some Action
2)KEYWORDS->Built-in words
3)IDENTIFIERS->To describe about table(Column name,table name or database name)
*/

/*👉Three Golden Rules:👈

	1)Add New line for each keyword
	2)Use Uppercase for each keyword
	3)Add white space */
	
	
	--👉SELECT Clause👈--

/*  1) It retrieve all data or specific column from the table 
	2)*->represents all column or data */

--✨Select all column✨--
SELECT *  
FROM store;

--✨Select specific column✨--
SELECT customer_id,
	   customer_name,
	   country 
FROM store;

	--👉DISTINCT Clause👈--
	
/*  1)It fetch unique data from results
	2)Select statemetns doesn't remove any duplicate data from results*/

SELECT DISTINCT 
	customer_name,
	city
FROM store;

	--👉ORDERBY Clause👈--
	
/*  1)It sort the results by Ascending or Descending order */

--✨ASCENDING ORDER✨--
SELECT customer_name,
	 city
FROM store
ORDER BY city ASC;

--✨DESCENDING ORDER✨--
SELECT customer_name,
	 city
FROM store
ORDER BY city DESC;

--✨COMBINIG BOTH ASC AND DESC ORDER✨--
SELECT customer_name,
	 city,
	 sales
FROM store
ORDER BY city ASC, sales DESC;

--👉WHERE Clause👈--
	
/*  1)It filters the data based on some specific condition */

SELECT customer_id,
	   customer_name 
FROM store
WHERE states != 'California';

--✨WHERE OPERATORS✨--

	--🎆COMPARISION OPERTOR🎆--
				/*
				=        ---> Equal to
				!= OR <> ---> Not Equal to
				>=       ---> Greater than or Equal to
				<=       ---> Lesser than or Equal to
				>        ---> Greater than
				<        ---> Lesser than
				*/
	--🎆LOGICAL OPERTOR🎆--
				/*
				AND     ---> Return True if both conditions are true
				OR      ---> Return True if one of conditions are true
				NOT     ---> Reverse the results
				IN      ---> Return True if value is in a set of value
				BETWEEN ---> Return True if value fall within a specific range(specify min_value and max_value)
				LIKE    ---> Return True if value matches a pattern
				*/
	
--🎄BETWEEN operator🎄--

SELECT customer_id,
	   customer_name 
FROM store
WHERE sales BETWEEN 20 AND 50;

--🎄IN operator🎄--

SELECT customer_id,
	   customer_name,
	   segment
FROM store
WHERE states IN ('California','Texas','Virginia');

--🎄LIKE opoerator🎄--

	/* 
	1)% -->Matches Anything:

			i)M%  -->Find names start  with 'M' remaining anything
			ii)%n -->Find names end  with 'n' remaining anything
			iii)%r% --->Find names contain 'r' remaining anything
			Note:It is case sensitive
			
	2)_ -->Match exactly one character :

			i)__r% -->Find name starts with 'r' at 3rd posistion and remaining anything
	*/

--💎First character Starts with 'M' and remainig matches anything💎--

SELECT customer_id,
	   customer_name 
FROM store
WHERE customer_name 
LIKE 'M%';

--💎Last character ends with 'a' and remainig matches anything💎--

SELECT customer_id,
	   customer_name 
FROM store
WHERE customer_name 
LIKE '%a';

--💎Character matches 'b' at anywhere and remainig matches anything💎--

SELECT customer_id,
	   customer_name 
FROM store
WHERE customer_name 
LIKE '%b%';

--💎Character contain 'a' in the 4th position and remainig matches anything💎--

SELECT customer_id,
	   customer_name 
FROM store
WHERE customer_name 
LIKE '___a%';

				
