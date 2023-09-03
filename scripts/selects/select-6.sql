-- 6.  Вывести нумерацию строк, названия и цены продуктов, а также сумму цен продуктов
-- и предыдущую цену для каждого продукта в каждой категории, отсортированных по возрастанию цены.
select row_number() over (partition by category_id order by price) as row_num,
  name, price, category_id, sum(price) over (partition by category_id) as sum_price,
  lag(price) over (partition by category_id order by price) as prev_price
from cd.product
order by category_id, price;