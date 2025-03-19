  WITH cpy_person AS (SELECT name, address, id 
                     FROM person)
SELECT person.name AS person_name1, cpy_person.name AS person_name2, person.address AS common_address 
  FROM person 
       INNER JOIN cpy_person 
       ON person.address = cpy_person.address 
 WHERE person.name <> cpy_person.name
   AND person.id > cpy_person.id 
 ORDER BY person_name1, person_name2, common_address;
