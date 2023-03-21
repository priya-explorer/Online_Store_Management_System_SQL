DROP DATABASE online_store;

CREATE DATABASE online_store;
USE online_store;

-- CREATE TABLES 

CREATE TABLE user( 
	user_id INT NOT NULL,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15),
    gender VARCHAR(6),
    email VARCHAR(30) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    address VARCHAR(30),
    city VARCHAR(10),
    country VARCHAR(15),
    PRIMARY KEY(user_id),
    CONSTRAINT UC_email UNIQUE (email),
    CONSTRAINT UC_number UNIQUE(phone_number)
	);

ALTER TABLE user 
MODIFY	phone_number VARCHAR(25) NOT NULL;

DESCRIBE USER;

CREATE TABLE product(
	product_id INT NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(15) NOT NULL,
    unit_price FLOAT NOT NULL,
    PRIMARY KEY (product_id)
    );
    
ALTER TABLE product 
MODIFY category VARCHAR(25) NOT NULL;

DESCRIBE product;

CREATE TABLE orders(
	order_id INT NOT NULL,
    user_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(10),
    
    PRIMARY KEY(order_id),
    FOREIGN KEY(user_id) REFERENCES user(user_id)
);

DESCRIBE orders;

SHOW TABLES;

CREATE TABLE order_item(
	item_id INT NOT NULL,
	order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price FLOAT NOT NULL,
    amount FLOAT NOT NULL,
    
    PRIMARY KEY(item_id),
    
    FOREIGN KEY(order_id)
    REFERENCES orders(order_id),
    
    FOREIGN KEY(product_id)
    REFERENCES product(product_id)
);

DESCRIBE order_item;

CREATE TABLE invoice(
	invoice_id INT NOT NULL,
    order_id INT NOT NULL,
    invoice_date DATE NOT NULL,
    
    PRIMARY KEY(invoice_id),
    
    FOREIGN KEY(order_id)
    REFERENCES orders(order_id)
);

DESCRIBE invoice;

CREATE TABLE payment(
	payment_id INT NOT NULL,
    invoice_id INT NOT NULL,
    payment_amount FLOAT NOT NULL,
    payment_date DATE NOT NULL,
    payment_status VARCHAR(8),
    payment_method VARCHAR(15),
    
    PRIMARY KEY(payment_id),
    
    FOREIGN KEY(invoice_id)
    REFERENCES invoice(invoice_id)
);

DESCRIBE payment;

CREATE TABLE shipment(
	shipment_id INT NOT NULL,
    order_id INT NOT NULL,
    invoice_id INT NOT NULL,
    shipment_date DATE NOT NULL,
    shipment_status VARCHAR(9) NOT NULL,
	PRIMARY KEY(shipment_id)
);
    
DESCRIBE shipment;

 ALTER TABLE shipment  
 ADD CONSTRAINT FK_shipment_order
 FOREIGN KEY(order_id) 
 REFERENCES orders(order_id);
 
ALTER TABLE shipment
ADD CONSTRAINT FK_shipment_invoice
FOREIGN KEY(invoice_id)
REFERENCES invoice(invoice_id);
    
DESCRIBE shipment;

SHOW TABLES;
