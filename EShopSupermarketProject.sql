create database e_shop_supermarket;

use e_shop_supermarket;

/*CREATE TABLES, PRIMARY AND FOREIGN KEYS*/

create table people(
id int primary key,
firstname varchar(25),
lastname varchar(25),
phone int,
email varchar(30),
address_id int not null
);

create table addresses(
address_id int primary key,
street varchar(40),
number int,
flat int,
city varchar(20),
state varchar(20),
postal_code varchar(8),
country varchar(20)
);

create table employees(
employee_id int primary key,
people_id int not null,
job_title varchar(30),
manager_id int
);

create table users(
username varchar(20) primary key,
password varchar(30),
people_id int not null
);

create table vendors(
vendor_id int primary key,
people_id int not null
);

create table products(
product_id int primary key,
name varchar(50),
description varchar(100),
stock_quantity int,
price float,
brand_id int,
vendor_id int
);

create table brands(
brand_id int primary key,
name varchar(50)
);

create table categories(
category_id int primary key,
title varchar(50)
);

create table products_categories(
product_id int not null,
category_id int not null,
foreign key (product_id) references products(product_id),
foreign key (category_id) references categories(category_id)
);

create table products_views(
username varchar(20) not null,
product_id int not null,
views int,
foreign key (username) references users(username),
foreign key (product_id) references products(product_id)
);

create table orders(
order_id int primary key,
order_date date,
require_date date,
shipped_date date,
status varchar(30),
comments varchar(70),
username varchar(20) not null
);

create table order_details(
order_id int not null,
product_id int not null,
quantity int,
priceperproduct float,
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);

create table payments(
payment_id int primary key,
username varchar(20),
order_id int not null,
amount float,
payment_date date
);

alter table people
add constraint fk_address
foreign key (address_id) references addresses(address_id);

alter table employees
add constraint fk_people
foreign key (people_id) references people(id);

alter table employees
add constraint fk_manager
foreign key (manager_id) references employees(employee_id);

alter table users
add constraint fk_people_u
foreign key (people_id) references people(id);

alter table vendors
add constraint fk_people_v
foreign key (people_id) references people(id);

alter table products
add constraint fk_brand
foreign key (brand_id) references brands(brand_id);

alter table products
add constraint fk_vendor
foreign key (vendor_id) references vendors(vendor_id);

alter table orders
add constraint fk_user
foreign key (username) references users(username);

alter table payments
add constraint fk_order_pay
foreign key (order_id) references orders(order_id);

/*ADD DATA*/
insert into addresses(
address_id, street, number, flat, city, state, postal_code, country
)
values
(1, "Agiou Sila", 32, 0, "Limassol", "Limassol", 4878, "Cyprus"),
(2, "Bouboulinas", 32, 0, "Limassol", "Limassol", 3476, "Cyprus"),
(3, "Karaiskaki", 102, 304, "Limassol", "Limassol", 2692, "Cyprus"),
(4, "Arch. Makariou III", 7, 202, "Limassol", "Limassol", 2392, "Cyprus"),
(5, "Eleftherias", 32, 0, "Keryneia", "Keryneia", 1974, "Cyprus"),
(6, "28 Oktovriou", 28, 101, "Larnaca", "Larnaca", 7000, "Cyprus"),
(7, "Arch. Makariou III", 2, 108, "Nicosia", "Nicosia", 1092, "Cyprus");

insert into people(
id, firstname, lastname, phone, email, address_id
)
values
(100, "Margarita", "Smith", 99999999, "margie_smith@abc.com", 1),
(101, "Georges", "Brown", 99000000, "georges@abc.com", 2),
(102, "Joe", "Doe", 97979797, "doejoe@abc.com", 3),
(103, "Angeliki", "Brown", 99900099, "mrsbrown@abc.com", 2),
(104, "Michael", "Michail", 96999996, "mmichail@abc.com", 4),
(105, "Georgia", "Smith", 92939999, "geo_smith@abc.com", 5),
(106, "Phillipos", "Phillipou", 93999499, "phillipou@abc.com", 6),
(107, "Anna", "Georgiades", 91919191, "anna_geo@abc.com", 7);

insert into users(
username, password, people_id
)
values
("mmich21", "123456", 104),
("angel91", "123456", 103),
("joedoe", "123456", 102),
("phil67", "123456", 106),
("gsmith013","012345",105);

