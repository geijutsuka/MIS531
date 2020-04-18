-- Create first table REVIEW_DETAILS with  constraints
CREATE TABLE REVIEW_DETAILS (
   client_id char(4) constraint rev_clientid_pk PRIMARY KEY,
   review_date date,
   review_comments VARCHAR(255),
   constraint rev_details_fk REFERENCES CLIENTS
);