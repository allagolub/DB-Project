-- 5. Вывести товары с нумерацией строк по категориям и вычислить суммы цен продуктов в каждой категории,
-- отсортированных по возрастанию цены:
select row_number() over (partition by category_id order by price) as row_num,
  name, price, category_id, sum(price) over (partition by category_id) as sum_price
from cd.product
order by category_id, price;