insert into employees(
employee_id,people_id, job_title, manager_id
)
values
(31, 101, "Shop Manager", null),
(32, 107, "Sales Person", 31),
(33, 102, "Warehouse Employee", 31);

insert into vendors(
vendor_id,people_id
)
values
(21, 100),
(22, 104);

insert into categories(
category_id, title
)
values
(300, "Asian Cousine"),
(301, "Care Products"),
(302, "Frozen"),
(303, "Dairy"),
(304, "Meat and Fish"),
(305, "Bread and bread spreads"),
(306, "Dried Goods"),
(307, "Friuts and Vegetables"),
(308, "Snacks"),
(309, "Cleaning"),
(310, "Laundry"),
(311, "Drinks");

insert into brands(
brand_id, name
)
values
(60, "Yummy"),
(61, "Best Drinks"),
(62, "Mitsides"),
(63, "Best Snacks"),
(64, "Lays"),
(65, "Farm Fresh"),
(66, "Dixan"),
(67, "Dettol"),
(68, "Bakery"),
(69, "Delicious"),
(70, "Others");

insert into products(
product_id, name,description, stock_quantity, price, brand_id, vendor_id
)
values
(1001, "Noodles", "Yummy Noodles", 200, 0.69, 60, 21),
(1002, "Sweet and Sour Sauce", "Yummy Sweet and Sour Sauce", 50, 2.99, 60, 21),
(1003, "Soya Sauce", "Yummy Soya Sauce", 200, 3.49, 60, 21),
(1004, "Salted Chips", "Lays Salted Chips 100g", 100, 1.90, 64, 22),
(1005, "Vinegar Salt Chips", "Lays Vinagar and Salt Chips 100g", 200, 1.90, 64, 22),
(1006, "Barbeque Chips", "Lays Barbeque Chips 100g", 100, 1.90, 64, 22),
(1007, "Pop Corn", "Best Snacks Pop Corn 80g", 300, 1.50, 63, 21),
(1008, "Walnuts", "Best Snacks Walnuts 100g", 80, 3.50, 63, 21),
(1009, "Almonds", "Best Snacks Almonds 100g", 100, 3.30, 63, 21),
(1010, "Orange Juice 1L", "Best Drinks Orange Juice 1L", 60, 1.39, 61, 22),
(1011, "Mango Juice 1L", "Best Drinks Mango Juice 1L", 40, 1.49, 61, 22),
(1012, "Apple Juice 1L", "Best Drinks Apple Juice 1L", 30, 1.39, 61, 22),
(1013, "Mix Juice 1L", "Best Drinks Mix Juice 1L", 60, 1.49, 61, 22),
(1014, "Orange Juice 0.5L", "Best Drinks Orange Juice 0.5L", 60, 0.85, 61, 22),
(1015, "Apple Juice 0.5L", "Best Drinks Apple Juice 0.5L", 60, 0.85, 61, 22),
(1016, "Mix Juice 0.5L", "Best Drinks Mix Juice 0.5L", 60, 0.85, 61, 22),
(1017, "Pasta No.1", "Mitsides Pasta No.1", 400, 0.89, 62, 21),
(1018, "Pasta No.2", "Mitsides Pasta No.2", 300, 0.89, 62, 22),
(1019, "Pasta No.3", "Mitsides Pasta No.3", 200, 0.89, 62, 21),
(1020, "Soda Drink 1", "Best Drinks Soda Drink 1", 70, 0.89, 61, 21),
(1021, "Soda Drink 2", "Best Drinks Soda Drink 2", 70, 0.89, 61, 21),
(1022, "Orange Soda Drink", "Best Drinks Orange Soda Drink", 70, 0.89, 61, 21),
(1023, "Cloth Soap 5kg", "Dixan Cloth Soap 5kg", 10, 12.99, 66, 22),
(1024, "Cloth Soap 2L", "Dixan Cloth Soap 2L", 70, 9.89, 66, 22),
(1025, "Cloth Conditioner 2L", "Dixan Cloth Conditioner 2L", 70, 4.89, 66, 22),
(1026, "Apples 1KG", "Farm Fresh Apples 1kg", 10, 2.69, 65, 22),
(1027, "Onions 1KG", "Farm Fresh Onions 1kg", 10, 1.69, 65, 22),
(1028, "Ginger 1KG", "Farm Fresh Ginger 1kg", 10, 2.69, 65, 22),
(1029, "Potatoes 1KG", "Farm Fresh Potatoes 1kg", 10, 0.99, 65, 22),
(1030, "Mangoes 1KG", "Farm Fresh Mangoes 1kg", 70, 3.89, 65, 22),
(1031, "Salad Mix 100g", "Farm Fresh Salad Miz 100g", 20, 2.69, 65, 22),
(1032, "Salad Mix 60g", "Farm Fresh Salad Miz 60g", 20, 1.49, 65, 22),
(1033, "Hand Soap 1L", "Dettol Hand Soap 1L", 200, 4.90, 67, 21),
(1034, "Soap bars", "Dettol Soap Bars", 60, 6.60, 67, 21),
(1035, "Bread Slice 60g", "Bakery Bread Slice 60g", 20, 1.80, 68, 21),
(1036, "Bread Slice 100g", "Bakery Bread Slice 100g", 20, 2.80, 68, 21),
(1037, "Tissue Boxes", "Others Tissue Boxes", 20, 3.10, 70, 21),
(1038, "Kitchen Tissue", "Others Kitchen Tissue", 20, 5.80, 70, 21);

