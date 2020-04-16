-- Create first table AREAS with  constraints
CREATE TABLE AREAS (
   branch_id   INT   NOT NULL UNIQUE,
   branch_type VARCHAR(60) NOT NULL,
   branch_name VARCHAR(60),
   branch_street VARCHAR(60),
   branch_city VARCHAR(60),
   branch_zipcode INT,
   PRIMARY KEY(branch_id)
);