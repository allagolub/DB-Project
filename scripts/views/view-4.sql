-- 4. Данное представление позволяет отобразать все заказы
-- и связанных с ними продуктов вместе с информацией о продавцах, покупателях и стране доставки
create or replace view cd.order_details as
select
    o.order_id,
    b.firstname || ' ' || b.surname as buyer_name,
    s.name as seller_name,
    p.name as product_name,
    o.amount,
    d.country,
    o.status,
    o.date
from
    cd.orders o
    join cd.buyer b on o.buyer_id = b.buyer_id
    join cd.delivery d on o.country = d.country
    join cd.ordered_products op on o.order_id = op.order_id
    join cd.product p on op.product_id = p.product_id
    join cd.seller s on p.seller_id = s.seller_id;
select * from cd.order_details;