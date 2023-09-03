-- 3. Вывести среднюю цену товара для каждого производителя
-- Для каждого товара будет выведены название, цена, категория, средняя цена для данного производителя
select p.name as name, price, m.name,  avg(price) over (partition by m.name) as average_price
from cd.product p
inner join cd.manufacturer m using(manufacturer_id);