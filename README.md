# Online Bookstore Project

## Overview
The "Online Bookstore" website project is designed for online book sales. Customers can browse a large selection, search for titles, and place orders. The website manages customer information, book details, orders, publishers, and authors. It uses a relational database to track customer purchases, book availability, and author/publisher information, offering a convenient and efficient way to buy books online.

## Database Design
The database design of the project consists of several tables:

### Customer Table
- `customer_id`
- `customer_name`
- `house_number`
- `street_name`
- `additional_address`
- `city`
- `state`
- `postal_code`
- `contact`

### Author Table
- `author_id`
- `author_Fname`
- `author_lname`
- `qualification`

### Publisher Table
- `publisher_id`
- `publisher_name`
- `country`

### Book Table
- `book_id`
- `book_title`
- `book_price`
- `book_status`
- `subject`

### Order_Details Table
- `order_id`
- `order_date`
- `order_amount`

### Order_Book Table
- `order_id`
- `book_id`

### Makes Table
- `order_id`
- `customer_id`

### Written_By Table
- `book_id`
- `author_id`

### Publish Table
- `book_id`
- `publisher_id`

## Relationships
The database design includes the following relationships:

- Book to Author: Many-to-Many relationship mediated by the Written_By table.
- Book to Publisher: One-to-Many relationship where each book is published by one publisher.
- Order_Details to Customer: One-to-Many relationship where each order is placed by one customer.
- Order_Details to Book: One-to-Many relationship where each order can contain multiple books.
- Order_Book to Order_Details: One-to-Many relationship where each order-book entry belongs to one order.
- Order_Book to Book: One-to-Many relationship where each order-book entry is associated with one book.
- Makes to Order_Details: One-to-Many relationship where each makes entry corresponds to one order.
- Makes to Customer: One-to-Many relationship where each makes entry corresponds to one customer.
- Written_By to Book: One-to-Many relationship where each written_by entry corresponds to one book.
- Written_By to Author: One-to-Many relationship where each written_by entry corresponds to one author.
- Publish to Book: One-to-Many relationship where each publish entry corresponds to one book.
- Publish to Publisher: One-to-Many relationship where each publish entry corresponds to one publisher.

