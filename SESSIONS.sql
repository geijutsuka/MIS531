-- Create table SESSIONS with constraints
CREATE TABLE SESSIONS (
   session_id char(4) constraint session_pk PRIMARY KEY, 
   session_start date,
   session_end date,
   session_location varchar(60),
   instructor char(4) constraint session_inst_fk REFERENCES EMPLOYEES
);