GRANT pg_write_all_data TO user2; -- allow user2 to change data

BEGIN; -- 1st terminal
BEGIN; -- 2nd termianl
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 1st terminal
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 2nd terminal
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; -- lost update in 1st terminal
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- update from 2nd terminal
COMMIT;
COMMIT;