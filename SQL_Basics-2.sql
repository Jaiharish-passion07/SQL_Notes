	--👉JOIN Statements👈--

/*  1)To deal with multiple tables by combining them together 
	2)Query the Information from the combined tables */
	
/*  1) To join the multiple table we need Join key(Primary key + Foreign key)
	2)Then specify the type of Joins */
	
--🎆Aliases: specify table name or column name in short form and easy way to indicate table or column name🎆--
	
SELECT st.customer_id AS cst_id,
	   st.customer_name AS cst_nme
FROM store AS st;
	
--Note:It does not affect Original Table, It changes made only from the results after query--

	--✨JOIN types✨--
	
		/*
		i)Inner Join
		ii)FULL Outer Join(Full Join)
		iii)Left Join
		iv)Right Join
		*/
	
--Working with ordfer_timeline and shipment tables--

/* Syntax:
		SELECT Identifiers
		FROM table_name_1 JOIN TYPE
		table_name_2 
		ON table_1.colum_key=table_2.column_key
		
		*/

--🎄Inner Join🎄--

SELECT ot.order_id, 
	   ot.message,
	   st.actual_dispatch_date
FROM order_timeline AS ot
INNER JOIN shipment AS st
ON ot.id=st.id;

--🎄Full Outer Join🎄--

SELECT ot.order_id, 
	   ot.message,
	   st.actual_dispatch_date
FROM order_timeline AS ot
FULL OUTER JOIN shipment AS st
ON ot.id=st.id;

--🎄Left Join🎄--

SELECT ot.order_id, 
	   ot.message,
	   st.actual_dispatch_date
FROM order_timeline AS ot
LEFT JOIN shipment AS st
ON ot.id=st.id;

--🎄Right Join🎄--

SELECT ot.order_id, 
	   ot.message,
	   st.actual_dispatch_date
FROM order_timeline AS ot
RIGHT JOIN shipment AS st
ON ot.id=st.id;

	--👉UNION Statements👈--

/*  1)Same like join operation, Union used to combine multiple tables 
	2)Small Difference is:
						i)Join uses column to combine tables, which will wider the table size
						ii)Union uses rows to combine tables, which will longer the table size*/
						
/* Note:
		i)In the query both tables must have exactly the same number of column and in same order.
		ii)It cares only datatype of column,where it doesn't care column name or order because it combines the table using row.
*/

--Types of Union Stmt--
        /*
		i)UNION ALL-->Combines the row without removing the duplicates
		ii)UNION   -->Combines the row by removing the duplicates */
		
--🎄UNION ALL🎄--
SELECT *
FROM order_timeline

--🎆QUERY-1 EXAMPLE🎆--

SELECT id AS ID,
	   order_id AS ORD_ID,
	   created AS DATE
FROM order_timeline AS ot
UNION ALL 									---> As you can see from this query the datatype of column must be same whereas not the column name 
SELECT  id,
		order_id,
		actual_dispatch_date
FROM shipment AS st;

--🎆QUERY-2 EXAMPLE🎆--

SELECT id,
	   order_id,
 	   created
FROM order_timeline AS ot
UNION ALL 									---> As you can see from this query the datatype of column order has been changed it throwout an error
SELECT id,
	   actual_dispatch_date,
	   order_id
FROM shipment AS st;
		
