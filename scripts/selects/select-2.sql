-- 2. Вывести категории и суммы товаров, в каждой из них
-- Сортируем по убыванию суммы
select c.name, sum(price)
from cd.product p
inner join cd.category c using(category_id)
group by c.name
order by sum(price) desc;