-- Create first table EMPLOYEE_EMAILS with  constraints
CREATE TABLE EMPLOYEE_EMAILS (
   emp_id char(4) constraint emp_email_fk REFERENCES EMPLOYEES,
   emp_email varchar(6),
   constraint emp_email_pk PRIMARY KEY(emp_id)
);