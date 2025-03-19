DROP FUNCTION fnc_persons_female;
DROP FUNCTION fnc_persons_male;

CREATE FUNCTION fnc_persons(pgender TEXT DEFAULT 'female') RETURNS SETOF person AS $fnc_persons$
    SELECT *
      FROM person
     WHERE gender = pgender;
$fnc_persons$ LANGUAGE sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();