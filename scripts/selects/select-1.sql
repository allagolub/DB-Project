-- 1. Вывести страны, в которых число заказов больше 1
select country, count(country) as number_of_orders
from cd.orders
group by country
having count(country) > 1;




