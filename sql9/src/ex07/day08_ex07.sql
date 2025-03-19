BEGIN;
BEGIN; -- starts of transactions
UPDATE pizzeria SET rating = 2.0 WHERE id = 1; -- update from 1st terminal
UPDATE pizzeria SET rating = 2.5 WHERE id = 2; -- update from 2nd terminal
UPDATE pizzeria SET rating = 2.0 WHERE id = 2; -- 2nd update from 1st terminal
UPDATE pizzeria SET rating = 2.5 WHERE id = 1; -- we've got error 
COMMIT; -- apply changes in 1st terminal
COMMIT; -- we've got auto rollback in 2nd terminal