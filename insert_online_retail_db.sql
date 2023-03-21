SET FOREIGN_KEY_CHECKS=0;
SET GLOBAL FOREIGN_KEY_CHECKS=0;

SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = TRUE;

USE online_store;
SHOW TABLES;

LOAD DATA LOCAL INFILE "C:/Users/priya/OneDrive/Desktop/user1.csv" INTO TABLE user
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

select * FROM user 
order by first_name desc;

UPDATE user 
SET address = '18 Soloman Road'
WHERE user_id=12347;

UPDATE user
SET gender='male'
WHERE user_id = 12367;

UPDATE user
SET gender = 'Male'
WHERE user_id=12389;

UPDATE user
SET gender = 'Female'
WHERE user_id=12408;

UPDATE user
SET email = 'slefleming@yahoo.com'
WHERE user_id=12385;

select * FROM user 
order by first_name desc;

LOAD DATA LOCAL INFILE "C:/Users/priya/OneDrive/Desktop/product.csv" INTO TABLE product
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

SELECT * FROM product;

UPDATE product
SET category = 'baking essential'
WHERE product_id BETWEEN 16 AND 28;

UPDATE product
SET category = 'decor'
WHERE product_id BETWEEN 91 AND 101;

UPDATE product
SET category = 'kitchen essential'
WHERE product_id BETWEEN 116 AND 118;

UPDATE product
SET category = 'wall decor'
WHERE product_id BETWEEN 132 AND 137;

UPDATE product
SET category = 'travel essential'
WHERE product_id BETWEEN 155 AND 164;

SELECT * FROM product;

LOAD DATA LOCAL INFILE "C:/Users/priya/OneDrive/Desktop/orders.csv" INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM orders;

LOAD DATA LOCAL INFILE "C:/Users/priya/OneDrive/Desktop/order_item.csv"
INTO TABLE order_item
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM order_item;

LOAD DATA LOCAL INFILE "C:/Users/priya/OneDrive/Desktop/invoice.csv"
INTO TABLE invoice
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM invoice;

LOAD DATA LOCAL INFILE "C:/Users/priya/OneDrive/Desktop/payment.csv"
INTO TABLE payment
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM payment;

LOAD DATA LOCAL INFILE "C:/Users/priya/OneDrive/Desktop/shipment1.csv"
INTO TABLE shipment
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM shipment;

SET FOREIGN_KEY_CHECKS=1;
SET GLOBAL FOREIGN_KEY_CHECKS=1;

-- To see invoice of the year 2021
USE online_store;
SELECT * from invoice;
SELECT * FROM invoice
WHERE YEAR(invoice_date) =2021 ;

SELECT * FROM order_item;

-- Group the data by users and their order id. To view the sales and the top customers
SELECT orders.user_id, order_item.order_id, count(order_item.product_id) as 'product_count', sum(amount) as 'total_amount'
FROM orders, order_item
WHERE orders.order_id = order_item.order_id
GROUP BY  orders.user_id, order_item.order_id
ORDER BY total_amount DESC;











