use mysql;
create database online_book_store;
use online_book_store;

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255),
    house_number VARCHAR(10),
    street_name VARCHAR(200),
    additional_address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(15),
    contact VARCHAR(15)
);

CREATE TABLE Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_Fname VARCHAR(255),
    author_lname VARCHAR(255),
    qualification VARCHAR(255)
);


CREATE TABLE Publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255),
    country VARCHAR(50)
);

CREATE TABLE Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    book_title VARCHAR(255),
    author_id INT,
    publisher_id INT,
    book_price DECIMAL(10, 2),
    book_status VARCHAR(20),
    subject VARCHAR(50),
    FOREIGN KEY (author_id) REFERENCES Author(author_id),
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
);

CREATE TABLE Order_Details (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

CREATE TABLE Order_Book (
    order_id INT,
    book_id INT,
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES Order_Details(order_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);
CREATE TABLE Makes (
    order_id INT,
    customer_id INT,
    PRIMARY KEY (order_id, customer_id),
    FOREIGN KEY (order_id) REFERENCES Order_Details(order_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
CREATE TABLE Written_By (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

CREATE TABLE Publish (
    book_id INT,
    publisher_id INT,
    PRIMARY KEY (book_id, publisher_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
);
show tables;

drop table Order_Details;
INSERT INTO Customer (customer_name, house_number, street_name, additional_address, city, state, postal_code, contact)
VALUES
    ('Ravi Patel', '101', 'Gandhi Road', 'Apartment 1A', 'Mumbai', 'Maharashtra', '400001', '+91 9876543210'),
    ('Priya Sharma', '203', 'Nehru Nagar', '', 'Delhi', 'Delhi', '110001', '+91 8765432109'),
    ('Amit Singh', '305', 'Rajendra Avenue', 'Flat B', 'Kolkata', 'West Bengal', '700001', '+91 7654321098'),
    ('Sunita Gupta', '407', 'Tagore Street', '', 'Bangalore', 'Karnataka', '560001', '+91 6543210987'),
    ('Vijay Kumar', '509', 'Gandhi Chowk', 'House 5B', 'Chennai', 'Tamil Nadu', '600001', '+91 5432109876'),
    ('Anjali Verma', '611', 'Bose Lane', 'Apartment C', 'Hyderabad', 'Telangana', '500001', '+91 4321098765'),
    ('Sanjay Shah', '713', 'Patel Nagar', '', 'Ahmedabad', 'Gujarat', '380001', '+91 3210987654'),
    ('Neha Joshi', '815', 'Bhagat Singh Road', 'Flat D', 'Pune', 'Maharashtra', '411001', '+91 2109876543'),
    ('Rajesh Kumar', '917', 'Lal Bahadur Path', '', 'Jaipur', 'Rajasthan', '302001', '+91 1098765432'),
    ('Pooja Mishra', '1019', 'Indira Street', 'House 10E', 'Lucknow', 'Uttar Pradesh', '226001', '+91 0987654321');
select * from Customer;
INSERT INTO Publisher (publisher_name, country)
VALUES
    ('Penguin India', 'India'),
    ('HarperCollins India', 'India'),
    ('Rupa Publications', 'India'),
    ('Pustak Mahal', 'India'),
    ('Orient Blackswan', 'India'),
    ('Tara Books', 'India'),
    ('Westland Publications', 'India'),
    ('Srishti Publishers', 'India'),
    ('Aleph Book Company', 'India'),
    ('Juggernaut Books', 'India');
select * from Publisher;
INSERT INTO Author (author_Fname, author_lname, qualification)
VALUES
    ('Arundhati', 'Roy', 'Booker Prize-winning Author'),
    ('Vikram', 'Seth', 'Novelist and Poet'),
    ('Ruskin', 'Bond', 'Children''s Author'),
    ('Chetan', 'Bhagat', 'Bestselling Author'),
    ('R.K.', 'Narayan', 'Master Storyteller'),
    ('Amish', 'Tripathi', 'Historical Fiction Writer'),
    ('Salman', 'Rushdie', 'Controversial Author'),
    ('Anita', 'Desai', 'Novelist and Short Story Writer'),
    ('Jhumpa', 'Lahiri', 'Pulitzer Prize-winning Author'),
    ('Rohinton', 'Mistry', 'Novelist and Screenwriter');
select * from Author;

INSERT INTO Book (book_title, author_id, publisher_id, book_price, book_status, subject)
VALUES
    ('The God of Small Things', 10, 1, 1199, 'Available', 'Literature'),
    ('A Suitable Boy', 9, 2, 1499, 'Available', 'Fiction'),
    ('The White Tiger', 8, 3, 1299, 'Available', 'Literature'),
    ('India After Gandhi', 7, 4, 1699, 'Available', 'History'),
    ('Midnight''s Children', 6, 5, 1399, 'Available', 'Literature'),
    ('The Guide', 5, 6, 1099, 'Available', 'Fiction'),
    ('Train to Pakistan', 4, 7, 999, 'Available', 'Historical Fiction'),
    ('Interpreter of Maladies', 3, 8, 1599, 'Available', 'Short Stories'),
    ('The Inheritance of Loss', 2, 9, 1499, 'Available', 'Fiction'),
    ('A Fine Balance', 1, 10, 1699, 'Available', 'Literature');
select * from Book;

INSERT INTO Order_Details (customer_id, book_id, order_date, order_amount)
VALUES
    (1, 1, '2024-03-13', 1199),
    (2, 2, '2024-03-13', 1499),
    (3, 3, '2024-03-13', 1299),
    (4, 4, '2024-03-13', 1699),
    (5, 5, '2024-03-13', 1399),
    (6, 6, '2024-03-13', 1099),
    (7, 7, '2024-03-13', 999),
    (8, 8, '2024-03-13', 1599),
    (9, 9, '2024-03-13', 1499),
    (10, 10, '2024-03-13', 1699),
    (1, 1,  '2024-01-15', 1550),
    (2, 2,  '2024-02-25', 1525),
    (3, 3,  '2024-03-10', 2000),
    (4, 4,  '2024-04-05', 1575),
    (5, 5,  '2024-05-20', 1090),
    (6, 6,  '2024-06-12', 1800),
    (7, 7,  '2024-07-08', 1850),
    (8, 8,  '2024-08-17', 1275),
    (9, 9,  '2024-09-29', 1780),
    (10, 10, '2024-10-14',1240),
    (1, 2,  '2024-11-30', 1060),
    (2, 3,  '2024-12-25', 1375),
    (3, 4,  '2025-01-08', 1450),
    (4, 5,  '2025-02-14', 505),
    (5, 6,  '2025-03-20', 558),
    (6, 7,  '2025-04-25', 690),
    (7, 8,  '2025-05-30', 657),
    (8, 9,  '2025-06-05', 700),
    (9, 10, '2025-07-10', 755),
    (10, 1, '2025-08-15', 800);
SELECT * FROM Order_Details;


INSERT INTO Order_Book (order_id, book_id)
SELECT order_id, book_id FROM Order_Details;
 select * from Order_Book; 
 
INSERT INTO Makes (order_id, customer_id)
SELECT order_id, customer_id
FROM Order_Details;
 select * from Makes;
 
INSERT INTO Written_By (book_id, author_id)
SELECT book_id, author_id
FROM Book;
 select * from Written_By ;
 
 INSERT INTO Publish (book_id, publisher_id)
SELECT book_id, publisher_id
FROM Book;
 select * from Publish ;
#Aggregate functions
#1)Find the total number of orders above 1200.
SELECT COUNT(*) AS total_orders_above_1200
FROM Order_Details
WHERE order_amount>1200;


#2)Find the total amount spent on orders.
SELECT SUM(order_amount) FROM Order_Details;

#3)Find the average amount spent on orders.
SELECT AVG(order_amount) FROM Order_Details;


#4)Find the maximum order amount.
SELECT MAX(order_amount) FROM Order_Details;

#5)Find the minimum order amount.
SELECT MIN(order_amount) FROM Order_Details;

#Group by
#6)Find the total amount spent by each customer.
SELECT customer_id, SUM(order_amount) AS total_order_amount
FROM Order_Details
GROUP BY customer_id;

#7)What is the average price of books in each subject?
SELECT subject, AVG(book_price) AS avg_price 
FROM Book 
GROUP BY subject;



#DISTINCT
#8)Find the number of unique books sold. ----
SELECT COUNT(DISTINCT book_id) FROM Order_Book;

#9)Select the distinct book subjects from the Book table
SELECT DISTINCT subject FROM Book;

#SUBQUERIES

#10)Find the total amount spent by the customer with ID 1.
SELECT SUM(order_amount)
FROM Order_Details
WHERE customer_id = (SELECT customer_id FROM Customer WHERE customer_name = 'Ravi Patel');

#11)find the names of authors who have written books that are priced higher than the average price of all books
SELECT author_Fname, author_lname
FROM Author
WHERE author_id IN (SELECT author_id FROM Book WHERE book_price > ( SELECT AVG(book_price)FROM Book));
#12) find the names of publishers who have published books that are in the 'Literature' subject
SELECT publisher_name
FROM Publisher WHERE publisher_id in (SELECT publisher_id FROM Book WHERE subject = 'Literature');

#Wildcards
#13)Find all customers whose names ends with the letter 'a'.
SELECT * FROM Customer WHERE customer_name LIKE '%a';

# Joins
#14)Find the names of all customers who have placed orders: 
SELECT DISTINCT c.customer_name
FROM Customer c
INNER JOIN Order_Details od ON c.customer_id = od.customer_id;

#15)Find the names of all customers and the details of their orders, if any:
SELECT DISTINCT c.customer_name , od.*
FROM Customer c
LEFT OUTER JOIN Order_Details od ON c.customer_id = od.customer_id;

#16)

#17)Find the number of books sold by each publisher. ----
SELECT publisher_id, COUNT(Order_Book.book_id) AS total_books_sold
FROM Book
JOIN Order_Book ON Book.book_id = Order_Book.book_id
GROUP BY publisher_id;

#18)Find the total revenue generated by each publisher in a specific country
SELECT p.publisher_name, p.country, SUM(od.order_amount) AS total_revenue
FROM Publisher p
JOIN Book b ON p.publisher_id = b.publisher_id
JOIN Order_Book ob ON b.book_id = ob.book_id
JOIN Order_Details od ON ob.order_id = od.order_id
WHERE p.country = 'India'
GROUP BY p.publisher_id, p.publisher_name, p.country;

#19)Find the customers who have ordered books published by 'Penguin India'
SELECT c.customer_id, c.customer_name
FROM Customer c
WHERE c.customer_id IN (
    SELECT DISTINCT od.customer_id
    FROM Order_Details od
    JOIN Book b ON od.book_id = b.book_id
    JOIN Publisher p ON b.publisher_id = p.publisher_id
    WHERE p.publisher_name = 'Penguin India'
);

#View
CREATE VIEW Customer_Order_Info AS
SELECT c.customer_name, od.order_date, b.book_title, od.order_amount
FROM Customer c
JOIN Order_Details od ON c.customer_id = od.customer_id
JOIN Book b ON od.book_id = b.book_id;
SELECT * FROM Customer_Order_Info;
