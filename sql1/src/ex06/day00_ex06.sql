select (select name from person where person.id = person_order.person_id) as name,
case
    when(select name from person where person.id = person_order.person_id) = 'Denis' 
    then TRUE
    else false 
end as check_name
from person_order 
where (menu_id = 13 or menu_id = 14 or menu_id = 18) and order_date = '2022-01-07';