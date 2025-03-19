WITH moscow_samara_info AS (SELECT id,name 
                              FROM person 
                             WHERE address IN ('Moscow', 'Samara') 
                               AND gender = 'male'),
     pizzas_id AS (SELECT id 
                     FROM menu 
                    WHERE pizza_name IN ('pepperoni' ,'mushroom pizza'))
SELECT DISTINCT name 
  FROM moscow_samara_info 
       LEFT JOIN person_order 
       ON person_order.person_id=moscow_samara_info.id 
       
       LEFT JOIN pizzas_id 
       ON pizzas_id.id=person_order.menu_id 
 ORDER BY name DESC;