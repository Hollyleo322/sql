CREATE VIEW v_price_with_discount AS
SELECT person.name, menu.pizza_name, menu.price, (price * 0.9)::INTEGER AS discount_price
  FROM person
       INNER JOIN person_order
       ON person.id = person_order.person_id

       INNER JOIN menu
       ON person_order.menu_id = menu.id
 ORDER BY person.name, menu.pizza_name;