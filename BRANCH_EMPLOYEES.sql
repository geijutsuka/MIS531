CREATE TABLE BRANCH_EMPLOYEES (
   branch_id int FOREIGN KEY REFERENCES Branches(branch_id),
   empl_id int FOREIGN KEY REFERENCES Employees(empl_id)
);