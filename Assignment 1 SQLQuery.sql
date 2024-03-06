--Task:1. Database Design:
--1. Create the database named "TechShop"
--create database
CREATE DATABASE TechShop

--to change database instance
USE TechShop

--2.Define the schema for the Customers, Products, Orders, OrderDetails and Inventory tables based on the provided schema.
--create table named Customers
CREATE TABLE Customers(
CustomerID int Not Null Primary Key,
FirstName varchar(20) Not Null,
LastName varchar(20) Not Null,
Email varchar(25) Not Null,
Phone varchar(10) Not Null,
Addresss varchar(100) Not Null)

--create table Products
CREATE TABLE Products(
ProductID int Not Null Primary Key,
ProductName varchar(20) Not Null,
Descriptionn varchar(30) Not Null,
Price int Not Null)

--create table Orders
CREATE TABLE Orders(
OrderID int Not Null Primary Key,
CustomerID int Not Null,
Foreign Key(CustomerID) references Customers(CustomerID) ,
OrderDate date Not Null,
TotalAmount float Not Null)


--create table OrderDetails
CREATE TABLE OrderDetails(
OrderDetailID int Not NUll Primary Key,
OrderID int Not Null,
Foreign Key(OrderID) references Orders(OrderID),
ProductID int Not Null,
Foreign Key(ProductID) references Products(ProductID),
Quantity int Not Null)


--create table Inventory
CREATE TABLE Inventory(
InventoryID int Not Null Primary Key,
ProductID int Not Null,
Foreign Key(ProductID) references Products(ProductID),
QuantityInStock int Not Null,
LastStockUpdate date Not Null)

--inserting values into tables
--Customer table
SELECT* FROM Customers
INSERT INTO Customers(CustomerID, FirstName,LastName,Email,Phone, Addresss) values 
(1,'Abi','Selvam','abi@gmail.com','1234567890', 'Sunny street,Trichy')
INSERT INTO Customers values(2, 'Sri', 'Anbu','sri@gmail.com','2345617890','Anna nagar,Salem')
INSERT INTO Customers values(3, 'Kalai','A','kalai@gmail.com','3456789012','Gandhi street,Pondy')
INSERT INTO Customers values(4, 'Bharath','Raj','bharath@gmail.com','9787250731','Buddha street,Madurai')
INSERT INTO Customers values(5, 'Sandeep','P','sandeep@gmail.com','9787350732','T.nagar,Chennai')
INSERT INTO Customers values(6, 'Santhosh','S','santhosh@gmail.com','9787450731','Krishna nagar, Veedur')
INSERT INTO Customers values(7, 'Latha', 'S','latha@gmail.com','9787550731','Rangan Street, Cuddalore')
INSERT INTO Customers values(8, 'Ramya', 'G','ramya@gmail.com','9787650731','Srinivasan street, Villupuram')
INSERT INTO Customers values(9, 'Hema', 'T','hema@gmail.com','9787750731','Nehru street,Pune')
INSERT INTO Customers values(10, 'Moni', 'M','moni@gmail.com','9025786120','Valluvar street,Theni')

-- Products table
SELECT* FROM Products
INSERT INTO Products(ProductID,ProductName,Descriptionn,Price) values 
(1, 'Laptop', 'Powerful laptop with high-resolution display',50000),
(2, 'Smartphone', 'Latest smartphone with advanced features', 30000),
(3, 'Tablet', 'Lightweight tablet perfect for Hands on use', 15000),
(4, 'Headphones', 'Wireless headphones with noise-canceling technology', 500),
(5, 'Smartwatch', 'Fitness tracking smartwatch with heart rate monitor', 5000),
(6, 'Gaming Console', 'High-performance gaming console with immersive graphics', 6999),
(7, 'Wireless Router', 'Advanced wireless router for fast and reliable internet connection', 5000),
(8, 'External Hard Drive', 'Portable external hard drive for secure data storage', 2500),
(9, 'Graphics Card', 'Powerful graphics card for smooth gaming and video editing', 14500),
(10,'Wireless Earbuds', 'True wireless earbuds with long battery life and crisp sound', 1200);

--table orders
SELECT * FROM Orders
INSERT INTO Orders(OrderID,CustomerID,TotalAmount,OrderDate) values   
(1, 1, 50000, '2024-02-28'),
(2, 2, 5000, '2024-02-27'),
(3, 3, 14500,'2024-02-26'),
(4, 4, 5000, '2024-02-25'),
(5, 5, 6999, '2024-02-24'),
(6, 6, 10000,'2024-02-28'),
(7, 7, 2400, '2024-02-28'),
(8, 8, 10000, '2024-02-28'),
(9, 9, 30000,'2024-02-28'),
(10,10, 500,'2024-02-28');
alter table Orders 
alter column TotalAmount float
	

--table for OrderDetails
SELECT *FROM OrderDetails
INSERT INTO OrderDetails(OrderDetailID,OrderID,ProductID,Quantity) values
--Laptop 50000(1) 1 times
    (1, 1, 1, 1),
