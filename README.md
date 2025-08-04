# E-Commerce-Database-project

Hey, welcome to your e-commerce database project! This SQL setup is like the heart of an online store, keeping track of customers, products, orders, and more. 
It’s got everything you need to run a smooth shopping platform, and I’m here to walk you through it in a way that feels like chatting with a friend. Plus,
I’ll answer some key database questions to help you understand the magic behind it. Let’s jump in!
What’s This Database All About?
This database has 11 tables, each doing a specific job to make your online store hum. 
Think of them as different sections of a store—customer service, inventory, checkout, and so on.

1. Customers 
This is where we store info about your shoppers—who they are and how to reach them.
•	Customer_id: A unique, auto-generated ID for each customer.
•	Fullname: Their full name (up to 50 characters, gotta have it).
•	Email: Their email (unique, up to 50 characters).
•	Phone: Their phone number (up to 25 characters, required).
•	PasswordHash: A secure version of their password (required).
•	Created_at: When they signed up (automatically set to now).
•	Address: Their street address (up to 100 characters, required).
•	City: Their city (up to 25 characters).
•	State: Their state (up to 25 characters).
•	Zip_Code: Their postal code (up to 25 characters, required).
•	Country: Their country (up to 25 characters).

2. Categories 
This organizes products into groups, like “Electronics” or “Clothes.”
•	category_id: A unique, auto-generated ID for each category.
•	category_name: The category’s name (up to 25 characters, required).
•	description: A longer description (up to 1000 characters).

3. Products 
Here’s where your store’s items live, from sneakers to smartphones.
•	product_id: A unique, auto-generated ID for each product.
•	product_name: The product’s name (up to 50 characters, required).
•	description: A detailed description (up to 1000 characters, required).
•	price: How much it costs (a whole number, required).
•	quantiity: How many are in stock (required). Heads-up: There’s a typo in the schema—should be quantity.
•	category_id: Links to the category it belongs to (connects to categories).
•	img_url: A link to the product’s picture (up to 100 characters).
•	created_at: When the product was added (set to now).

4. Orders 
This tracks what customers buy.
•	Order_ID: A unique, auto-generated ID for each order.
•	Customer_ID: Links to the customer who ordered (connects to customers).
•	Order_Date: When the order was placed (defaults to today).
•	Total_Amount: The total cost (required).
•	Status: Where the order’s at (only “Completed,” “Cancelled,” or “Delivered”).
•	Shipping_Address: Where to send it (up to 500 characters, required).

5. Order_Details 
This shows what’s in each order, like which products and how many.
•	Order_Detail_ID: A unique, auto-generated ID for each item in an order.
•	Order_ID: Links to the order (connects to orders).
•	Product_ID: Links to the product (connects to products).
•	Quantity: How many were ordered (required).
•	Price: The price at the time of the order (required).

6. Payments 
This handles how customers pay for their orders.
•	Payment_ID: A unique, auto-generated ID for each payment.
•	Order_ID: Links to the order (connects to orders).
•	Payment_Date: When the payment was made (defaults to today).
•	Amount: The payment amount (required).
•	Payment_Method: How they paid (either “COD” or “UPI”).
•	Payment_Status: Whether it’s “Paid” or “Pending.”

7. Shipping 
This tracks how orders get to customers.
•	Shipping_ID: A unique, auto-generated ID for each shipment.
•	Order_ID: Links to the order (connects to orders).
•	Shipping_Date: When it was shipped.
•	Carrier: Who’s delivering it (up to 50 characters).
•	Tracking_Number: The tracking number (up to 50 characters).
•	Status: Shipping status (can be “Pending,” “Dispatched,” “In Transit,” “Delivered,” or “Cancelled”).

8. Product_Reviews 
This is where customers share their thoughts on products.
•	Review_ID: A unique, auto-generated ID for each review.
•	Product_ID: Links to the product (connects to products).
•	Customer_ID: Links to the customer (connects to customers).
•	Rating: A score from 1.0 to 5.0 (like 4.5 stars).
•	Review_Text: Their comments (up to 100 characters).
•	Review_Date: When they posted it (set to now).

9. Cart 
This holds items customers have added to their cart.
•	Cart_ID: A unique, auto-generated ID for each cart item.
•	Customer_ID: Links to the customer (connects to customers).
•	Product_ID: Links to the product (connects to products).
•	Quantity: How many are in the cart (defaults to 1).
•	Date_Added: When it was added (set to now).

10. Wishlist 
This saves products customers want to buy later.
•	Wishlist_ID: A unique, auto-generated ID for each wishlist item.
•	Customer_ID: Links to the customer (connects to customers).
•	Product_ID: Links to the product (connects to products).
•	Date_Added: When it was added (set to now).

