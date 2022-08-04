	--👉DESCRIBE👈--
	/* Notes:
		i) To obtain information about table*/

SELECT 
   table_name, 
   column_name, 
   data_type
FROM 
   information_schema.columns
WHERE 
   table_name = 'store';

	--👉SQL SUB QUERIES👈--
	
	/* Notes:
		i) Query that are nested to each query is said to be Sub Query
		
		🥀Tables -->Query-1(Sub-Query) -->Query-2(Main Query)🥀
		
		Query-1:
			i)It return results from table
			ii)Here Query-1 produce Sub results,so it is said to be Sub Query
		Query-2:
			i)It return results from Query-1(Sub-query) results
			ii)Here Query-2 produce main results,so it is said to be Main Query
			iii)Query-2 depends on Query-1 results	
*/

--SYNTAX--

/*SELECT main_query
from table _name
Where keywords (Sub_query)
*/

--🎆QUERY-1 EXAMPLE🎆--

SELECT * FROM Store;

SELECT * 
FROM Store
WHERE states IN
(SELECT states
FROM Store
WHERE states IN ('Texas','California','Georgia')
)


/* Notes:
		i) For using Subquery we can use IN and EXISTS Keyword
		ii)But EXISTS keyword give better performance than IN keyword
*/

--🎆QUERY-2 EXAMPLE🎆--

SELECT * 
FROM Store
WHERE EXISTS
(SELECT states
FROM Store
WHERE states IN ('Texas','California','Georgia')
)

--🎆QUERY-3 EXAMPLE🎆--

--Work with multiple tables,Eg:table_a&table_b
/*
SELECT * 
FROM table_a
WHERE EXISTS
(SELECT column_name
FROM table_b
WHERE table_a.key=table_b.key AND some stmt
)
*/

	--👉SQL String Functions👈--
	
/*
	i)CONCAT
	ii)LOWER
	iii)UPPER
	iv)TRIM      -->remove trailing and leading spaces from string
			a)LTRIM-->Left trim
			b)RTRIM-->Right trim
	v)LENGTH
	vi)SUBSTRING -->return a substring from the original string
			a)SUBSTRING(column_name,start,length)
	*/
	
	

