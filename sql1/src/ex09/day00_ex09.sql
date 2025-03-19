SELECT (SELECT name from person where id = pv.person_id) AS person_name,
       (SELECT name from pizzeria where id = pv.pizzeria_id ) AS pizzeria_name
from (SELECT person_id, pizzeria_id from person_visits where visit_date between '2022-01-07' and '2022-01-09') as pv
order by person_name asc , pizzeria_name desc;