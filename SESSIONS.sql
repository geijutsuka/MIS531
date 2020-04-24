-- Create table SESSIONS with constraints
CREATE TABLE SESSIONS (
   sessionID char(7) constraint session_pk PRIMARY KEY, 
   start_date date,
   end_date date,
   location varchar(255),
   empID char(9) constraint session_fk REFERENCES EMPLOYEES
);