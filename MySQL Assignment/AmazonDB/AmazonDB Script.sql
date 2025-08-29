-- Create Database Name: AmazonDB
CREATE DATABASE AmazonDB;

USE AmazonDB;

-- create table Users:
CREATE TABLE users (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(150) UNIQUE NOT NULL,
	registered_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	membership ENUM('Basic', 'Prime') DEFAULT 'Basic'
);

-- Create Table Products:
CREATE TABLE products(
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(100) NOT NULL,
    stock INT NOT NULL
);

-- Create table Orders:
CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
FOREIGN KEY (user_id) REFERENCES users(user_id),
order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
total_amount DECIMAL(10,2) NOT NULL
);

-- Create table OrderDetails:
create table order_details(
	order_details_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,    
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)    
);

-- DATA INSERTION:
-- Insert Values into Users:
INSERT INTO users (name, email, registered_date, membership) VALUES
('Alice Johnson', 'alice.j@example.com', '2024-01-15', 'Prime'),
('Bob Smith', 'bob.s@example.com', '2024-02-01', 'Basic'),
('Charlie Brown', 'charlie.b@example.com', '2024-03-10', 'Prime'),
('Daisy Ridley', 'daisy.r@example.com', '2024-04-12', 'Basic');

-- Insert Values into Products:
INSERT INTO products (name, price, category, stock) VALUES
('Echo Dot', 49.99, 'Electronics', 120),
('Kindle Paperwhite', 129.99, 'Books', 50),
('Fire Stick', 39.99, 'Electronics', 80),
('Yoga Mat', 19.99, 'Fitness', 200),
('Wireless Mouse', 24.99, 'Electronics', 150);

-- Insert Values into Orders:
INSERT INTO orders (user_id, order_date, total_amount) VALUES
(1, '2024-05-01', 79.98),
(2, '2024-05-03', 129.99),
(1, '2024-05-04', 49.99),
(3, '2024-05-05', 24.99),
(4, '2025-08-05', 24.99);

-- Insert Values into OrderDetails:
INSERT INTO order_details (order_id, product_id, quantity) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 1, 1),
(4, 5, 1);

CREATE TABLE ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    user_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO ratings (product_id, user_id, rating) VALUES
(1, 101, 5),
(1, 102, 4),
(1, 103, 5),
(2, 104, 3),
(2, 105, 4),
(3, 106, 5),
(3, 107, 4),
(4, 108, 5),
(5, 109, 4),
(5, 110, 5);

select * from users;
select * from products;
select * from orders;
select * from order_details;