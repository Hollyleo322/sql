CREATE FUNCTION func_minimum(VARIADIC arr NUMERIC[]) RETURNS NUMERIC AS $func_minimum$
DECLARE
    min NUMERIC := arr[1];
    i NUMERIC;
BEGIN
    FOREACH i IN ARRAY arr
    LOOP 
        IF (min > i) THEN
            min := i;
        END IF;
    END LOOP;
    RETURN min;
END;
$func_minimum$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
