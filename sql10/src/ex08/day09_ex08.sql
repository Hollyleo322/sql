CREATE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fibb INTEGER) AS
$$
BEGIN
    RETURN QUERY
    WITH RECURSIVE Fibonacci (PrevN, N) AS (
        SELECT 0, 1
        UNION ALL
        SELECT N, PrevN + N
        FROM Fibonacci
        WHERE PrevN + N < pstop
    )
    SELECT PrevN
    FROM Fibonacci
    WHERE PrevN < pstop;
END;
$$ LANGUAGE plpgsql;
