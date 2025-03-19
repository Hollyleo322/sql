CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson VARCHAR DEFAULT 'Dmitriy',pprice NUMERIC DEFAULT 500, pdate date DEFAULT '2022-01-08') RETURNS TABLE(pizzeria_name VARCHAR ) AS $fnc_person_visits_and_eats_on_date$
    BEGIN
        RETURN QUERY    
        (SELECT DISTINCT pizzeria.name
        FROM pizzeria
             INNER JOIN person_visits
             ON pizzeria.id = person_visits.pizzeria_id

             INNER JOIN person
             ON person.id = person_visits.person_id

             INNER JOIN menu
             ON menu.pizzeria_id = pizzeria.id
       WHERE person.name = pperson
         AND menu.price < pprice
         AND person_visits.visit_date = pdate);
    END;
$fnc_person_visits_and_eats_on_date$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');