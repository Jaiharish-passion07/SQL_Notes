	--🎆Some Important notes🎆--
	
	--🌻Update vs Alter  vs Insert🌻--
	
	/*
	a)Update-->Update an new row into an Existing table
	b)Alter-->Add new column or changing the existing structure of table like (constraint,datatypes,etc)
	c)Insert-->Insert new rows into newly created tables 
	*/
	
	--🌻Delete vs Drop vs Truncate🌻--
	
	/*
	a)Delete-->It is used to delete one or more tuples of a table. With the help of the “DELETE” command, 
we can either delete all the rows in one go or can delete rows one by one. i.e., we can use it as per the requirement or the condition using the Where clause.
It is comparatively slower than the TRUNCATE command. The TRUNCATE command does not remove the structure of the table
🤷‍♀️Note for Delete:Here we can use the “ROLLBACK” command to restore the tuple because it does not auto-commit
	b)Drop-->It is used to drop the whole table. With the help of the “DROP” command we can drop (delete) the whole structure in one go i.e. 
it removes the named elements of the schema. By using this command the existence of the whole table is finished or say lost.
🤷‍♀️Note for Drop:Here we can’t restore the table by using the “ROLLBACK” command because it auto commits
	c)Truncate-->It is used to delete all the rows of a relation (table) in one go. With the help of the “TRUNCATE” command, 
we can’t delete the single row as here WHERE clause is not used. 
By using this command the existence of all the rows of the table is lost. It is comparatively faster than the delete command as it deletes all the rows fastly.  
🤷‍♀️Note fro Truncate:Here we can’t restore the tuples of the table by using the “ROLLBACK” command
	*/
	
	--👉CREATE TABLE👈--
	
/* SYNATX:
	 
	 CREATE TABLE [IF NOT EXISTS] table_name (
   column1 datatype(length) column_contraint,
   column2 datatype(length) column_contraint,
   column3 datatype(length) column_contraint,
   table_constraints
);

exapmle:

	CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
        last_login TIMESTAMP 
); */

	--👉ALTER TABLE👈--
	
--To change the structure of an existing table, you use PostgreSQL ALTER TABLE statement

/* SYNTAX:
	ALTER TABLE table_name 
ADD COLUMN column_name datatype column_constraint;*/

--SOME EXAMPLES:

/*
--Eg:1
ALTER TABLE table_name 
DROP COLUMN column_name;

--Eg:2
ALTER TABLE table_name 
RENAME COLUMN column_name 
TO new_column_name;

--Eg:3
ALTER TABLE table_name 
ALTER COLUMN column_name 
[SET DEFAULT value | DROP DEFAULT];
*/



