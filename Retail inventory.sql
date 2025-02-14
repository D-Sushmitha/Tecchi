RETAIL INVENTORY MANAGEMENT:-

CREATE DATABASE RetailDB;
USE RetailDB;

CREATE TABLE Products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL CHECK (stock >= 0)
);
desc Products;

CREATE TABLE Suppliers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    contact VARCHAR(50)
);
desc Suppliers;

CREATE TABLE Sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    date DATE NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(id)
);
desc Sales;

INSERT INTO Products (name, price, stock) VALUES
('Laptop', 1200.00, 15),
('Mouse', 25.50, 50),
('Keyboard', 45.00, 30),
('Monitor', 200.00, 8),
('Printer', 150.00, 5);
select * from Products;

INSERT INTO Suppliers (name, contact) VALUES
('Tech Supplier Ltd', 'tech@supplier.com'),
('Office Essentials', 'office@essentials.com');
select * from Suppliers;

INSERT INTO Sales (product_id, date, quantity, total_price) VALUES
(1, '2024-02-01', 2, 2400.00),
(2, '2024-02-03', 5, 127.50),
(3, '2024-02-05', 3, 135.00),
(4, '2024-02-10', 1, 200.00),
(5, '2024-02-12', 2, 300.00);
select * from Sales;

SELECT * FROM Products WHERE stock < 10;

SELECT 
    Sales.id, 
    Products.name AS product_name, 
    Sales.date, 
    Sales.quantity, 
    Sales.total_price 
FROM Sales
JOIN Products ON Sales.product_id = Products.id;

SELECT 
    Products.name AS product_name, 
    SUM(Sales.total_price) AS total_sales 
FROM Sales
JOIN Products ON Sales.product_id = Products.id
GROUP BY Products.name
ORDER BY total_sales DESC;