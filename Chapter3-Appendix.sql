-- Create first table BRANCHES with  constraints

CREATE TABLE Branches (
   branch_id   INT   NOT NULL UNIQUE,
   branch_type VARCHAR(60) NOT NULL,
   street VARCHAR(60),
   city VARCHAR(60),
   zipcode INT,
   PRIMARY KEY(branch_id)
);
