WITH order_pair AS(SELECT menu_id 
                     FROM person_order 
                          JOIN person 
                          ON person.id=person_order.person_id 
                    WHERE person.name IN('Denis','Anna'))
SELECT menu.pizza_name, pizzeria.name AS pizzeria_name 
  FROM menu 
       INNER JOIN order_pair 
       ON menu.id=order_pair.menu_id 
       
       INNER JOIN pizzeria 
       ON menu.pizzeria_id=pizzeria.id 
 ORDER BY pizza_name, pizzeria_name;