insert into products_categories(
product_id, category_id
)
values
(1001, 300),
(1001, 306),
(1002, 300),
(1003, 300),
(1004, 306),
(1004, 308),
(1005, 306),
(1005, 308),
(1006, 306),
(1006, 308),
(1007, 306),
(1007, 308),
(1008, 306),
(1008, 308),
(1009, 306),
(1009, 308),
(1010, 311),
(1011, 311),
(1012, 311),
(1013, 311),
(1014, 311),
(1015, 311),
(1016, 311),
(1017, 306),
(1018, 306),
(1019, 306),
(1020, 311),
(1021, 311),
(1022, 311),
(1023, 310),
(1024, 310),
(1025, 310),
(1026, 307),
(1027, 307),
(1028, 307),
(1029, 307),
(1030, 307),
(1031, 307),
(1032, 307),
(1033, 301),
(1033, 309),
(1034, 301),
(1034, 309),
(1035, 305),
(1036, 305),
(1037, 301),
(1037, 309),
(1038, 309);

insert into orders(
order_id, order_date, require_date, shipped_date, status, comments, username
)
values
(200, "2022-10-01", "2022-10-01", "2022-10-03", "Done", "", "angel91"),
(201, "2022-10-02", "2022-10-02", "2022-10-03", "Done", "", "phil67"),
(202, "2022-10-05", "2022-10-06", "2022-10-08", "Done", "", "mmich21"),
(203, "2022-10-07", "2022-10-08", "2022-10-10", "Shipped", "", "joedoe"),
(204, "2022-10-08", "2022-10-09", null, "Proccessing", "", "phil67"),
(205, "2022-10-10", "2022-10-11", null, "Proccessing", "", "angel91");

insert into payments(
payment_id, username, order_id, amount, payment_date
)
values
(400, "angel91", 200, 200, "2022-10-01"),
(401, "phil67", 201, 100, "2022-10-02"),
(402, "mmich21", 202, 50, "2022-10-05"),
(403, "joedoe", 203, 89, "2022-10-07"),
(404, "phil67", 204, 68, "2022-10-08"),
(405, "angel91", 205, 134, "2022-10-10");

insert into order_details(
order_id, product_id, quantity, priceperproduct
)
values
(200, 1001, 3, 0.69),
(200, 1023, 1, 12.99),
(200, 1016, 2, 0.85),
(200, 1010, 4, 1.39),
(200, 1006, 6, 1.9),
(200, 1029, 1, 0.99),
(201, 1030, 3, 3.89),
(201, 1033, 1, 1.49),
(201, 1038, 2, 5.8),
(201, 1024, 4, 9.89),
(201, 1017, 6, 0.89),
(201, 1027, 1, 1.69),
(203, 1023, 1, 12.99),
(203, 1016, 2, 0.85),
(203, 1010, 4, 1.39),
(203, 1006, 6, 1.9),
(203, 1029, 1, 0.99),
(203, 1030, 3, 3.89),
(203, 1033, 1, 1.49),
(203, 1038, 2, 5.8),
(203, 1029, 1, 0.99),
(203, 1030, 3, 3.89),
(203, 1003, 1, 2.49),
(203, 1008, 2, 3.5),
(204, 1006, 6, 1.9),
(204, 1029, 1, 0.99),
(204, 1030, 3, 3.89),
(204, 1033, 1, 1.49),
(204, 1038, 2, 5.8),
(204, 1024, 4, 9.89),
(204, 1017, 6, 0.89),
(204, 1027, 1, 1.69),
(204, 1020, 3, 0.89),
(205, 1006, 6, 1.9),
(205, 1029, 1, 0.99),
(205, 1030, 3, 3.89),
(205, 1033, 1, 1.49),
(205, 1038, 2, 5.8),
(205, 1024, 4, 9.89),
(205, 1017, 6, 0.89),
(205, 1027, 1, 1.69),
(205, 1028, 1, 2.69),
(205, 1035, 1, 1.8);

