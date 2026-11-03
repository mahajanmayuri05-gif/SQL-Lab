create database orders;
use orders;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO customers VALUES
(1, 'Amit Sharma', 'amit@gmail.com', 'Mumbai'),
(2, 'Neha Verma', 'neha@gmail.com', 'Pune'),
(3, 'Rahul Mehta', 'rahul@gmail.com', 'Delhi'),
(4, 'Priya Singh', 'priya@gmail.com', 'Bangalore');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Mobile Phone', 'Electronics', 25000.00),
(103, 'Headphones', 'Accessories', 3000.00),
(104, 'Office Chair', 'Furniture', 12000.00);

INSERT INTO orders VALUES
(1001, 1, '2025-01-05', 'Delivered'),
(1002, 2, '2025-01-06', 'Pending'),
(1003, 1, '2025-01-08', 'Cancelled'),
(1004, 3, '2025-01-09', 'Delivered');

INSERT INTO order_details VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1003, 104, 1),
(5, 1004, 101, 1),
(6, 1004, 103, 1);

Select * from customers;
Select * from products;
select * from orders;
Select * from order_details;

-- Display the Product_id and product_name of products whose product_id does not appear in order_details

Select product_id, product_name from products
where product_id not in(
Select product_id from order_details);

-- Display the customer details for customers who have at least one order with status'delivered'.

Select * from customers
where customer_id in(
Select customer_id from orders where status = "delivered");

-- Display products whose price is greater than the price of at least one product in the 'Furniture' category.

Select * from products
where price > any(
Select price from products where category = "Furniture");

-- Display  products whose price is greater than the price of every product in the 'accessories' category.

Select * from products
where price > any(
Select price from products where category = "Accessories");

-- Display order_id,customer_id and order_date fror each customer's earliest order.
Select * from orders 
where (customer_id,order_date) in (
Select customer_id, min(order_date) as oredr_Date from orders
group by customer_id);


-- 1. find the names of customer's who have placed at least one order.

Select customer_name from  customers
where customer_id in(
Select customer_id from orders);

-- 2. Find the product name that have been ordered at least once.

Select product_name from products
where product_id in (
Select product_id from order_details);

-- 3. Find the order_id where the product ordered was laptop
Select order_id from order_details
where product_id in
(Select product_id from products where product_name = "Laptop");

-- 4. find the name of customers who have not placed any order

select customer_name from customers
where customer_id Not in
(Select customer_id from orders);

-- 5. Find the product with highest price

select * from products
Where price = ( select Max(price) from products);

-- 6. find the name of product that were never orders

Select product_name from products
where product_id Not in(
Select product_id from order_details);

-- 7. Find the product that cost more than avg product price.

Select * from products
Where price > ( select avg(price) from products);

-- 8. find order_id that contains product price below 5000.
Select * from order_details
where product_id in(
Select product_id from products where price < 5000);

-- 9. List all the orders placed after the first order placed in the database

Select * from orders
where  order_date >( Select min(order_date) from orders);

-- 10. Find the product with lowest price.
select * from products
Where price = ( select Min(price) from products);
