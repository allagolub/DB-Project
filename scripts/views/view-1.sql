-- 1. Данное представление скрывает email покупателей
create or replace view cd.new_protected_buyers as
select firstname, surname,
       (substring(email from 1 for 3) || '***@' || substring(email from position('@' in email) + 1 for 2) || '***') as email
from cd.buyer;

SELECT * FROM cd.new_protected_buyers;