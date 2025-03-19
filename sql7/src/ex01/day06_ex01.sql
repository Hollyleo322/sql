WITH tmp_data AS(
SELECT person_order.person_id AS person_id , pizzeria.id AS pizzeria_id, COUNT(pizzeria.id) AS amount
  FROM person_order
       INNER JOIN menu
       ON menu.id = person_order.menu_id

       INNER JOIN pizzeria
       ON menu.pizzeria_id = pizzeria.id
 GROUP BY person_order.person_id, pizzeria.id
 ORDER BY person_id)
 INSERT INTO person_discounts
 SELECT row_number() over() as id, 
        tmp_data.person_id, 
        tmp_data.pizzeria_id,
        CASE
            WHEN tmp_data.amount = 1 THEN 10.5
            WHEN tmp_data.amount = 2 THEN 22
            ELSE 30
        END
  FROM tmp_data;