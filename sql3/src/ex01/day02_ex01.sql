SELECT  missing_date::date 
  FROM generate_series('2022-01-01'::date, '2022-01-10', '1 day') missing_date 
       LEFT JOIN (SELECT visit_date 
                    FROM person_visits 
                   WHERE person_id IN( 1 , 2)) AS v 
       ON missing_date=v.visit_date 
 WHERE v.visit_date IS NULL 
 ORDER BY missing_date;
