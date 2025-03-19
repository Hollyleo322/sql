SELECT menu.pizza_name, menu.price, pizzeria.name, person_visits.visit_date
  FROM menu
       INNER JOIN pizzeria
       ON menu.pizzeria_id = pizzeria.id

       INNER JOIN person_visits
       ON person_visits.pizzeria_id = pizzeria.id
 WHERE person_visits.person_id = (SELECT id
                      FROM person
                     WHERE name = 'Kate')
   AND menu.price BETWEEN 800 
   AND 1000
 ORDER BY menu.pizza_name, menu.price, pizzeria.name;