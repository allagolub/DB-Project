-- 6. Данное представление позволяет узнать среднюю цену продуктов каждой категории
create view cd.avg_price_categories as
select c.name as category_name, avg(p.price) as average_price
from cd.category c
join cd.product p on c.category_id = p.category_id
group by c.name
order by average_price;

select * from cd.avg_price_categories;

