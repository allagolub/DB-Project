-- 4. Вывести ранжированный по убыванию даты список изменения цен на товары
select rank() over (order by date desc) as rank, p.name, h.price, date
from cd.product_history h
inner join cd.product p using (product_id)
order by rank, name;