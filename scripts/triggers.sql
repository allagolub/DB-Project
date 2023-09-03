-- Триггер для обновления истории изменений цены товара
-- Этот триггер будет автоматически добавлять новую запись в таблицу
-- истории изменений цены товара при изменении цены в таблице продуктов.
create or replace function cd.update_product_history() returns trigger as $$
begin
  if (OLD.price != NEW.price) then
    insert into cd.product_history (product_id, price, date)
    values (OLD.product_id, OLD.price, now());
  end if;

  return NEW;
end;
$$ language plpgsql;

create trigger update_product_history_trigger
  after update on cd.product
  for each row
  execute function cd.update_product_history();


-- Триггер, который проверяет, чтобы при вставке или обновлении данных в таблице orders,
-- значение поля status было из списка разрешенных значений: 'In progress', 'Completed', 'Pending'
create or replace function cd.check_order_status() returns trigger as $$
begin
  if NEW.status not in ('In progress', 'Completed', 'Pending') then
    raise exception 'Invalid order status: %', NEW.status;
  end if;

  return NEW;
end;
$$ language plpgsql;

create trigger check_order_status_trigger
before insert or update on cd.orders
for each row
execute function cd.check_order_status();

