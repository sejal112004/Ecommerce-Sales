drop database if exists Ecommerce_sales;

create database Ecommerce_sales;
use Ecommerce_sales;

show tables;

##customer table

create table customers(
customer_id int primary key,
name varchar(50) not null,
gender varchar(10) not null,
age int not null,
email varchar(50) not null,
phone varchar(15),
address varchar (150)
);

## Product table

create table products(
product_id int primary key auto_increment,
product_name varchar(100),
category varchar(50),
price decimal(10,2),
stock_quantity int
);


create table orders(
order_id int primary key auto_increment,
customer_id int,
order_date date,
total_amount decimal(10,2),
Foreign key (customer_id) REFERENCES customers(customer_id)
);

create table order_items(
order_item_id int primary key auto_increment,
order_id int,
product_id int,
quantity int,
unit_price decimal(10,2),
FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);


create table payments(
payment_id int primary key auto_increment,
order_id int,
payment_date date,
payment_method varchar(50),
amount_paid decimal(10,2),
Foreign key (order_id) references orders(order_id) on delete cascade 
);

create table shipping(
shipping_id int primary key auto_increment,
order_id int,
shipping_date date,
shipping_address varchar(100),
delivery_date date,
shipping_status varchar(50) default 'Pending',
Foreign key (order_id) references orders(order_id) on delete cascade
);