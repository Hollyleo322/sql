SET enable_seqscan TO OFF;
EXPLAIN ANALYZE SELECT menu.pizza_name , pizzeria.name 
                  FROM menu
                      INNER JOIN pizzeria
                      ON menu.pizzeria_id = pizzeria.id;

