-- Create first table BRANCHES with  constraints
CREATE TABLE BRANCHES (
   branch_id   INT   NOT NULL UNIQUE,
   branch_type VARCHAR(60) NOT NULL,
   branch_name VARCHAR(60),
   branch_street VARCHAR(60),
   branch_city VARCHAR(60),
   branch_zipcode INT,
   PRIMARY KEY(branch_id)
);

-- branch managers go here
--skipping for now

-- create table for client_sites
CREATE TABLE CLIENT_SITES (
   branch_id   INT   NOT NULL UNIQUE,
   branch_type VARCHAR(60) NOT NULL,
   branch_name VARCHAR(60),
   branch_street VARCHAR(60),
   branch_city VARCHAR(60),
   branch_zipcode INT,
   PRIMARY KEY(branch_id)
);


--Regions has to be created next as Main Branches depends on Regions
CREATE TABLE Regions (
   region_id   INT   NOT NULL UNIQUE,
   PRIMARY KEY(region_id)
);

-- create Main Branches table that has two foreign keys
CREATE TABLE Main_Branches (
   branch_id int FOREIGN KEY REFERENCES Branches(branch_id),
   region_id int FOREIGN KEY REFERENCES Regions(region_id)
);

-- Create table for employees

CREATE TABLE Employees (
   empl_id   INT   NOT NULL UNIQUE,
   empl_fname VARCHAR(20) NOT NULL,
   empl_minitial CHAR(1),
   empl_lname VARCHAR(40),
   empl_dob DATE,
   empl_street VARCHAR(40),
   empl_city VARCHAR(20),
   empl_state CHAR(2),
   empl_zipcode CHAR(10),
   ssn VARCHAR(12),
   empl_email VARCHAR(60),
   empl_startDate DATE,
   empl_endDate DATE,
   PRIMARY KEY(empl_id)
);