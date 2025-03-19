WITH pizz_id AS (SELECT pizzeria.name AS name, person.gender AS gender
                   FROM pizzeria
                        INNER JOIN menu
                        ON pizzeria.id = menu.pizzeria_id
                        
                        INNER JOIN person_order
                        ON menu.id = person_order.menu_id

                        INNER JOIN person
                        ON person_order.person_id = person.id),
    female_pizzeria AS (SELECT pizz_id.name AS name
                          FROM pizz_id 
                         WHERE pizz_id.gender = 'female'
                         EXCEPT
                         SELECT pizz_id.name AS name
                          FROM pizz_id 
                         WHERE pizz_id.gender = 'male'),
    male_pizzeria AS (SELECT pizz_id.name AS name
                          FROM pizz_id 
                         WHERE pizz_id.gender = 'male'
                         EXCEPT
                         SELECT pizz_id.name AS name
                          FROM pizz_id 
                         WHERE pizz_id.gender = 'female')
SELECT name AS pizzeria_name
  FROM female_pizzeria
 UNION 
SELECT name
  FROM male_pizzeria
 ORDER BY pizzeria_name;
