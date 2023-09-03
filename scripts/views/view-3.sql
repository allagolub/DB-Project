-- 3. Данное представление позволяет узнать продавца и его страну для каждого продукта
create or replace view cd.products_seller as
select p.name as product_name, s.name as seller_name, s.country as seller_country
from cd.product p
join cd.seller s on p.seller_id = s.seller_id;

SELECT * FROM cd.products_seller;