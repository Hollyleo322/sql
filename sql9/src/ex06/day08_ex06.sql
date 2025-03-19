BEGIN;
BEGIN; -- start of transactions
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- set isolation lvl in 2 terminals
SELECT SUM(rating) FROM pizzeria; -- check rating in 1st terminal before changes
INSERT INTO pizzeria VALUES(11,'Kazan Pizza 2',4);
COMMIT; -- changes in 2nd terminal
select sum(rating) from pizzeria; -- There is no phantom read in 1st terminal
COMMIT; -- apply in 1st terminal;
SELECT SUM(rating) FROM pizzeria; -- now we see changes in 1st terminal
SELECT SUM(rating) FROM pizzeria; -- final output in 2nd terminal