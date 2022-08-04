--Resources link-1:https://stackoverflow.com/questions/26277356/how-to-get-current-database-and-user-name-with-select-in-postgresql--
--Resources link-2:https://www.techonthenet.com/postgresql/questions/find_users.php--


-----👉User Details👈-----

SELECT usename,passwd;

FROM pg_user;

select current_database();

select user;

select 'Database : ' ||current_database()||', '||'User : '|| user db_details;
