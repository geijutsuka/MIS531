-- Create first table BRANCHES with  constraints
CREATE TABLE Branches (
   branch_id   INT   NOT NULL UNIQUE,
   branch_type VARCHAR(60) NOT NULL,
   street VARCHAR(60),
   city VARCHAR(60),
   zipcode INT,
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
