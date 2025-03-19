create user user2 with password 'pass'; -- creation of user
GRANT ALL PRIVILEGES ON DATABASE "postgres" to user2; -- get privileges for user2
GRANT pg_read_all_data to user2; -- can read data from db
-- COMMANDS IN FIRST TERMINAL
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM PIZZERIA;
-- Check situation in second terminal
SELECT * FROM PIZZERIA;
-- Commit changes in first terminal
COMMIT;
-- Check changes in second terminal
SELECT * FROM PIZZERIA;