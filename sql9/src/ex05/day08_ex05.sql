BEGIN;
BEGIN; -- start of transactions
SELECT SUM(rating) FROM pizzeria; -- check sum in 1st terminal
INSERT INTO pizzeria VALUES(10, 'Kazan Pizza',5); -- insert in 2nd terminal
COMMIT; -- apply changes from 2nd terminal
SELECT SUM(rating) FROM pizzeria; -- we see changes in 1st terminal;
COMMIT; -- apply in 1st terminal
SELECT SUM(rating) FROM pizzeria; -- final query 1st terminal;
SELECT SUM(rating) FROM pizzeria; -- final query 2nd terminal;
