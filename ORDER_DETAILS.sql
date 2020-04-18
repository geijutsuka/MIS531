-- Create first table ORDER_DETAILS with  constraints
CREATE TABLE ORDER_DETAILS (
   order_id char(4) constraint order_fk REFERENCES ORDERS,
   client_id varchar(60) constraint client_fk REFERENCES CLIENTS,
   orderdetails_shipdate date,
   orderdetails_shipmethod varchar(60),
   orderdetails_qty number(5), -- what is a reasonable amount here?
   orderdetails_unitprice number(5) --what is a reasonable amount here?,
   orderdetails_discount number(5) -- what is a reasonable amount here?,
   constraint order_details_pk PRIMARY KEY(order_id, client_id)
);