11. Admin_User 
This is for the folks running the show behind the scenes.
•	Admin_ID: A unique, auto-generated ID for each admin.
•	FullName: Their full name (up to 50 characters, required).
•	Email: Their email (up to 50 characters, unique, required).
•	PasswordHash: A secure password (required).
•	Role: Their job, like “Manager” or “Support” (required).
•	Created_at: When their account was made (set to now).

How to Get Rolling

1.	Set Up the Tables: Run the SQL scripts in order—start with customers and categories, since other tables rely on them.
  	Use the SELECT * queries to double-check everything looks good.
2.	Add Your Data: Fill in the tables with customers, products, and more to bring your store to life.
3.	Start Selling: This database powers user accounts, product browsing, checkout, shipping, and reviews—everything an online store needs!
Let’s break down some common database concepts in a way that’s easy to grasp, using this project as an example.

1. What’s Normalization?
Think of normalization as tidying up your data so it’s neat and efficient, like organizing your kitchen. It’s about structuring your database to avoid repeating info and keep things consistent. In this database:
•	We store customer details only in customers, not in orders or product_reviews. Instead, we use Customer_ID to link them, saving space and avoiding mess-ups.

2. Primary Key vs. Foreign Key—What’s the Difference?
•	Primary Key: This is like a unique name tag for each record. In customers, Customer_id is the primary key, ensuring every customer has a distinct ID.
•	Foreign Key: This connects tables like a bridge. In orders, Customer_ID is a foreign key that points to customers(Customer_id), linking each order to a specific customer.

3. What Are Constraints?
Constraints are like rules for your data to keep it trustworthy. They make sure everything stays in line:
•	Not Null: You can’t leave it blank (e.g., Fullname in customers must have a value).
•	Unique: No duplicates allowed (e.g., Email in customers).
•	Foreign Key: Links tables properly (e.g., category_id in products points to categories).
•	Check: Limits what you can enter (e.g., Status in orders can only be “Completed,” “Cancelled,” or “Delivered”).

4. What’s a Surrogate Key?
A surrogate key is like a made-up ID number just for identifying records, not based on real-world info. In this database, Serial columns
like Customer_id or Order_ID are surrogate keys—they auto-generate unique numbers to keep things simple and unique.

6. How Do You Avoid Data Redundancy?
Redundancy is like keeping five copies of the same book—it’s wasteful! This database avoids it by:
•	Splitting data into separate tables (e.g., customers for user info, products for items).
•	Using foreign keys to link tables instead of repeating info (e.g., Order_Details uses Product_ID instead of copying product details).
•	Organizing data logically so each piece lives in one place.

7. What’s an ER Diagram?
An Entity-Relationship (ER) Diagram is like a map of your database. It shows the tables (like customers or products) and how they’re connected (like Customer_ID linking customers to orders).
It’s a visual way to see how your store’s data flows.

8. What Are the Types of Relationships in a Database?
Relationships show how tables talk to each other:
•	One-to-One: One record matches one other record (not used here, but think one customer, one passport).
•	One-to-Many: One record connects to multiple records (e.g., one customer in customers can have many orders in orders).
•	Many-to-Many: Multiple records connect to multiple records (e.g., products and orders are linked through order_details, since one order can have many products, and one product can be in many orders).

9. What’s the Deal with AUTO_INCREMENT (Serial)?
Serial (or AUTO_INCREMENT) automatically gives each new record a unique number, starting at 1 and counting up. It’s used for primary keys like Customer_id or product_id to:
•	Make sure every record has a unique ID.
•	Save you from picking IDs yourself.
•	Keep things organized without extra work.

10. What’s the Default Storage Engine in MySQL?
In MySQL (since version 5.5), the default storage engine is InnoDB. It’s perfect for this database because it supports:
•	Foreign keys (like in orders and products).
•	Safe data changes with transactions.
•	Efficient handling of lots of users.

11. What’s a Composite Key?
A composite key uses two or more columns together to uniquely identify a record. In this database, order_details uses a composite key with Order_ID and Product_ID.
This ensures a product (like a T-shirt) appears only once per order, with the Quantity field showing how many were ordered. For example, Order #1 can’t have two entries for Product #5,
 keeping your data clean and avoiding duplicates.

Pro Tips for Your Store
•	Order of Creation: Set up customers and categories first, since other tables depend on them for foreign keys.
•	Fix That Typo: In products, change quantiity to quantity to keep things clean.
•	Check Constraints: Older MySQL versions might not support CHECK (like for Status). If that happens, handle those rules in your app code.
•	Speed Things Up: Add indexes on fields you search a lot, like Email or Product_ID, to make queries faster.
•	Make It Your Own: Adjust field sizes or add more rules to fit your store’s vibe.

Why This Database Is Awesome
This setup is like a super-organized assistant for your online store, keeping everything from customer info to shipping details in perfect harmony.
It’s designed to avoid duplicates, stay reliable, and make your store run like a dream. Have fun building your shop, and happy selling! 

