SELECT menu.pizza_name , menu.price, pizzeria.name
  FROM menu
       INNER JOIN pizzeria
       ON menu.pizzeria_id = pizzeria.id
 WHERE menu.id IN ((SELECT id 
                      FROM menu
                    EXCEPT
                    SELECT menu_id
                      FROM person_order
                     ORDER BY id))
 ORDER BY menu.pizza_name, menu.price;