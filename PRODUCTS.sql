-- Create first table PRODUCTS with  constraints
CREATE TABLE PRODUCTS (
   productID char(6) constraint prod_pk PRIMARY KEY,
   brand varchar(255),
   product_avg_cost number(5,2)
   line_number constraint prod_fk REFERENCES PRODUCT_LINES
);