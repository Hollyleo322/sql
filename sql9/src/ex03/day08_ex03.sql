BEGIN;
BEGIN;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 1st terminal
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- update from 2nd terminal
COMMIT; -- apply changes
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 1st terminal we see changes
COMMIT; -- apply from 1st terminal
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 1st terminal final check
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- 2nd terminal final check