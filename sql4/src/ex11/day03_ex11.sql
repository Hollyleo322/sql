UPDATE menu
   SET price = price * 0.9
 WHERE pizza_name = 'greek pizza';
UPDATE menu
   SET price = price::INTEGER
 WHERE pizza_name = 'greek pizza';