-- Question 1 Achieving 1NF (First Normal Form)
-- Write an SQL query to transform this table into 1NF, ensuring that each row represents a single product for an order

create database products;
use products;

create table orders(
orderId int primary key auto_increment,
customerName varchar(50),
products varchar(100)
);

insert into orders(customerName,  products)
values("John Doe", "laptop, mouse"), ("Jane Smith", "tablet, keyboard, mouse"), ("Emily Clark", "phone");

alter table orders
drop column products;

create table products(
productId int primary key auto_increment,
name varchar(50),
orderId int,
foreign key(orderId) references orders(orderId)
); 

insert into products(name, orderId)
values("laptop", 1), ("mouse", 1), ("tablet", 2), ("keyboard", 2), ("mouse", 2), ("phone", 3);

-- Question 2 Achieving 2NF (Second Normal Form)
-- Write an SQL query to transform this table into 2NF by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.
create database tester;
use tester;

create table customer(
customer_id int primary key auto_increment,
name varchar(20)
); 

insert into customer(name)
values("John Doe"), ("Jane Smith"), ("Emily Clark");

create table product(
product_id int primary key auto_increment,
name varchar(20)
);

insert into product(name)
values("Laptop"), ("Mouse"), ("Tablet"), ("Keyboard"), ("Phone");

create table orderz(
Id int primary key auto_increment,
customer_id int,
product_id int,
quantity int
);


insert into orderz(customer_id, product_id, quantity)
values(1, 1, 2), (1, 2, 1), (2, 2, 2), (2, 3, 3), (2, 4, 1), (3, 5, 1);
