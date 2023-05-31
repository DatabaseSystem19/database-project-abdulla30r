drop table orders;
drop table products;
drop table books;
drop table sellers;
drop table customers;
drop view allProducts;
drop view orderList;

create table books(
    id NUMBER PRIMARY KEY,
    title varchar(50) not null,
    author varchar(20) not null,
    category varchar(20)
);

create table sellers(
    Seller_id number primary key,
    seller_name varchar(30) not null,
    phone NUMBER not null,
    email varchar(30)
);

create table customers(
    customer_id number PRIMARY key,
    customer_name varchar(30),
    address VARCHAR(50),
    phone number,
    email varchar(30)
);

create table products (
    product_id number primary key,
    book_id number not null,
    seller_id number not null,
    price number not null check (price>0),
    count number not null check (count>=0),
    FOREIGN key (book_id) references books(id),
    FOREIGN key (seller_id) REFERENCEs sellers(seller_id)
);

CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    order_date date DEFAULT SYSDATE,
    product_id NUMBER NOT NULL,
    customer_id NUMBER NOT NULL,
    quantity NUMBER CHECK (quantity > 0),
    total_price NUMERIC(6,2),
    status VARCHAR(20) DEFAULT 'In progress' CHECK (status IN ('In progress', 'Shipped', 'Delivered')),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Creating trigger to update total_price
CREATE OR REPLACE TRIGGER update_total_price
BEFORE INSERT OR UPDATE ON orders
FOR EACH ROW
BEGIN
        SELECT price * :NEW.quantity
        INTO :NEW.total_price
        FROM products
        WHERE product_id = :NEW.product_id;
END;
/

-- Checking Availabity when placing order
CREATE OR REPLACE TRIGGER place_order
BEFORE INSERT ON orders
FOR EACH ROW
DECLARE
    product_quantity NUMBER;
BEGIN
    SELECT count
    INTO product_quantity
    FROM products
    WHERE product_id = :NEW.product_id;

    IF product_quantity < :NEW.quantity THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cannot place order. Stock out.');
    ELSE
        UPDATE products
        SET count = count - :NEW.quantity
        WHERE product_id = :NEW.product_id;
    END IF;
END;
/



