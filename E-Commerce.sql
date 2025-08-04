-- PostGreSQL Used

create table customers (
Customer_id Serial primary key,
Fullname varchar(50) not null,
Email  varchar(50) unique,
Phone varchar(25) not null,
PasswordHash varchar(50) not null,
Created_at timestamp default current_timestamp,
Address varchar(100) not null,
City varchar(25),
State varchar(25),
Zip_Code varchar(25) not null,
Country varchar(25)
);

select * from customers;

create table categories(
category_id  Serial primary key,
category_name varchar(25) not null,
description varchar(1000)
);

select * from categories;

create table products(
product_id Serial primary key,
product_name varchar(50) not null,
description varchar(1000) not null,
price int not null,
quantiity int not null,
category_id int,
img_url varchar(100),
created_at timestamp default current_timestamp,
foreign key(category_id) references categories(category_id)
);

select * from products;

create table orders(
Order_ID Serial primary key,
Customer_ID int,
Order_Date date default current_date,
Total_Amount int not null,
Status varchar(50) check (Status in ('Completed','Cancelled','Delivered')),
Shipping_Address varchar(500) not null,
foreign key(Customer_ID) references customers(customer_id)
);

select * from orders;

create table order_details(
Order_ID int ,
Product_ID int,
Quantity int not null,
Price int not null,
primary key (Order_ID, Product_ID),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id));

select * from order_details;

create table payments (
Payment_ID Serial primary key,
Order_ID int,
Payment_Date date default current_date,
Amount int not null,
Payment_Method varchar(50) check (Payment_Method in ('COD','UPI')),
Payment_Status varchar(50) check (Payment_Status in ('Paid','Pending')),
foreign key (order_id) references orders(order_id)
);

select * from payments;

create table shipping(
Shipping_ID Serial primary key,
Order_ID int,
Shipping_Date date,
Carrier varchar(50),
Tracking_Number varchar(50),
Status varchar(50) check (Status in ('Pending','Dispatched','In Transit','Delivered','Cancelled')),
foreign key(order_id) references orders(order_id)
);

select * from shipping;

create table Product_reviews(
Review_ID Serial primary key,
Product_ID int,
Customer_ID int,
Rating decimal(2,1) check (Rating between 1 and 5),
Review_Text varchar(100),
Review_Date timestamp default current_timestamp,
foreign key(Product_id) references products(product_id),
foreign key (Customer_id) references customers(customer_id)
);

select * from product_reviews;

create table cart(
Cart_ID Serial primary key,
Customer_ID int,
Product_ID int,
Quantity int default 1,
Date_Added timestamp default current_timestamp,
foreign key (Customer_id) references customers(Customer_id),
foreign key (Product_id) references Products(product_id)
);

select * from cart;

create table wishlist(
Wishlist_ID Serial primary key,
Customer_ID int ,
Product_ID int,
Date_Added timestamp default current_timestamp,
foreign key(Customer_id) references Customers(Customer_id),
foreign key(product_id) references products(Product_id)
);

select * from wishlist;

create table Admin_user(
Admin_ID Serial primary key,
FullName varchar(50) not null,
Email varchar(50) not null unique,
PasswordHash varchar(50) not null,
Role varchar(50) not null,
Created_at timestamp default current_timestamp
);

select * from Admin_user;


