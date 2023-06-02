INSERT INTO books (id, title, author, category) VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction');
INSERT INTO books (id, title, author, category) VALUES
(2, '1984', 'George Orwell', 'Science Fiction');
INSERT INTO books (id, title, author, category) VALUES
(3, 'Pride and Prejudice', 'Jane Austen', 'Romance');
INSERT INTO books (id, title, author, category) VALUES
(4, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic');
INSERT INTO books (id, title, author, category) VALUES
(5, 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fantasy');
INSERT INTO books (id, title, author, category) VALUES
(6, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction');
INSERT INTO books (id, title, author, category) VALUES
(7, 'To the Lighthouse', 'Virginia Woolf', 'Classic');
INSERT INTO books (id, title, author, category) VALUES
(8, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy');
INSERT INTO books (id, title, author, category) VALUES
(9, 'The Alchemist', 'Paulo Coelho', 'Self-Help');
INSERT INTO books (id, title, author, category) VALUES
(10, 'The Odyssey', 'Homer', 'Classic');


INSERT INTO sellers (Seller_id, seller_name, phone, email) VALUES
(1001, 'ABC Books', '1234567890', 'abcbooks@example.com');
INSERT INTO sellers (Seller_id, seller_name, phone, email) VALUES
(1002, 'XYZ Bookstore', '9876543210', 'xyzbookstore@example.com');
INSERT INTO sellers (Seller_id, seller_name, phone, email) VALUES
(1003, 'Book Haven', '5555555555', 'bookhaven@example.com');
INSERT INTO sellers (Seller_id, seller_name, phone, email) VALUES
(1004, 'Readers Paradise', '9999999999', 'readersparadise@example.com');
INSERT INTO sellers (Seller_id, seller_name, phone, email) VALUES
(1005, 'Bookworm Emporium', '1111111111', 'bookwormemporium@example.com');


INSERT INTO customers (customer_id, customer_name, address, phone, email) VALUES
(5001, 'John Doe', '123 Main St, City', '9832103210', 'johndoe@example.com');
INSERT INTO customers (customer_id, customer_name, address, phone, email) VALUES
(5002, 'Jane Smith', '456 Oak St, Town', '5598754378', 'janesmith@example.com');
INSERT INTO customers (customer_id, customer_name, address, phone, email) VALUES
(5003, 'Mike Johnson', '789 Elm St, Village', '4321567890', 'mikejohnson@example.com');
INSERT INTO customers (customer_id, customer_name, address, phone, email) VALUES
(5004, 'Emily Davis', '789 Walnut St, Town', '5673349999', 'emilydavis@example.com');
INSERT INTO customers (customer_id, customer_name, address, phone, email) VALUES
(5005, 'David Wilson', '321 Pine St, City', '1156731111', 'davidwilson@example.com');
INSERT INTO customers (customer_id, customer_name, address, phone, email) VALUES
(5006, 'Sherlock Holmes', '221B Becker St, City', '198456721', 'sherlockholmes@detective.com');


INSERT INTO products (product_id, book_id, seller_id, price, count) VALUES
(3001, 1, 1001, 20.99, 50);
INSERT INTO products (product_id, book_id, seller_id, price, count) VALUES
(3002, 2, 1002, 15.99, 30);
INSERT INTO products (product_id, book_id, seller_id, price, count) VALUES
(3003, 3, 1003, 12.50, 20);
INSERT INTO products (product_id, book_id, seller_id, price, count) VALUES
(3004, 4, 1004, 18.75, 15);
INSERT INTO products (product_id, book_id, seller_id, price, count) VALUES
(3005, 5, 1005, 9.99, 40);
INSERT INTO products (product_id, book_id, seller_id, price, count) VALUES
(3006, 6, 1001, 9.99, 25);
INSERT INTO products (product_id, book_id, seller_id, price, count) VALUES
(3007, 7, 1002, 14.50, 15);
INSERT INTO products (product_id, book_id, seller_id, price, count) VALUES
(3008, 8, 1003, 19.99, 35);
INSERT INTO products (product_id, book_id, seller_id, price, count) VALUES
(3009, 9, 1004, 10.99, 50);
INSERT INTO products (product_id, book_id, seller_id, price, count) VALUES
(3010, 10, 1005, 8.99, 10);
INSERT INTO products (product_id, book_id, seller_id, price, count) VALUES
(3011, 1, 1005, 25.50, 20);
INSERT INTO products (product_id, book_id, seller_id, price, count) VALUES
(3012, 2, 1003, 12.75, 30);
INSERT INTO products (product_id, book_id, seller_id, price, count) VALUES
(3013, 3, 1004, 7.99, 45);
INSERT INTO products (product_id, book_id, seller_id, price, count) VALUES
(3014, 4, 1002, 16.99, 5);
INSERT INTO products (product_id, book_id, seller_id, price, count) VALUES
(3015, 5, 1001, 11.50, 25);


INSERT INTO orders (order_id, product_id, customer_id, quantity,order_date) VALUES (7001, 3001, 5001, 2,date '2023-05-25');
INSERT INTO orders (order_id, product_id, customer_id, quantity,order_date) VALUES (7002, 3002, 5002, 1,date '2023-03-21');
INSERT INTO orders (order_id, product_id, customer_id, quantity,order_date) VALUES (7003, 3003, 5003, 3,date '2023-05-15');
INSERT INTO orders (order_id, product_id, customer_id, quantity,order_date) VALUES (7004, 3004, 5004, 1,date '2023-04-20');
INSERT INTO orders (order_id, product_id, customer_id, quantity,order_date) VALUES (7008, 3014, 5004, 2,date '2023-05-18');
INSERT INTO orders (order_id, product_id, customer_id, quantity) VALUES (7005, 3005, 5002, 4);
INSERT INTO orders (order_id, product_id, customer_id, quantity,order_date) VALUES (7006, 3003, 5005, 4,date '2023-05-15');
INSERT INTO orders (order_id, product_id, customer_id, quantity,order_date) VALUES (7007, 3013, 5004, 5,date '2023-04-28');
INSERT INTO orders (order_id, product_id, customer_id, quantity,order_date) VALUES (7009, 3005, 5005, 2,date '2023-05-10');

drop view allProducts;
drop view orderList;


--Show table name
select table_name from user_tables;

--Basic Update Query
update orders set status = 'Shipped' where order_date< date '2023-05-24';
UPDATE orders SET status = 'Delivered' WHERE EXTRACT(MONTH FROM order_date) < 5;

--Basic Select Query with where condition
select * from customers where customer_id=5001;

--Select query (Nested)
Select * from books where id = (select book_id from products where product_id = (select product_id from orders where order_id = 7001));

--Aggregate function
--total_sell of this shop
select SUM(total_price) from orders;

--the product which has earns highest money
select product_id,tot from(select product_id,sum(total_price) as tot from orders group by product_id)
where tot = 
(select max(sum(total_price)) from orders group by product_id);

--using having
select product_id,sum(total_price) as total_sell from orders group by product_id having sum(total_price) = (select max(sum(total_price)) from orders group by product_id);

--the customer who hasn't ordered any product yet (using in)
select * from customers where customer_id not in (select customer_id from orders);

--string operation
select * from customers where email like '%@example.com';

--exist (those customer who has ordered 2 or quantity.
select * from customers where exists (select * from orders where quantity >2 and orders.customer_id=customers.customer_id);

--natural join
select * from orders natural join customers;

--join
select * from orders join customers on orders.customer_id=customers.customer_id;

--Creating View of AllProducts
create view allProducts as 
    select products.product_id,books.title,products.price,sellers.seller_name,products.count as stock from 
    books join products on books.id = products.book_id join sellers on sellers.seller_id= products.seller_id;

--Creating view of orderList
create view OrderList as 
    select orders.order_id, allProducts.title,allproducts.price,orders.quantity,orders.total_price,
    customers.customer_name,allproducts.seller_name, orders.status, orders.order_date from 
    allProducts join orders on allProducts.product_id = orders.product_id 
    join customers on customers.customer_id = orders.customer_id;
