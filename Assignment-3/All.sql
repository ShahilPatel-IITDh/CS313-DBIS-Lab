create user 'Shahil'@'localhost' identified by 'Password';
grant all privileges on lab3.* to 'Shahil'@'localhost';

-- command to change the user from root to Shahil

CREATE DATABASE lab3;
USE lab3;



CREATE TABLE part(part_no VARCHAR(2), part_name VARCHAR(10), color VARCHAR(10), weight VARCHAR(5), PRIMARY KEY(part_no));

CREATE TABLE supplier(supplier_no VARCHAR(2), sup_name VARCHAR(10), city VARCHAR(20), bank VARCHAR(10), PRIMARY KEY(supplier_no));

CREATE TABLE shipment(shipment_no VARCHAR(2), part_no VARCHAR(2), supplier_no VARCHAR(2), date VARCHAR(12), quantity VARCHAR(5), price VARCHAR(7), PRIMARY KEY (shipment_no), FOREIGN KEY (part_no) REFERENCES part(part_no), FOREIGN KEY (supplier_no) REFERENCES supplier(supplier_no));



