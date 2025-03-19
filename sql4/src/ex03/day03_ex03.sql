WITH pizz_id AS (SELECT pizzeria.name AS name, person.gender AS gender
                   FROM pizzeria
                        INNER JOIN person_visits
                        ON pizzeria.id = person_visits.pizzeria_id

                        INNER JOIN person
                        ON person_visits.person_id = person.id),
    female_pizzeria AS (SELECT pizz_id.name AS name
                          FROM pizz_id 
                         WHERE pizz_id.gender = 'female'
                         EXCEPT ALL
                         SELECT pizz_id.name AS name
                          FROM pizz_id 
                         WHERE pizz_id.gender = 'male'),
    male_pizzeria AS (SELECT pizz_id.name AS name
                          FROM pizz_id 
                         WHERE pizz_id.gender = 'male'
                         EXCEPT ALL
                         SELECT pizz_id.name AS name
                          FROM pizz_id 
                         WHERE pizz_id.gender = 'female')
SELECT name AS pizzeria_name
  FROM female_pizzeria
 UNION ALL
SELECT name
  FROM male_pizzeria
 ORDER BY pizzeria_name;
