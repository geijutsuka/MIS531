CREATE TABLE EMPLOYEES (
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