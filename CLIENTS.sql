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