BEGIN; -- 1st terminal
BEGIN; -- 2nd termianl
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- set isolation level for 1st
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- set isolation level for 2nd
SHOW TRANSACTION ISOLATION LEVEL; -- check isolation level for 1st
SHOW TRANSACTION ISOLATION LEVEL; -- check isolation level for 2nd
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 1st terminal
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 2nd terminal
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut'; -- update in 1st terminal
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- update from 2nd terminal
COMMIT; -- we've got error for update in 2nd terminal
COMMIT;