SELECT name 
  FROM pizzeria
       INNER JOIN menu
       ON pizzeria.id = menu.pizzeria_id

       INNER JOIN person_order
       ON person_order.menu_id = menu.id

       INNER JOIN person_visits
       ON pizzeria.id = person_visits.pizzeria_id
 WHERE person_visits.person_id = (SELECT id 
                                    FROM person
                                   WHERE name = 'Andrey')
 EXCEPT
SELECT name
  FROM pizzeria
       INNER JOIN menu
       ON pizzeria.id = menu.pizzeria_id
       
       INNER JOIN person_order
       ON person_order.menu_id = menu.id
 WHERE person_order.person_id = (SELECT id
                                   FROM person
                                  WHERE name = 'Andrey');