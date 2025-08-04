# 🛒 E-Commerce Database Project

Welcome to your **E-Commerce SQL Database** — the backbone of a complete online store!  
This project is built to handle customers, products, orders, payments, and much more with clean structure and real-world logic.

---

## 📋 Overview

This database consists of **11 interlinked tables**, each responsible for a different part of your e-commerce system. Think of them like different departments in an online store—customer service, inventory, checkout, reviews, and more.

---

## 📂 Table Structure

### 1. **Customers**
Stores user profiles and contact details.

| Column        | Type       | Description                                  |
|---------------|------------|----------------------------------------------|
| Customer_id   | `SERIAL`   | Auto-incremented primary key (surrogate key) |
| Fullname      | `VARCHAR(50)` | Full name (required)                     |
| Email         | `VARCHAR(50)` | Unique email                              |
| Phone         | `VARCHAR(25)` | Phone number (required)                   |
| PasswordHash  | `VARCHAR(50)` | Secure password (required)                |
| Created_at    | `TIMESTAMP`   | Default: current timestamp                |
| Address       | `VARCHAR(100)`| Required                                   |
| City, State   | `VARCHAR(25)` | Optional                                   |
| Zip_Code      | `VARCHAR(25)` | Required                                   |
| Country       | `VARCHAR(25)` | Optional                                   |

---

### 2. **Categories**
Groups products by type (e.g., Electronics, Apparel).

| Column         | Type         | Description                     |
|----------------|--------------|---------------------------------|
| Category_id    | `SERIAL`     | Auto-incremented primary key    |
| Category_name  | `VARCHAR(25)`| Required                        |
| Description    | `VARCHAR(1000)` | Optional                     |

---

### 3. **Products**
Details about each item available for sale.

| Column         | Type           | Description                            |
|----------------|----------------|----------------------------------------|
| Product_id     | `SERIAL`       | Auto-incremented primary key           |
| Product_name   | `VARCHAR(50)`  | Required                               |
| Description    | `VARCHAR(1000)`| Required                               |
| Price          | `INT`          | Required                               |
| Quantity       | `INT`          | Inventory count                        |
| Category_id    | `INT`          | Foreign key to `categories`            |
| Img_url        | `VARCHAR(100)` | Product image link                     |
| Created_at     | `TIMESTAMP`    | Default: current timestamp             |

---

### 4. **Orders**
Tracks customer purchases.

| Column          | Type          | Description                                     |
|-----------------|---------------|-------------------------------------------------|
| Order_ID        | `SERIAL`      | Auto-incremented primary key                   |
| Customer_ID     | `INT`         | Foreign key to `customers`                     |
| Order_Date      | `DATE`        | Default: current date                          |
| Total_Amount    | `INT`         | Total value of the order                       |
| Status          | `VARCHAR(50)` | Must be: `Completed`, `Cancelled`, `Delivered` |
| Shipping_Address| `VARCHAR(500)`| Required                                       |

---

### 5. **Order_Details**
Breaks down each order by product.

| Column           | Type      | Description                              |
|------------------|-----------|------------------------------------------|
| Order_Detail_ID  | `SERIAL`  | Auto-incremented primary key             |
| Order_ID         | `INT`     | Foreign key to `orders`                  |
| Product_ID       | `INT`     | Foreign key to `products`                |
| Quantity         | `INT`     | Number of items                          |
| Price            | `INT`     | Price at purchase time                   |

---

### 6. **Payments**
Handles transactions.

| Column         | Type          | Description                              |
|----------------|---------------|------------------------------------------|
| Payment_ID     | `SERIAL`      | Auto-incremented primary key             |
| Order_ID       | `INT`         | Foreign key to `orders`                  |
| Payment_Date   | `DATE`        | Default: current date                    |
| Amount         | `INT`         | Payment amount                           |
| Payment_Method | `VARCHAR(50)` | Must be: `COD` or `UPI`                  |
| Payment_Status | `VARCHAR(50)` | Must be: `Paid` or `Pending`            |

---

### 7. **Shipping**
Tracks order delivery status.

| Column           | Type          | Description                                         |
|------------------|---------------|-----------------------------------------------------|
| Shipping_ID      | `SERIAL`      | Auto-incremented primary key                       |
| Order_ID         | `INT`         | Foreign key to `orders`                            |
| Shipping_Date    | `DATE`        | When it was shipped                                |
| Carrier          | `VARCHAR(50)` | Courier service                                    |
| Tracking_Number  | `VARCHAR(50)` | Tracking code                                      |
| Status           | `VARCHAR(50)` | `Pending`, `Dispatched`, `In Transit`, `Delivered`, `Cancelled` |