--Smartwatch 5000(1) 1 times
    (2, 2, 5, 1),
--Graphicscards 145000(1) 1 times
    (3, 3, 9, 1),
--Harddrive 2500(1) 2 times
    (4, 4, 8, 2),
    (5, 5, 6, 1),
	(6, 6, 7, 2),
    (7, 7, 10,2),
    (8, 8, 5,2),
    (9, 9, 2, 1),
    (10,10,4, 1);

--Inventory table
SELECT * FROM Inventory
INSERT INTO Inventory(InventoryID,ProductID,QuantityInStock,LastStockUpdate) values 
(1, 1, 100, '2024-02-28'),
(2, 2, 150, '2024-02-27'),
(3, 3, 200, '2024-02-26'),
(4, 4, 80, '2024-02-25'),
(5, 5, 120, '2024-02-24'),
(6, 6, 90, '2024-02-28'),
(7, 7, 110, '2024-02-28'),
(8, 8, 70, '2024-02-28'),
(9, 9, 60, '2024-02-28'),
(10, 10, 100,'2024-02-28');


--Tasks 2: Select, Where, Between, AND, LIKE:
--1. Write an SQL query to retrieve the names and emails of all customers. 
SELECT FirstName,LastName,Email FROM Customers 

--2. Write an SQL query to list all orders with their order dates and corresponding customer names.

SELECT OrderID, OrderDate, Concat(FirstName,' ',LastName) as CustomerNames
FROM Orders O,Customers
Where O.CustomerID=Customers.CustomerID

--3. Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
INSERT INTO Customers(CustomerID,FirstName,LastName,Email,Addresss) values (11,'Siva', 'Maha','sivamaha@gmail.com','Kamban nagar,Tirunelveli')
SELECT *FROM  Customers


--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
UPDATE Products
SET Price=Price*1.1
SELECT * FROM Products

--5.Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
Select* from Orders
Select * from OrderDetails
Declare @OrderID int
Set @OrderID=1;
delete from Orders
where OrderID=@OrderID
delete from OrderDetails
where OrderID=@OrderID

--6.Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information.
INSERT INTO Orders(OrderID,CustomerID,TotalAmount,OrderDate) values (11,11,11999,'2024-03-02')
Select*from Orders

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information.
select*from Customers
Update Customers
set Email='anbu@gmail.com',Addresss='Radhakrishna nagar, Tambaram'
where CustomerID=2

--8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.
Update Orders
set TotalAmount=(
Select (od.Quantity*P.Price) from OrderDetails od 
Join Products P ON od.ProductID=P.ProductID
where od.OrderID=Orders.OrderID)
where OrderID in(select OrderID from OrderDetails)
select *from Orders

--9. Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.
delete from OrderDetails 
where OrderID in ( 
select OrderID 
from Orders 
where CustomerID=3 --user input
)
delete from Orders
where CustomerID=3--user input
select* from Orders
select * from OrderDetails

--10. Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details.
Alter table Products
Add Category varchar(20)
insert into Products (ProductID,ProductName ,Descriptionn,Price,Category) values(11, 'Smart TV','This is a smart TV with high-definition display and smart features', 25000,'Electronic gadget')
Select * from Products

--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.
alter table  Orders
add OrderStatus varchar(20)
Select* from Orders
declare @Oid int ,@newstatus varchar(20)
set @Oid=5
set @newstatus='pending';
--user input
update Orders
set OrderStatus=@newstatus
where OrderID=@Oid

--12. Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table
alter table Customers
add No_of_orders int 
select* from Customers
update Customers
set No_of_orders=(
select COUNT(*)
from Orders O 
where Customers.CustomerID=O.CustomerID 
Group By O.CustomerID
)


--Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:


--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order.
select OrderID, TotalAmount,Concat (FirstName,' ',LastName) as CustomerNames
from Orders O,Customers C
where O.CustomerID=C.CustomerID

--2. Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue
select ProductName, SUM(Price*Quantity) as Total_revenue
from Products ,OrderDetails
group by ProductName

--3. Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information.select Phone, concat (FirstName,' ', LastName) as CustomerNamesfrom Customers cJoin Orders O on c.CustomerID=O.CustomerIDJoin OrderDetails od on O.OrderID=od.OrderIDwhere Od.Quantity>=1select*from Customers

--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered.
select top 1 ProductName,SUM (Quantity) as Total_quantity 
from Products P,OrderDetails 
where OrderDetails.ProductID=P.ProductID
group by ProductName
Order by Total_quantity desc

