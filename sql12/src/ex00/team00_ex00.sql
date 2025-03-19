CREATE TABLE cities (
    id INTEGER PRIMARY KEY,
    point1 CHAR,
    point2 CHAR,
    cost INTEGER
);
INSERT INTO cities
VALUES (1,'a', 'b', 10);
INSERT INTO cities
VALUES (2,'b', 'a', 10);
INSERT INTO cities
VALUES (3,'a', 'd', 20);
INSERT INTO cities
VALUES (4,'d', 'a', 20);
INSERT INTO cities
VALUES (5,'a', 'c', 15);
INSERT INTO cities
VALUES (6,'c', 'a', 15);
INSERT INTO cities
VALUES (7,'b', 'c', 35);
INSERT INTO cities
VALUES (8,'c', 'b', 35);
INSERT INTO cities
VALUES (9,'b', 'd', 25);
INSERT INTO cities
VALUES (10,'d', 'b', 25);
INSERT INTO cities
VALUES (11,'c', 'd', 30);
INSERT INTO cities
VALUES (12,'d', 'c', 30);

CREATE VIEW five_way AS
WITH RECURSIVE path AS (
    SELECT point1, point2, cost AS total_cost, 0 as lvl , CONCAT(point1, ',', point2) AS tour
      FROM cities
     WHERE point1 = 'a'
     UNION ALL
    SELECT c.point1 , c.point2, (c.cost + path.total_cost) AS total_cost, (path.lvl + 1) as lvl , CONCAT(path.tour, ',', c.point2)
      FROM cities c 
           INNER JOIN path
           ON c.point1 = path.point2 AND c.point2 <> path.point1
     WHERE c.point1 = path.point2 AND lvl < 3
)
SELECT total_cost, concat('{', tour, '}') AS tour
  FROM path
 WHERE LEFT(tour,1) = RIGHT(tour,1)
 AND LENGTH(tour)  = (SELECT COUNT(DISTINCT point1) + 5 from cities)
ORDER BY total_cost, tour;

SELECT * 
  FROM five_way
 WHERE total_cost = (SELECT MIN(total_cost)
                       FROM five_way)
 ORDER BY total_cost, tour;
