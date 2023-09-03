-- create - insert
INSERT INTO cd.delivery VALUES ('China',  150, 14);
INSERT INTO cd.buyer VALUES (10, 'Anna', 'Petrova', 'annapetrova@example.com');
INSERT INTO cd.seller VALUES (11, 'Seller 12', 'Italy');
INSERT INTO cd.seller VALUES (12, 'Seller 12', 'Italy');

-- read - select
select name
from cd.product;

select country, period_day
from cd.delivery
where period_day <= 14;

select avg(amount)
from cd.orders;

select *
from cd.product
where category_id = 1;

-- update
update cd.delivery
set period_day = 15
where period_day = 14;

-- delete
delete from cd.delivery
where country = 'Spain'