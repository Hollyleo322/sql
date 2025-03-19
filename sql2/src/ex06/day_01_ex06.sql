SELECT person_order.order_date as action_date, name as person_name from person inner join person_order on person.id=person_order.person_id
INTERSECT
SELECT person_visits.visit_date as action_date, name as person_name from person inner join person_visits on person.id=person_visits.person_id
order by action_date, person_name desc;