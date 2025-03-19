BEGIN; -- 1st terminal
BEGIN; -- 2nd termianl
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- set isolation level for 1st
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- set isolation level for 2nd
SHOW TRANSACTION ISOLATION LEVEL; -- check isolation level for 1st
SHOW TRANSACTION ISOLATION LEVEL; -- check isolation level for 2nd
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 1st terminal
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut'; -- update from 2nd terminal
COMMIT; -- apply changes
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 1st terminal we don't see changes
COMMIT; -- apply from 1st terminal
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 1st terminal final check  now availaible changes
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 2nd terminal final check and here availaible