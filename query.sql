-- 1. List all customers who have placed at least one order.
select c.name,o.order_id
from customers as c
inner join orders as o on c.customer_id = o.customer_id;


-- 2. Find the top 5 most expensive products.--
select p.product_name,p.price
from products as p
order by p.price desc
limit 5;


-- 3. Show total number of orders per customer.
select c.name,count(o.order_id) as total_orders
from customers as c
inner join orders as o on c.customer_id = o.customer_id
group by c.name;


-- 4. Display total revenue generated from all orders.

select sum(o.total_amount) as total_revenue
from orders as o;

-- 5. List all orders along with the customer name and total amount.
select o.order_id, c.name, o.total_amount
from customers as c
inner join orders as o on c.customer_id = o.customer_id;

-- 6. Find the total quantity of each product sold.

select p.product_name,sum(oi.quantity) as total_products
from products as p
inner join order_items as oi on p.product_id = oi.product_id
group by p.product_name;


-- 7. Show the most popular product (by quantity sold).

 select p.product_name,sum(oi.quantity) as total_quantity
 from products as p
 inner join order_items as oi on p.product_id = oi.product_id
 group by p.product_name
 order by sum(oi.quantity) desc
 limit 3;


-- 8. List all customers who have never placed an order.

select c.name, o.order_id
from customers as c
left join orders as o on c.customer_id = o.customer_id
where o.order_id is null;


-- 9. Display orders placed in the last 30 days.

select o.order_id,o.order_date
from orders as o
where o.order_date >=curdate() - interval 30 day;

-- 10. Find the average order amount.
select avg(o.total_amount) as avg_amount
from orders as o;

-- 11. Show total sales by category.

select p.category,sum(oi.unit_price) as total_price, sum(oi.quantity) as total_quantity, round(sum(oi.quantity *oi.unit_price) )as total_sales
from products as p
inner join order_items as oi on p.product_id = oi.product_id
group by p.category;



-- 12. Find all payments made using 'Credit Card'.

select sum(p.amount_paid) as total_payments, p.payment_method
from payments as p
where p.payment_method = 'Credit Card';

-- 13. Get total payment amount grouped by payment method.
select sum(p.amount_paid) as total_payments, p.payment_method
from payments as p
group by p.payment_method;


-- 14. List the names of customers who made payments over ₹3000.
select c.name, sum(p.amount_paid) as total_payments
from customers as c
inner join orders as o on c.customer_id = o.customer_id
inner join payments as p on o.order_id = p.order_id
group by c.name
having sum(p.amount_paid) > 3000;

-- 15. Find orders that contain more than one product item.

SELECT o.order_id, COUNT(DISTINCT o.product_id) AS product_count
FROM order_items AS o
GROUP BY o.order_id
HAVING COUNT(DISTINCT o.product_id) > 1;



-- 16. Show the number of orders shipped and their current shipping status.

select count(distinct o.order_id) as total_order, s.shipping_status
from orders as o
inner join shipping as s on o.order_id = s.order_id
group by s.shipping_status;

-- 17. List all orders that have not been delivered yet.

select o.order_id, s.shipping_status
from orders as o
inner join shipping as s on o.order_id = s.order_id
where s.shipping_status != 'Delivered';


-- 18. Show the delivery date of each order along with shipping status.
select s.order_id,s.delivery_date,s.shipping_status
from shipping as s
inner join orders as o on s.order_id = o.order_id;

-- 19. Display customers and the number of products they have purchased.

select c.name, count(distinct oi.product_id) as total_products
from products as p
inner join order_items as oi on p.product_id = oi.product_id
inner join orders as o on oi.order_id = o.order_id
inner join customers as c on o.customer_id = c.customer_id
group by c.name;

-- 20. Find the product with the highest stock remaining.

select product_name, stock_quantity
from products
order by stock_quantity desc
limit 1;


-- 21. Get total sales per month from order_date.
select MONTH(oi.order_date) as Monthwise_sales,sum(o.quantity * o.unit_price) as total_sales
from order_items as o
inner join orders as oi on o.order_id = oi.order_id
where month(oi.order_date) <>12
group by MONTH(oi.order_date)
order by Monthwise_sales asc;


-- 22. Find the average payment amount per customer.

select c.name, avg(p.amount_paid) as avg_amount
from customers as c
inner join orders as o on c.customer_id = o.customer_id
inner join payments as p on o.order_id = p.order_id
group by c.name;

-- 23. Display all orders with their corresponding shipping and payment details.

select o.order_id, s.shipping_status,p.payment_method,p.amount_paid
from orders as o
inner join shipping as s on o.order_id = s.order_id
inner join payments as p on o.order_id = p.order_id;



-- 24. Find out how many products are out of stock.

SELECT COUNT(*) AS out_of_stock_count
FROM products
WHERE stock_quantity = 0;


-- 25. List customers who placed an order and received it within 5 days.

select c.name, o.order_date, s.delivery_date
from customers as c
inner join orders as o on c.customer_id = o.customer_id
inner join shipping as s on o.order_id = s.order_id
where datediff( s.delivery_date, o.order_date) <= 5;
