-- Заказы и историю изменения цен товаров упорядочим по дате по возрастанию
create index on cd.orders(date asc);
create index on cd.product_history(date asc);

-- -- Часто нам нужно найти продавца/производителя/покупателя,
-- -- но у нас они расположены не в алфавитном порядке.
-- -- Воспользуемся индексами для оптимизации нашей базы данных.
-- -- Работаем в UPPERCASE, чтобы поиск был регистронезависимым.

create index on cd.seller(upper(name));
create index on cd.manufacturer(upper(name));
create index on cd.buyer(upper(surname || buyer.firstname));
create index on cd.delivery(upper(country));

-- Аналогично для страны доставки, продукта, категории
create index on cd.product(upper(name));
create index on cd.category(upper(name));