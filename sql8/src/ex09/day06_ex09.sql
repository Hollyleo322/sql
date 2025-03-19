SELECT address,
       TO_CHAR(MAX(age) - (MIN(AGE) / MAX(AGE)::numeric), 'FM999999999.99')::numeric AS formula,
       TO_CHAR(AVG(age),'FM999999999.99')::numeric AS average,
       CASE
           WHEN MAX(age) - (MIN(AGE) / MAX(AGE)) > AVG(age) THEN 'true'
           ELSE 'false'
       END AS comparison
  FROM person
 GROUP BY address
 ORDER BY address;