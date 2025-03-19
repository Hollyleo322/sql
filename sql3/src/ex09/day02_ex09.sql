WITH woman_info AS (SELECT id, name 
                      FROM person 
                     WHERE gender = 'female')
SELECT DISTINCT name
  FROM woman_info
       INNER JOIN person_order 
       ON person_order.person_id=woman_info.id

       INNER JOIN  menu
       ON menu.id = person_order.menu_id
 WHERE menu.pizza_name = 'pepperoni pizza'
   AND woman_info.id IN (SELECT person.id
                           FROM person
                                INNER JOIN person_order
                                ON person.id = person_order.person_id
                                
                                INNER JOIN menu
                                ON menu.id = person_order.menu_id
                         WHERE menu.pizza_name = 'cheese pizza')
 ORDER BY name;