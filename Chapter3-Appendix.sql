-- Create first table AREAS with  constraints
CREATE TABLE AREAS (
    area_id   INT   NOT NULL UNIQUE,
    area_type VARCHAR(60) NOT NULL,
    area_name VARCHAR(60),
    PRIMARY KEY(area_id)
);

CREATE TABLE BRANCH_EMPLOYEES (
   branch_id int FOREIGN KEY REFERENCES BRANCHES(branch_id),
   empl_id int FOREIGN KEY REFERENCES EMPLOYEES(empl_id)
);

-- Create table BRANCHES with  constraints
CREATE TABLE BRANCHES (
   branch_id   INT   NOT NULL UNIQUE,
   branch_type VARCHAR(60) NOT NULL,
   branch_name VARCHAR(60),
   branch_street VARCHAR(60),
   branch_city VARCHAR(60),
   branch_zipcode INT,
   PRIMARY KEY(branch_id)
);

CREATE TABLE BRAND_MANAGERS (
   empl_id int FOREIGN KEY REFERENCES EMPLOYEES(empl_id),
   promo_id int FOREIGN KEY REFERENCES PROMOTIONS(promo_id)
);

CREATE TABLE CLIENT_SITES (
  clientsite_id   INT   NOT NULL UNIQUE,
  client_id int FOREIGN KEY REFERENCES CLIENTS(client_id),
  clientsite_size NUMBER,
  clientsite_street VARCHAR(60),
  clientsite_city VARCHAR(60),
  clientsite_state VARCHAR(2),
  clientsite_zipcode INT,
  PRIMARY KEY(clientsite_id)
);

CREATE TABLE CLIENTS (
   client_id   INT   NOT NULL UNIQUE,
   client_name VARCHAR(60),
   client_street VARCHAR(60),
   client_city VARCHAR(60),
   client_zipcode INT,
   client_discount CHAR(2),
   clientprimcontact_fname VARCHAR(20),
   clientprimcontact_minitial CHAR(1),
   clientprimcontact_lname VARCHAR(20),
   clientprimcontact_title VARCHAR(50),
   clientprimcontact_phone CHAR(12),
   clientprimcontact_email VARCHAR(20),
   PRIMARY KEY(client_id)
);

CREATE TABLE COURSES (
  course_id   INT   NOT NULL UNIQUE,
  course_name NUMBER,
  course_description NUMBER,
  course_cost NUMBER,
  group_id int FOREIGN KEY REFERENCES PRODUCT_GROUPS(group_id)
  PRIMARY KEY(course_id)
);

CREATE TABLE CUSTOMER_REP_TEAMS (
   team_id   INT   NOT NULL UNIQUE,
   team_name VARCHAR(20) NOT NULL,
   team_lead_id int FOREIGN KEY REFERENCES EMPLOYEES(empl_id),
   team_members_num NUMBER,
   team_form_date DATE,
   team_speciality VARCHAR(40),
   team_office_area VARCHAR(20),
   PRIMARY KEY(team_id)
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