insert into products_views(
username, product_id, views
)
values
("angel91", 1001, 3),
("angel91", 1023, 1),
("angel91", 1016, 2),
("angel91", 1010, 1),
("angel91", 1006, 9),
("angel91", 1029, 9),
("angel91", 1033, 3),
("angel91", 1034, 2),
("phil67", 1030, 3),
("phil67", 1033, 4),
("phil67", 1038, 5),
("phil67", 1024, 4),
("phil67", 1017, 6),
("phil67", 1027, 1),
("phil67", 1014, 7),
("phil67", 1001, 6),
("phil67", 1004, 1),
("mmich21", 1023, 1),
("mmich21", 1016, 2),
("mmich21", 1010, 4),
("mmich21", 1006, 6),
("mmich21", 1029, 5),
("mmich21", 1030, 4),
("mmich21", 1033, 4),
("mmich21", 1038, 2),
("mmich21", 1009, 1),
("mmich21", 1031, 8),
("mmich21", 1003, 49),
("mmich21", 1008, 2),
("joedoe", 1006, 6),
("joedoe", 1029, 9),
("joedoe", 1030, 3),
("joedoe", 1033, 4),
("joedoe", 1038, 8),
("joedoe", 1024, 4),
("joedoe", 1017, 8),
("joedoe", 1027, 1),
("joedoe", 1020, 3),
("gsmith013", 1006, 6),
("gsmith013", 1029, 1),
("gsmith013", 1030, 3),
("gsmith013", 1033, 9),
("gsmith013", 1038, 2),
("gsmith013", 1024, 4),
("gsmith013", 1017, 6),
("gsmith013", 1027, 9),
("gsmith013", 1028, 1),
("gsmith013", 1035, 1);

/*View Tables*/
select * from addresses;
select * from people;
select * from users;
select * from  employees;
select * from vendors;
select * from categories;
select * from brands;
select * from products;
select * from products_categories;
select * from orders;
select * from payments;
select * from order_details;
select * from products_views;


/*Join Query*/
-- View the products that have been seen, how many times and the number of users that have seen them
select p.product_id, p.name, COUNT(pv.views) as total_users_viewed, SUM(pv.views) as total_views
from products p
left join products_views pv
on pv.product_id = p.product_id
group by pv.product_id
order by pv.product_id; 

/*Subquery Query*/
-- View the products that have been seen, but users didn't buy
select distinct pv.product_id, p.name, p.description
from products_views pv
join products p
on p.product_id = pv.product_id
where pv.product_id not in (
	select od.product_id
	from order_details od
);

/*stored function*/
DELIMITER //
CREATE FUNCTION need_stock(stock_quantity int) RETURNS varchar(5) deterministic
BEGIN
 DECLARE needstock varchar(5);
  if stock_quantity <= 20 then
	set needstock = "True";
  elseif stock_quantity > 20 then  
	set needstock = "False";  
  end if;  
  return (needstock);
END //
DELIMITER ;

select p.*, v.*, need_stock(p.stock_quantity)
from products p
join vendors v on v.vendor_id = p.vendor_id;

/*View with 3-4 tables*/
create view products_full_details as
    select p.*, c.*
    from products p
    join vendors v on v.vendor_id = p.vendor_id
    join products_categories pc on pc.product_id = p.product_id
    join categories c on c.category_id = pc.category_id
    order by p.product_id;

/*Query with group by and having*/
-- most popular products
select od.product_id, p.*, od.quantity, sum(od.quantity) as sold_quantity
from products p
right join order_details od
on od.product_id = p.product_id
group by od.product_id
having sum(od.quantity) > 10;
