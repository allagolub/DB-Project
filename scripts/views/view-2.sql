-- 2. Данное представление скрывает техническое поле в таблице производителей, а именно manufacturer_id
create or replace view cd.manufacturer_view as
select name, country
from cd.manufacturer;

SELECT * FROM cd.manufacturer_view;