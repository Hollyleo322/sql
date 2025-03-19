CREATE FUNCTION fnc_persons_female() RETURNS SETOF person AS $fnc_persons_female$
    SELECT * 
      FROM person
     WHERE gender = 'female';
$fnc_persons_female$ LANGUAGE sql;

CREATE FUNCTION fnc_persons_male() RETURNS SETOF person AS $fnc_persons_male$
    SELECT * 
      FROM person
     WHERE gender = 'male';
$fnc_persons_male$ LANGUAGE sql;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();