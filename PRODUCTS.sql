-- Create first table PRODUCTS with  constraints
CREATE TABLE PRODUCTS (
   product_id char(4) constraint prod_pk PRIMARY KEY,
   grp_id char(4) constraint grp_fk REFERENCES PRODUCT_GROUPS NOT NULL,
   product_brand varchar(60), --Should this be a varchar or a number?
   product_avgcostper number(6,3) --What is a reasonable number length here??
);