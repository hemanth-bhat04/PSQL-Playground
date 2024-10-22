CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

INSERT INTO customers (customer_id, customer_name, city, signup_date) VALUES
(1, 'Alice Johnson', 'New York', '2023-01-15'),
(2, 'Bob Smith', 'Los Angeles', '2022-12-10'),
(3, 'Charlie Brown', 'Chicago', '2023-02-20'),
(4, 'Diana Prince', 'New York', '2023-03-05'),
(5, 'Ethan Hunt', 'Miami', '2023-01-30');

INSERT INTO orders (order_id, customer_id, order_date, order_amount) VALUES
(1, 1, '2023-01-20', 150.00),
(2, 1, '2023-02-15', 200.00),
(3, 2, '2023-01-10', 300.00),
(4, 3, '2023-03-10', 250.00),
(5, 4, '2023-03-15', 400.00),
(6, 5, '2023-01-25', 100.00),
(7, 1, '2023-03-20', 50.00);
INSERT INTO orders (order_id, customer_id, order_date) VALUES
(8,1,'2023-02-27');
SELECT c.customer_name, COUNT(o.order_id) AS total_orders, SUM(o.order_amount) AS total_amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

SELECT c.customer_name, SUM(o.order_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING SUM(o.order_amount) > 200;

SELECT customer_name, signup_date
FROM customers
WHERE signup_date >= '2023-01-01' AND signup_date < '2024-01-01';

SELECT c.city, AVG(o.order_amount) AS average_order_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city;

select coalesce(order_amount,0) from orders;

INSERT INTO customers (customer_id, customer_name, signup_date) VALUES
(6, 'Hemanth', '2023-01-15');

select coalesce(city,'city not provided') from customers;

select now();

select now()::date;

select now()::time;

select now() - interval '10 years';

select now() + interval '10 days';

select extract(year from now());

select order_id,order_amount, age(now(),order_date) as ordered from orders;



 

