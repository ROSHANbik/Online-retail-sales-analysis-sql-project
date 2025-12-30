-- Create the database
CREATE DATABASE OnlineRetail;
USE OnlineRetail;
/* total data use in online-retail
   customers
   products
   orders
   pyment
   feedback */
   
--  Customers table
CREATE TABLE Customers (
    customer_id INT  PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255) NOT NULL
    
);
describe customers;

INSERT INTO Customers VALUES
(1,'John doe', 'johndoe@email.com', '1234567890', 'kalyan'),
(2,'summet gupta', 'summetgupta@email.com', '2345678901', 'main kalyan'),
(3,'Rohan yaane ', 'rohan@email.com', '3456789012', 'kalva station'),
(4,'Rohit jaiswar', 'rohitjaiswar@email.com', '4567890123', 'mumbai'),
(5,'karan purwani', 'karanpurwani@email.com', '5678901234', 'ulhanagar'),
(6,'Sarah baane', 'sarah@email.com', '6789012345', 'main road mumbra'),
(7,'Dev rohit', 'devrohit@email.com', '7890123456', '17 section '),
(8,'Jessica parwani ', 'jessicap@email.com', '8901234567', 'titawala'),
(9,'Aman gupta', 'amangupta@email.com', '9012345678', 'diva station'),
(10,'Muskan puswani', 'muskan@email.com', '0123456789', 'shahad'),
(11,'Sahil yadav', 'sahil@email.com', '1122334455', 'ot section'),
(12,'Reet sonia', 'reet@email.com', '2233445566', 'karjat'),
(13,'Krisha lulla', 'krisha@email.com', '3344556677', 'badalapur'),
(14,'Vinit hajari', 'vinit@email.com', '4455667788', 'karjat main road'),
(15,'Kalu mane', 'kalu@email.com', '5566778899', 'ulhasnagar-1');

SELECT *FROM customers;

--  Products table

CREATE TABLE Products (
    product_id INT  PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    category VARCHAR(50)
    
);
DESCRIBE Products;


INSERT INTO Products  VALUES
(1,'Smartphone X', 'Latest model with 128GB storage', 799.99, 50, 'Electronics'),
(2,'Wireless Earbuds', 'Noise cancelling Bluetooth earbuds', 129.99, 100, 'Electronics'),
(3,'Laptop Pro', '15-inch, 16GB RAM, 512GB SSD', 1299.99, 30, 'Electronics'),
(4,'Smart Watch', 'Fitness tracking and notifications', 199.99, 75, 'Electronics'),
(5,'Digital Camera', '24MP with 4K video recording', 449.99, 40, 'Electronics'),
(6,'Running Shoes', 'Lightweight and breathable', 89.99, 200, 'Fashion'),
(7,'Denim Jeans', 'Slim fit, stretchable fabric', 59.99, 150, 'Fashion'),
(8,'Winter Jacket', 'Waterproof with fleece lining', 129.99, 80, 'Fashion'),
(9,'Backpack', '30L capacity with USB charging port', 49.99, 120, 'Accessories'),
(10,'Coffee Maker', 'Programmable 12-cup machine', 79.99, 60, 'Home'),
(11,'Air Fryer', '3.5L capacity with digital display', 99.99, 45, 'Home'),
(12,'Blender', '1000W professional grade', 69.99, 70, 'Home'),
(13,'Yoga Mat', 'Non-slip, 6mm thick', 29.99, 180, 'Sports'),
(14,'Dumbbell Set', 'Adjustable 5-50 lbs weights', 149.99, 25, 'Sports'),
(15,'Smart Speaker', 'Voice assistant with premium sound', 119.99, 90, 'Electronics');

SELECT *FROM Products;

--  Orders table

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date varchar(255),
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Processing',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
DESCRIBE Orders;

