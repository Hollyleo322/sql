WITH dimon_info AS (SELECT pizzeria_id 
                      FROM person_visits 
                           INNER JOIN person 
                           ON person.id=person_visits.person_id 
                     WHERE person.name = 'Dmitriy' 
                       AND visit_date = '2022-01-08')
SELECT name 
  FROM pizzeria 
       INNER JOIN dimon_info 
       ON pizzeria.id=dimon_info.pizzeria_id;