---

### 8. **Product_Reviews**
Stores customer feedback.

| Column        | Type           | Description                               |
|---------------|----------------|-------------------------------------------|
| Review_ID     | `SERIAL`       | Auto-incremented primary key              |
| Product_ID    | `INT`          | Foreign key to `products`                 |
| Customer_ID   | `INT`          | Foreign key to `customers`                |
| Rating        | `DECIMAL(2,1)` | Between 1.0 and 5.0                       |
| Review_Text   | `VARCHAR(100)` | Optional customer comment                 |
| Review_Date   | `TIMESTAMP`    | Default: current timestamp                |

---

### 9. **Cart**
Holds items added before purchase.

| Column       | Type        | Description                        |
|--------------|-------------|------------------------------------|
| Cart_ID      | `SERIAL`    | Auto-incremented primary key       |
| Customer_ID  | `INT`       | Foreign key to `customers`         |
| Product_ID   | `INT`       | Foreign key to `products`          |
| Quantity     | `INT`       | Default: 1                         |
| Date_Added   | `TIMESTAMP` | Default: current timestamp         |

---

### 10. **Wishlist**
Saves desired products for future purchase.

| Column       | Type        | Description                        |
|--------------|-------------|------------------------------------|
| Wishlist_ID  | `SERIAL`    | Auto-incremented primary key       |
| Customer_ID  | `INT`       | Foreign key to `customers`         |
| Product_ID   | `INT`       | Foreign key to `products`          |
| Date_Added   | `TIMESTAMP` | Default: current timestamp         |

---

### 11. **Admin_User**
Admins and backend users.

| Column       | Type         | Description                        |
|--------------|--------------|------------------------------------|
| Admin_ID     | `SERIAL`     | Auto-incremented primary key       |
| FullName     | `VARCHAR(50)`| Required                           |
| Email        | `VARCHAR(50)`| Required and unique                |
| PasswordHash | `VARCHAR(50)`| Required                           |
| Role         | `VARCHAR(50)`| e.g., Manager, Support             |
| Created_at   | `TIMESTAMP`  | Default: current timestamp         |

---

## 💡 Concepts Explained

### 🔸 Normalization
Organizes data efficiently to reduce duplication.  
Example: Customer details exist only in the `customers` table and are referenced elsewhere via `Customer_ID`.

### 🔸 Primary Key vs. Foreign Key
- **Primary Key**: Uniquely identifies a row (e.g., `Customer_ID`)
- **Foreign Key**: Links to another table’s primary key (e.g., `Customer_ID` in `orders`)

### 🔸 Constraints
- `NOT NULL`, `UNIQUE`, `CHECK`, `FOREIGN KEY` — ensure data quality.
- Example: `Status` in `orders` can only be `'Completed'`, `'Cancelled'`, `'Delivered'`.

### 🔸 Surrogate Key
An artificial, system-generated key (like `Customer_ID`) used instead of natural keys (like email).

### 🔸 Avoiding Redundancy
- Separate tables for products, customers, etc.
- Use keys to connect data logically.
- Store each piece of data only once.

### 🔸 ER Diagram
A visual map showing how tables are related through keys.  
Use [dbdiagram.io](https://dbdiagram.io/) for modeling this schema.

### 🔸 Types of Relationships
- **One-to-Many**: A customer has many orders.
- **Many-to-Many**: Products appear in many orders (via `order_details`).

### 🔸 Auto-Increment
Implemented using `SERIAL` or `GENERATED ALWAYS AS IDENTITY` in PostgreSQL.

---

## 🛠 Setup Instructions

1. **Create Tables**  
   Run the SQL scripts in order. Start with `customers` and `categories` (others have foreign keys).
2. **Insert Data**  
   Add sample customers, products, and categories.
3. **Test**  
   Use `SELECT * FROM table_name` to view and validate entries.
4. **Build Your Store**  
   Integrate with frontend or APIs and start building your e-commerce platform!

---

## ⚡ Pro Tips

- ✅ Fix the typo: `quantiity` → `quantity` in `products`.
- ✅ Use indexes for faster queries (e.g., `Email`, `Product_ID`).
- ✅ Adjust data types and lengths as needed.
- ✅ Handle business logic with stored procedures or app-layer rules.

---

## 🎯 Why This Project Rocks

This schema:
- Is scalable, clean, and normalized.
- Supports real-world e-commerce operations.
- Can be easily extended (returns, coupons, inventory logs, etc.).

Happy coding & selling! 🚀


