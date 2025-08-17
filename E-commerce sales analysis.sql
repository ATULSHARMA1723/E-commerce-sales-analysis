drop table if exists Customers;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    signup_date DATE
);

drop table if exists Products;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

drop table if exists Orders;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


drop table if exists OrderDetails;

CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


select * from Customers;
select * from Products;
select * from Orders;
select * from OrderDetails;

INSERT INTO Customers VALUES
(1, 'Ajay', 'Sharma', 'ajay@email.com', 'Delhi', 'India', '2025-01-15'),
(2, 'Neha', 'Verma', 'neha@email.com', 'Mumbai', 'India', '2025-02-10'),
(3, 'John', 'Smith', 'john@email.com', 'New York', 'USA', '2024-12-05');

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 70000),
(102, 'Smartphone', 'Electronics', 30000),
(103, 'Headphones', 'Accessories', 2000),
(104, 'Office Chair', 'Furniture', 8000);

INSERT INTO Orders VALUES
(1001, 1, '2025-03-01'),
(1002, 2, '2025-03-05'),
(1003, 1, '2025-03-10'),
(1004, 3, '2025-03-15');

INSERT INTO OrderDetails VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1003, 104, 1),
(5, 1004, 103, 3);


--top 5 highest revenue-generating products

select p.product_name, sum(p.price * d.quantity) as total_rev
from products p
join
	 orderdetails d
on p.product_id=d.product_id
group by p.product_name
order by total_rev desc
limit 5;


--customers who spent the most in the last 6 months

SELECT c.first_name, c.last_name, SUM(od.quantity * p.price) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE o.order_date >= CURRENT_DATE - INTERVAL '6 months'
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 10;

--Monthly sales trend

SELECT DATE_TRUNC('month', o.order_date) AS month, 
       SUM(od.quantity * p.price) AS total_sales
FROM Orders o
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
GROUP BY month
ORDER BY month;

--Customer churn analysis (customers who didn’t order in last 3 months)

SELECT c.customer_id, c.first_name, c.last_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM Orders
    WHERE order_date >= CURRENT_DATE - INTERVAL '3 months'
);

--Rank categories by sales (using Window Function)

SELECT category, 
       SUM(od.quantity * p.price) AS category_revenue,
       RANK() OVER (ORDER BY SUM(od.quantity * p.price) DESC) AS category_rank
FROM Products p
JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY category;

	   






