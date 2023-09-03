CREATE SCHEMA cd;
CREATE TABLE IF NOT EXISTS cd.category (
  category_id serial not null primary key,
  name        varchar(255) not null,
  unique (category_id)
);

CREATE TABLE IF NOT EXISTS cd.seller (
  seller_id serial not null primary key,
  name      varchar(255) not null,
  country   varchar(255) not null,
  unique(seller_id)
);

CREATE TABLE IF NOT EXISTS cd.manufacturer (
  manufacturer_id serial not null primary key,
  name            varchar(255) not null,
  country         varchar(255) not null,
  unique(manufacturer_id)
);

CREATE TABLE IF NOT EXISTS cd.product (
  product_id                    serial not null primary key,
  name                          varchar(255) not null,
  price                         integer not null,
  description                   varchar(255) not null,
  category_id                   serial not null,
  seller_id                     serial not null,
  manufacturer_id               serial not null,
  foreign key (category_id)     references cd.category(category_id),
  foreign key (seller_id)       references cd.seller(seller_id),
  foreign key (manufacturer_id) references cd.manufacturer(manufacturer_id),
  unique(product_id)
);

CREATE TABLE IF NOT EXISTS cd.buyer (
  buyer_id  serial not null primary key,
  firstname varchar(255) not null,
  surname   varchar(255) not null,
  email     varchar(255) not null,
  unique (buyer_id)
);

CREATE TABLE IF NOT EXISTS cd.delivery (
  country    varchar(255) not null primary key,
  price      integer not null,
  period_day integer not null,
  unique(country)
);

CREATE TABLE IF NOT EXISTS cd.orders (
  order_id                serial not null primary key,
  buyer_id                serial not null,
  country                 varchar(255) not null,
  status                  varchar(255) not null,
  date                    date not null,
  amount                  integer not null,
  foreign key (buyer_id)  references cd.buyer(buyer_id),
  foreign key (country)   references cd.delivery(country),
  unique(order_id)
);

CREATE TABLE IF NOT EXISTS cd.product_history (
  product_id serial not null,
  price      integer not null,
  date       date not null,
  unique(product_id),
  primary key(product_id, date)
);

CREATE TABLE IF NOT EXISTS cd.ordered_products (
  product_id               serial not null,
  order_id                 serial not null,
  foreign key (product_id) references cd.product(product_id),
  foreign key (order_id)   references cd.orders(order_id),
  primary key(product_id, order_id)
);