INSERT INTO Orders VALUES
(1,1, '2023-01-15 ', 799.99, 'Delivered'),
(2,2, '2023-01-16 ', 129.99, 'Delivered'),
(3,3, '2023-01-17 ', 1299.99, 'Shipped'),
(4,4, '2023-01-18 ', 199.99, 'Processing'),
(5,5, '2023-01-19 ', 449.99, 'Shipped'),
(6,6, '2023-01-20 ', 89.99, 'Delivered'),
(7,7, '2023-01-21 ', 59.99, 'Delivered'),
(8,8, '2023-01-22 ', 129.99, 'Shipped'),
(9,9, '2023-01-23 ', 49.99, 'Delivered'),
(10,10, '2023-01-24 ', 79.99, 'Processing'),
(11,11, '2023-01-25 ', 99.99, 'Delivered'),
(12,12, '2023-01-26 ', 69.99, 'Shipped'),
(13,13, '2023-01-27 ', 29.99, 'Delivered'),
(14,14, '2023-01-28 ', 149.99, 'Processing'),
(15,15, '2023-01-29 ', 119.99, 'Shipped');

SELECT*FROM Orders;

--  Feedback table

CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
DESCRIBE Feedback;

INSERT INTO Feedback  VALUES
(1, 1, 1, 5, 'Excellent phone, great camera!'),
(2, 2, 1, 4, 'Good sound quality, battery could be better'),
(3, 3, 2, 5, 'Perfect for my work needs'),
(4, 4, 2, 3, 'Nice features but battery drains quickly'),
(5, 5, 3, 4, 'Takes amazing photos'),
(6, 6, 3, 5, 'Very comfortable running shoes'),
(7, 7, 4, 4, 'Good fit but color fades after wash'),
(8, 8, 4, 5, 'Super warm for winter'),
(9, 9, 5, 3, 'Could have more compartments'),
(10, 10, 5, 4, 'Makes great coffee'),
(11, 11, 6, 5, 'Healthy cooking made easy'),
(12, 12, 6, 4, 'Powerful blender for smoothies'),
(13, 13, 7, 5, 'Perfect thickness for yoga'),
(14, 14, 7, 3, 'Heavier than expected'),
(15, 15, 8, 5, 'Amazing sound quality');

SELECT * FROM Feedback;



--  Payments table
CREATE TABLE Payments (
    payment_id INT  PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date DATETIME NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    transaction_status VARCHAR(20) DEFAULT 'Completed',
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
DESCRIBE Payments;

INSERT INTO Payments  VALUES
(101,1, '2023-01-15 10:35:00', 799.99, 'Credit Card', 'Completed'),
(102,2, '2023-01-16 11:50:00', 129.99, 'Debit Card', 'Completed'),
(103,3, '2023-01-17 09:20:00', 1299.99, 'Credit Card', 'Completed'),
(104,4, '2023-01-18 14:30:00', 199.99, 'PayPal', 'Completed'),
(105,5, '2023-01-19 16:40:00', 449.99, 'Credit Card', 'Completed'),
(106,6, '2023-01-20 13:15:00', 89.99, 'Debit Card', 'Completed'),
(107,7, '2023-01-21 10:30:00', 59.99, 'Apple Pay', 'Completed'),
(108,8, '2023-01-22 11:45:00', 129.99, 'Credit Card', 'Completed'),
(109,9, '2023-01-23 16:00:00', 49.99, 'Google Pay', 'Completed'),
(110,10, '2023-01-24 17:05:00', 79.99, 'Credit Card', 'Pending'),
(111,11, '2023-01-25 12:35:00', 99.99, 'Debit Card', 'Completed'),
(112,12, '2023-01-26 14:50:00', 69.99, 'PayPal', 'Completed'),
(113,13, '2023-01-27 09:25:00', 29.99, 'Credit Card', 'Completed'),
(114,14, '2023-01-28 10:40:00', 149.99, 'Apple Pay', 'Pending'),
(115,15, '2023-01-29 13:55:00', 119.99, 'Credit Card', 'Completed');

SELECT*FROM Payments;



-- formulas   table for payment


select transaction_status 
from payments
where transaction_status ='Pending';

                                               -- ye dono ke  bichha ka find of dates 
select payment_date, amount,payment_method
from payments
where  payment_date between '2023-01-15' and '2023-01-19' and payment_method= 'Credit Card';



-- formula of table name is products

select product_name, price, stock_quantity, category
from Products
where stock_quantity between 50 and 100 order by price asc ;

 -- Q which product high prce 
select max(price)  as high_price
from Products;


-- this customers table 

select count(customer_name) as total_customer
from Customers;

-- count of R names in table data
select customer_name
from Customers
where customer_name like 'R%';







-- this order table fomulas 

SELECT order_id, customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY order_id, customer_id
ORDER BY total_spent desc
LIMIT 5;