--5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.--1st giving values to category column in Products
select* from Products
update Products
set Category = 
case 
WHEN ProductName ='Laptop' THEN 'Computer'
WHEN ProductName = 'Smartphone' THEN 'Mobile Devices'
WHEN ProductName = 'Tablet' THEN 'Mobile Devices'
WHEN ProductName = 'Headphones' THEN 'Audio Devices'
WHEN ProductName = 'Smartwatch' THEN 'Wearable Technology'
WHEN ProductName = 'Gaming Console' THEN 'Gaming Devices'
WHEN ProductName = 'Wireless Router' THEN 'Networking Devices'
WHEN ProductName = 'External Hard Drive' THEN 'Computer'
WHEN ProductName = 'Graphics Card' THEN 'Computer'
WHEN ProductName = 'Wireless Earbuds' THEN 'Audio Devices'
WHEN ProductName = 'Smart TV' THEN 'Computer'
ELSE NULL
END
--2nd list electronic gadgets along with their corresponding categories
select ProductName as Electronic_gadgets,Category
from Products


--6. Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value
select concat(FirstName,' ',LastName) as CustomerNames,
sum (O.TotalAmount)/Count(od.Quantity) as Average_order_value
from Customers C
join Orders O on C.CustomerID=O.CustomerID
join OrderDetails od on  O.OrderID=od.OrderID
group by concat (FirstName,' ',LastName)

--7. Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.
select Top 1 OrderID ,CONCAT(FirstName,' ',LastName) as CustomerNames,Email,Phone,Addresss,No_of_orders,TotalAmount as TotalRevenue
from Orders O,Customers C
where O.CustomerID=C.CustomerID
Order By TotalRevenue desc

--8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.
select ProductName as Electronic_gadgets,SUM(Quantity) as No_of_times
from Products P,OrderDetails od
where P.ProductID=od.ProductID
group by ProductName

--9. Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter.
select*from Products
select *from Customers
select*from Orders
declare @ProductName varchar(20)
set @ProductName='Headphones'
select P. ProductName,concat(FirstName,' ',LastName) as CustomerNames
from Products ,Customers c
join Orders o on c.CustomerID=o.CustomerID
join OrderDetails od on O.OrderID=od.OrderID
join Products P on od.ProductID=P.ProductID
group by concat(FirstName,' ',LastName),P.ProductName
having P.ProductName=@ProductName

--10. Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters.
declare @start date,@end  date
set @start='2024-02-25'
set @end=getdate()
select Sum(Price*Quantity) as Total_Revenue,o.OrderDate
from Products P,Orders
join OrderDetails od on ProductID=od.ProductID
join Orders o on od.OrderID=o.OrderID
where O.OrderDate between @start and @end
group by O.OrderDate


--Task 4. Subquery and its type:

--1. Write an SQL query to find out which customers have not placed any orders.
select concat(FirstName,' ',LastName)  as CustomersNames
from Customers
where CustomerID not in (select CustomerID from Orders O where O.CustomerID=Customers.CustomerID)

--2. Write an SQL query to find the total number of products available for sale.
select sum( QuantityInStock) as Total_No_products from Inventory

--3. Write an SQL query to calculate the total revenue generated by TechShop

Select SUM(TotalAmount) AS [Total Revenue] From Orders

--4. Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter.
declare @category_name varchar(20)
set @category_name='Computer'
select AVG(Quantity) as Average_quantity from ( select od.Quantity from Products P 
join OrderDetails od on P.ProductID=od.ProductID
where P.Category=@category_name) as SubQuery

--5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter.
select*from Orders
declare @CustomerID int
set @CustomerID=2
select SUM(Price* Quantity) as Total_revenue from (select CustomerID,Quantity, Price 
from Orders O 
Join OrderDetails od on O.OrderID=od.OrderID
join Products P on od.ProductID=P.ProductID
where O.CustomerID=@CustomerID) as SubQuery


--6. Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed.
select  FirstName,Sum(Quantity) as No_of_order from Customers c
join Orders O on c.CustomerID=O.CustomerID
join OrderDetails od on O.OrderID=od.OrderID
group by FirstName
having sum(Quantity)=(select Max(Total_Quantity) from (select sum(Quantity) as Total_Quantity from OrderDetails group by OrderID )as Subquery)


--7. Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders.
select top 1  Category , SUM(Quantity) as total_quantity from Products P
join OrderDetails od on  P.ProductID=od.ProductID
group by Category
order by total_quantity desc

--8. Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending.
select top 1 concat(FirstName,' ',LastName) as CustomerNames, TotalAmount as highest_total_revenue
from Customers c 
join Orders O on c.CustomerID=O.CustomerID
group by concat(FirstName,' ',LastName),TotalAmount
order by highest_total_revenue desc 

--9. Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers
select c.CustomerID, FirstName, sum(Price*Quantity)/No_of_orders as Average_order_value
from Customers c 
Join Orders O on c.CustomerID=O.CustomerID
join OrderDetails od on O.OrderID=od.OrderID
join Products P on od.ProductID=P.ProductID
group by c.CustomerID,FirstName,No_of_orders

select*from Customers
select* from Orders

--10. Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count.
select FirstName ,(select count(*) as Orders_count from Orders O where O.CustomerID=c.CustomerID)
from Customers c











