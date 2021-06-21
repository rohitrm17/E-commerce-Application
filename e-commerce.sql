/*DROP DATABASE E_COMMERCE;*/

CREATE DATABASE E_COMMERCE;

CREATE TABLE Customers (Cemail varchar(100) primary key, Cname varchar(20) , Caddress varchar(20) , Ctid int);

select * from Customers;
select * from Customer_contact_details;
delete from Customers;

drop table Customers;

CREATE TABLE Product (Pid int primary key , Pname varchar(20) , Availabilities varchar(5));

CREATE TABLE Seller (Sid int primary key  , Pid int , Wid int,Sname varchar(20));

CREATE TABLE Review (Rid int primary key , Rtext varchar(20) , Rating int , Cid int references Customers(Cid));

CREATE TABLE Trans(Tid int primary key,Tamount float,Tfrom varchar(20),Tto varchar(20),Tmode varchar(20),Cid int references Customers(Cid));

CREATE TABLE Administrator (Adid int primary key ,Wid int, Adname varchar(20));

CREATE TABLE Shipment (Cid int references Customers(Cid) , Address varchar(20) , Areacode int , ShipmentCharges float);

CREATE TABLE Category_Of_Customers (Cid int references Customers(Cid) , Ctype varchar(20));

CREATE TABLE Warehouse (Wid int primary key , Pid int references Product(Pid) , Items_available int);

CREATE TABLE Cart (Cid int references Customers(Cid) , Pid int references Product(Pid) , No_Of_items int);

CREATE TABLE Sell (Cid int references Customers(Cid) , Sid int references Seller(Sid));

CREATE TABLE Customer_contact_details (Cemail varchar(100) references Customers(Cemail) , Cpassword varchar(20) , Cmnum int);

drop table Customer_contact_details;
drop table Customers;
drop procedure create_account;
DELIMITER //
CREATE procedure create_account(
 Cemail varchar(100),
 Cpassword varchar(20),
 Cmnum int,
 Cname varchar(20),
 caddress varchar(20)
 )
begin
   #insert record into Customers
    insert into Customers values(Cemail,Cname,Caddress,NULL);
   #insert record into Customer_contact_details
   insert into Customer_contact_details values(Cemail,Cpassword,Cmnum);
end //
DELIMITER ;

CALL create_account('akshayapsangi123@gmail.com','akshay123',13,'akshay','Bangalore');

drop table Customer_contact_details;

CREATE TABLE Product_Details (Pid int references Product(Pid) , Wid int references Warehouse(Wid) , Brand varchar(20) , Cost float);

Insert into Product values(1,'Mobile_Phones','True');
Insert into Product values(2,'Refrigerators','false');
Insert into Product values(3,'AirConditioners','True');
Insert into Product values(4,'WashingMachines','false');
Insert into Product values(5,'Shoes','true');
Insert into Product values(6,'Cupboards','false');
Insert into Product values(7,'Television','True');
Insert into Product values(8,'Laptops','True');
Insert into Product values(9,'Wrist watches','false');
Insert into Product values(10,'Headphones','True');

insert into Warehouse values(100,1,20);
insert into Warehouse values(101,2,0);
insert into Warehouse values(102,3,25);
insert into Warehouse values(103,4,0);
insert into Warehouse values(104,5,45);
insert into Warehouse values(105,6,0);
insert into Warehouse values(106,7,15);
insert into Warehouse values(107,8,10);
insert into Warehouse values(108,9,0);
insert into Warehouse values(109,10,30);

insert into Seller values(201,1,100,'Ramesh');
insert into Seller values(202,2,101,'Suresh');
insert into Seller values(203,3,102,'Shaila');
insert into Seller values(204,4,103,'Raju');
insert into Seller values(205,5,104,'Ananya');
insert into Seller values(206,6,105,'Arvind');
insert into Seller values(207,7,106,'Kusuma');
insert into Seller values(208,8,107,'Khushi');
insert into Seller values(209,9,108,'Nidhi');
insert into Seller values(210,10,109,'Diwakar');

insert into Administrator values(1000,100,'Radha');
insert into Administrator values(1001,101,'Abhishek');
insert into Administrator values(1002,102,'Simran');
insert into Administrator values(1003,103,'Sanavi');
insert into Administrator values(1004,104,'Karan');
insert into Administrator values(1005,105,'Vishal');
insert into Administrator values(1006,106,'Gopal');
insert into Administrator values(1007,107,'Esha');
insert into Administrator values(1008,108,'Raghu');
insert into Administrator values(1009,109,'Hita');

insert into Product_Details values(1,100,'Redmi',15000);
insert into Product_Details values(2,101,'Whirlpool',30000);
insert into Product_Details values(3,102,'Samsung',25000);
insert into Product_Details values(4,103,'IFB',35000);
insert into Product_Details values(5,104,'Adidas',3000);
insert into Product_Details values(6,105,'Godrej',5000);
insert into Product_Details values(7,106,'Sony',90000);
insert into Product_Details values(8,107,'HP',60000);
insert into Product_Details values(9,108,'Fast track',4000);
insert into Product_Details values(10,109,'Boat',1500);

select * FROM Product_Details;
select * from Product;