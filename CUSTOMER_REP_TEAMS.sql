CREATE TABLE CUSTOMER_REP_TEAMS (
   team_id   INT   NOT NULL UNIQUE,
   team_name VARCHAR(20) NOT NULL,
   team_lead_id int FOREIGN KEY REFERENCES EMPLOYEES(empl_id),
   team_members_num NUMBER,
   team_form_date DATE,
   team_speciality VARCHAR(40),
   team_office_area VARCHAR(20),
   PRIMARY KEY(team_id)
);