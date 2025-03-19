WITH cpy_pizzeria AS (SELECT menu.pizza_name AS pizza_name, pizzeria.name, menu.price AS price
                        FROM menu
                             INNER JOIN pizzeria
                             ON menu.pizzeria_id = pizzeria.id )
SELECT menu.pizza_name, pizzeria.name AS pizzeria_name_1, cpy_pizzeria.name AS pizzeria_name_2, menu.price
  FROM menu
       INNER JOIN pizzeria
       ON menu.pizzeria_id = pizzeria.id

       INNER JOIN cpy_pizzeria
       ON cpy_pizzeria.pizza_name = menu.pizza_name
 WHERE menu.price = cpy_pizzeria.price
   AND pizzeria.name <> cpy_pizzeria.name
   AND pizzeria.name < cpy_pizzeria.name
ORDER BY menu.pizza_name;
