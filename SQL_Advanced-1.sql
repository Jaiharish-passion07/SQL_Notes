	--👉SQL VIEW👈--

/* Notes:
		i) View are kind of virtual tables, which is not stored.
		ii) To Often use some Query again and again there comes in handy which is 'VIEW' Clause
		iii)Since views are not ordinary tables, you may not be able to execute a DELETE, INSERT, or UPDATE statement on a view
		iv)When you create a view, you basically create a query and assign a name to the query
*/

--🎆QUERY-1 EXAMPLE🎆--

CREATE VIEW store_customer_desc AS
SELECT customer_id,
	   customer_name,
	   city,
	   states
FROM  store;

--🎄Calling view🎄--

SELECT *  
FROM store_customer_desc;

--🎄Droping view🎄--

DROP VIEW store_customer_desc;

	--👉EXTRACT Timestamp👈--

	/* Notes:
		i) Function retrieves a field such as a year, month, and day from a date/time value.
	*/

--🎄Extract Year🎄--

SELECT 
EXTRACT(YEAR FROM order_date) 
AS year FROM store;

--🎄Extract Month🎄--

SELECT 
EXTRACT(MONTH FROM order_date) 
AS month FROM store;

--🎄Extract  Day🎄--

SELECT 
EXTRACT(DAY FROM order_date) 
AS date FROM store;

--🎄Extract  Date of week🎄--

SELECT 
EXTRACT(DOW FROM order_date) 
AS date_of_week
FROM store;

--Refer official Documentation for more methods--

	--👉SQL CASE Statements👈--

/* Notes:
		i)The case statements is like If-Else condition in SQL, PostgreSQL provides you with 
		ii)Using case statements that allow you to execute a block of code based on a condition
		
		The case expression has two forms:
								i)Simple Case Expression:
								
								--👑Simple case we use with column and its value with out using any logical or boolean expression👑--
									Syntax:
										   case column_name or value
										   when value_1 then stmt1
										   when value_2 then stmt2
										   else
											  else-stmts
										  END case;
										  
								ii)Searched case Expression:
								
								--👑Searched case we use with column and its value by using any logical or boolean expression👑--
									Syntax:
											case
											when boolean-expression-1 then
											  statements
											[ when boolean-expression-2 then
											  statements
											 ... ]
										   [ else
											  statements ]
										   end case;

*/

--🎄Simple case Expression🎄--

SELECT *  
FROM store;

SELECT customer_id,
	   customer_name,
CASE states
	WHEN 'California' THEN '1st state'
	WHEN  'Texas' THEN '2nd state'
	WHEN  'Washington' THEN '3rd state'
	WHEN  'Florida' THEN '4th state'
	ELSE 'Not Necessary'
END AS Important_states
FROM store;

--🎄Searched case Expression🎄--

SELECT customer_id,
	   customer_name,
	   category,
CASE 
	WHEN (category='Furniture' AND profit>=10) THEN '1st class'
	WHEN (sub_category='Phones' AND profit>=50) THEN '2nd class'
	WHEN (category='Furniture' AND profit<10) THEN '3rd class'
	ELSE 'No class'
END AS classes
FROM store

--🎆QUERY-1 EXAMPLE🎆--

SELECT 
SUM(CASE  
	WHEN (states='California' AND profit>=50) THEN 1
	ELSE 0
END) AS california_profit_count,
SUM(CASE 
	WHEN (states='Texas' AND profit>=50) THEN 1
	ELSE 0
END) AS Texas_profit_count,
SUM(CASE 
	WHEN  (states='Washington' AND profit>=50)THEN 1
	ELSE 0
END) AS Washington_profit_count
FROM store;

			--👉SELF Join👈--

/* Notes:
		i)A self join is a regular join, but the table is joined with itself.
		ii)It joins the same table by using different alias for same table
		iii)To specify self join we use after the ON keyword
*/

SELECT x.order_id,
	   x.ship_mode
FROM store x
INNER JOIN store y ON x.order_date = y.ship_date;

