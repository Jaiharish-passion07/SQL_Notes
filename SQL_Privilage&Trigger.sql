
	--👉Privilages👈--

/* Notes:
		i)Privilages are to give authority or permission to other user to access a table or some object
		ii)This is performed by Grant and Revoke method
		iii)To use this command we need to create a different user
*/

--🎆CREATE NEW USER🎆--

CREATE USER jai password '12345';--user1
CREATE USER ram password '12345';--user2

/* Steps:
	i)After User hhas been created
	ii)SELECT--->Server(Left bar)-->Right click-->Create server
	iii)Once Pop up window open Go to connection tab and produce the neccesary info
*/

--🎆Permission grant to jai user by default postgre user and revoke the permission🎆--

SELECT * FROM store;--permission denied without giving permission authority

--🧢Permission Grant to user (jai) by default user postgres🧢--

GRANT SELECT on store to jai;--this permission is given to jai user only for retrive data or selecting data whereas can't perform other operation like update,delete etc..

GRANT SELECT,UPDATE,DELETE,INSERT on store to jai;--this permission is given to jai user for select,update,delete,insert data 

GRANT ALL on store,air_bnb,order_timeline to jai;--this permission is given to jai user for all privilages and multiple tables

--🧢Permission Revoke by default user postgres from user(jai)🧢--


REVOKE SELECT,UPDATE,DELETE,INSERT on store FROM jai;

REVOKE ALL on store,air_bnb,order_timeline FROM jai;--this permission is revoked from jai user to deault postgre use for all privilages and multiple tables


--Important Notes Privilages have only access to DML commands--

--🎆DROP USER that created🎆--

DROP USER jai --make sure to revoke all privilage before drooping that user
--👉SQL TRIGGER👈--

/* Notes:
		I)A trigger is a function or stored procedure or program in database which automatically invokes whenever a special event in the database occurs. 
		For example, a trigger can be invoked when a row is inserted into a specified table or when certain table columns are being updated
*/

