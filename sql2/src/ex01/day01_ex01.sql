SELECT  pizza_name as object_name from menu
UNION ALL
SELECT name as object_name from person
ORDER BY object_name;