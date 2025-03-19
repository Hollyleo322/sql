SELECT id as object_id, pizza_name as object_name from menu
UNION
SELECT id as object_id, name as object_name from person
ORDER BY object_id , object_name;