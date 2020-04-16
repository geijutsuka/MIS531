-- create Main Branches table that has two foreign keys
CREATE TABLE MAIN_BRANCHES (
   branch_id int FOREIGN KEY REFERENCES BRANCHES(branch_id),
   region_id int FOREIGN KEY REFERENCES REGIONS(region_id)
);