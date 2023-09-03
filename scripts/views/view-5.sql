-- 5. Данное представление позволяет получить список продуктов с информацией о количестве заказов,
-- в которых они были куплены, и средней стоимости заказа для каждого продукта
create view cd.product_orders_info as
select p.product_id, p.name, count(op.order_id) as num_orders, avg(o.amount) as avg_order_amount
from cd.product p
left join cd.ordered_products op on p.product_id = op.product_id
left join cd.orders o on op.order_id = o.order_id
group by p.product_id, p.name
order by p.product_id;

select * from cd.product_orders_info