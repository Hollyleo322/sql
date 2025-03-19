WITH restaurant_visits_orders AS(
SELECT pizzeria.name,
       COUNT(menu.pizzeria_id) AS count,
       'order' AS action_type
  FROM person_order
       INNER JOIN menu
       ON person_order.menu_id = menu.id

       INNER JOIN pizzeria
       ON menu.pizzeria_id = pizzeria.id
 GROUP BY pizzeria.name
UNION
SELECT pizzeria.name,
       COUNT(person_visits.pizzeria_id) AS count,
       'visit' AS action_type
  FROM person_visits
       INNER JOIN pizzeria
       ON person_visits.pizzeria_id = pizzeria.id
 GROUP BY pizzeria.name
ORDER BY action_type, count DESC)
SELECT name,
       SUM(count) AS total_count
  FROM restaurant_visits_orders
 GROUP BY name
 ORDER BY total_count DESC,name;