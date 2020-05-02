drop table AREAS CASCADE CONSTRAINTS;
drop table AREA_ZIP CASCADE CONSTRAINTS;
drop table BRANCHES CASCADE CONSTRAINTS;
drop table MAIN_BRANCHES CASCADE CONSTRAINTS;
drop table CAN_SERVICE_AREA CASCADE CONSTRAINTS;
drop table CAN_SERVICE_CLIENT CASCADE CONSTRAINTS;
drop table CLIENT_SITES CASCADE CONSTRAINTS;
drop table CLIENTS CASCADE CONSTRAINTS;
drop table COURSES CASCADE CONSTRAINTS;
drop table CUSTOMER_REPS CASCADE CONSTRAINTS;
drop table CUSTOMER_REP_SPECIALTIES CASCADE CONSTRAINTS;
drop table CUSTOMER_REP_TEAMS CASCADE CONSTRAINTS;
drop table DISTRIBUTE CASCADE CONSTRAINTS;
drop table DISTRIBUTION_DETAILS CASCADE CONSTRAINTS ;
drop table EMERGENCY_ORDER CASCADE CONSTRAINTS;
drop table EMPLOYEES CASCADE CONSTRAINTS;
drop table MANAGERS CASCADE CONSTRAINTS ;
drop table FUNCTIONAL_EMPLOYEES CASCADE CONSTRAINTS;
drop table BRAND_MANAGERS CASCADE CONSTRAINTS;
drop table PRODUCT_LINE_MANAGERS CASCADE CONSTRAINTS;
drop table REGIONAL_MANAGERS CASCADE CONSTRAINTS;
drop table SALARIED CASCADE CONSTRAINTS;
drop table TEMPORARY CASCADE CONSTRAINTS;
drop table INCIDENTS CASCADE CONSTRAINTS;
drop table ITEMS CASCADE CONSTRAINTS;
drop table NEW_PRODUCTS CASCADE CONSTRAINTS;
drop table ORDERS CASCADE CONSTRAINTS;
drop table ORDER_DETAILS CASCADE CONSTRAINTS;
drop table PRODUCTS CASCADE CONSTRAINTS;
drop table PRODUCT_GROUPS CASCADE CONSTRAINTS;
drop table PRODUCT_LINES CASCADE CONSTRAINTS;
drop table PROMOTE CASCADE CONSTRAINTS;
drop table PROMOTIONS CASCADE CONSTRAINTS;
drop table REGIONS CASCADE CONSTRAINTS;
drop table REPORT CASCADE CONSTRAINTS;
drop table REVIEW_DETAILS CASCADE CONSTRAINTS;
drop table SESSIONS CASCADE CONSTRAINTS;
drop table SPECIALIZES CASCADE CONSTRAINTS;
drop table STATES CASCADE CONSTRAINTS;
drop table TAXES CASCADE CONSTRAINTS;
drop table TRAIN_AT CASCADE CONSTRAINTS;
drop table VISITS CASCADE CONSTRAINTS;
drop table VISIT_DETAILS CASCADE CONSTRAINTS;

ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH24:MI';

-- Create tables

CREATE TABLE AREAS (
   areaID char(4),
   stateID char(2) CONSTRAINT areas_state_nn NOT NULL,
   CONSTRAINT areas_pk PRIMARY KEY (areaID)
);

CREATE TABLE AREA_ZIP (
   areaID char(4),
   zip number(5),
   CONSTRAINT area_zip_pk PRIMARY KEY (areaID, zip)
);

CREATE TABLE BRANCHES (
   branchID char(4),
   branch_name varchar(55) CONSTRAINT branches_nn NOT NULL,
   branch_type varchar(20),
   street varchar(60),
   city varchar(32),
   stateID char(2),
   zip number(5),
   main_branch_ID char (4),
   CONSTRAINT branches_pk PRIMARY KEY (branchID)
);

CREATE TABLE MAIN_BRANCHES (
   main_branch_ID char(4),
   regionID char(5),
   CONSTRAINT main_branches_pk PRIMARY KEY (main_branch_ID, regionID)
);


CREATE TABLE CAN_SERVICE_AREA(
   areaID char(4),
   teamID char(5),
   CONSTRAINT can_service_area_pk PRIMARY KEY (areaID, teamID)
);

CREATE TABLE CAN_SERVICE_CLIENT(
   clientID char(5),
   empID char(9),
   CONSTRAINT can_service_client_pk PRIMARY KEY (clientID, empID)
);

CREATE TABLE CLIENT_SITES (
   siteID char(6),
   clientID char(5) CONSTRAINT clients_nn NOT NULL,
   areaID char(4),
   site_size number(4),
   street varchar(60),
   city varchar(32),
   stateID char(2),
   zip number(5),
   CONSTRAINT client_sites_pk PRIMARY KEY (siteID),
   CONSTRAINT client_site_emp_size CHECK (site_size BETWEEN 1 AND 9999)
);

CREATE TABLE CLIENTS (
   clientID char(5),
   name varchar(60),
   street varchar(60),
   city varchar(32),
   stateID char(2),
   zip number(5),
   discount number(3,2),
   primary_contact_fname varchar(60),
   primary_contact_minitial varchar(1),
   primary_contact_lname varchar(60),
   primary_contact_title varchar(100),
   primary_contact_phone varchar(10),
   primary_contact_email varchar(255),
   CONSTRAINT clients_pk PRIMARY KEY (clientID)
);


CREATE TABLE COURSES  (
   courseID char(7),
   course_name varchar(255),
   description varchar(2000),
   cost number(7,2),
   product_group_ID char(4) CONSTRAINT courses_product_group_nn NOT NULL,
   CONSTRAINT courses_pk PRIMARY KEY (courseID),
   CONSTRAINT courses_cost CHECK (cost BETWEEN 0 AND 9999999.99)
);

CREATE TABLE CUSTOMER_REPS (
   empID char(9),
   seniority varchar(20),
   fulltime_or_trainee varchar(10) CONSTRAINT ft_or_trainee_nn NOT NULL,
   commission_rate number(3,2),
   quarter_bonus number(1),
   bonus_amount number(7,2),
   branchID char(4),
   teamID char(5),
   CONSTRAINT customer_reps_pk PRIMARY KEY (empID),
   CONSTRAINT cust_rep_quarter_bonus CHECK (quarter_bonus BETWEEN 1 AND 4),
   CONSTRAINT cust_rep_bonus_amount CHECK (bonus_amount BETWEEN 0 AND 9999999.99)
);

CREATE TABLE CUSTOMER_REP_TEAMS (
   teamID char(5), 
   team_name varchar(60), 
   team_leadID char(9) CONSTRAINT cust_rep_team_leadID_nn NOT NULL, 
   form_date date, 
   office_area char(4),
   CONSTRAINT customer_rep_teams_pk PRIMARY KEY (teamID)
);


CREATE TABLE DISTRIBUTE (
   stateID char(2), 
   productID char(6), 
   dist_details_ID char(12),
   CONSTRAINT distribute_pk PRIMARY KEY (stateID, productID, dist_details_ID)
);


CREATE TABLE DISTRIBUTION_DETAILS (
   dist_details_ID char(12), 
   price_change_count number(5),
   state_price_premium number(5,2),
   CONSTRAINT distribute_details_pk PRIMARY KEY (dist_details_ID)
);


CREATE TABLE EMERGENCY_ORDER (
   orderID char(13), 
   assigned_cus_repID char(9),
   CONSTRAINT emergency_order_pk PRIMARY KEY (orderID, assigned_cus_repID)
);


CREATE TABLE EMPLOYEES (
   empID char(9), 
   FName varchar (60), 
   MInitial varchar(1), 
   LName varchar(60),
   email varchar(255) CONSTRAINT employee_email_nn NOT NULL,
   DOB date, 
   street varchar(60),
   city varchar(32),
   emp_state char(2),
   zip number(5),
   SSN char(9), 
   start_date date, 
   end_date date, 
   branchID char(4),
   CONSTRAINT employees_pk PRIMARY KEY (empID),
   CONSTRAINT emp_ssn_unique UNIQUE (ssn)
);


CREATE TABLE FUNCTIONAL_EMPLOYEES (
   empID char(9), 
   role varchar(32), 
   branchID char(4),
   CONSTRAINT functional_employees_pk PRIMARY KEY (empID, role, branchID)
);

CREATE TABLE MANAGERS (
   empID char(9),
   years_experience number(2), 
   branchID char(4),
   CONSTRAINT managers_pk PRIMARY KEY (empID, branchID)

);


CREATE TABLE BRAND_MANAGERS (
   empID char(9), 
   promoID char(7),
   CONSTRAINT brand_managers_pk PRIMARY KEY (empID, promoID)
);

CREATE TABLE PRODUCT_LINE_MANAGERS (
   empID char(9), 
   line_number number(8),
   CONSTRAINT product_line_managers_pk PRIMARY KEY (empID, line_number)
);


CREATE TABLE REGIONAL_MANAGERS (
   empID char(9),
   regionID char(5),
   CONSTRAINT regional_managers_pk PRIMARY KEY (empID, regionID)
);

CREATE TABLE SALARIED (
   empID char(9),
   salary number(11,2),
   role varchar(32),
   status varchar(10),
   CONSTRAINT salaried_pk PRIMARY KEY (empID, salary),
   CONSTRAINT salaried_salary CHECK(salary BETWEEN 0 AND 999999999.99)

);


CREATE TABLE TEMPORARY (
   empID char(9),
   hourly_wage number(6,2),
   CONSTRAINT temporary_pk PRIMARY KEY (empID,hourly_wage),
   CONSTRAINT temporary_wage CHECK (hourly_wage BETWEEN 0 AND 9999.99)
);


CREATE TABLE INCIDENTS (
   incidentID char(12), 
   incident_count number(7), 
   incident_date date,
   complaint_date date,
   description varchar(2000), 
   orderID char (13) CONSTRAINT incident_orderID_nn NOT NULL,
   CONSTRAINT incidents_pk PRIMARY KEY (incidentID)
);


CREATE TABLE ITEMS (
   order_details_ID char(14),
   qty number(4),
   unitprice number(6,2), 
   discount number (3,2), 
   productID char(6), 
   orderID char(13),
   CONSTRAINT items_pk PRIMARY KEY (order_details_ID, productID)

);


CREATE TABLE NEW_PRODUCTS (
   productID char(6),
   visit_details_ID char(8),
   CONSTRAINT new_product_pk PRIMARY KEY (productID, visit_details_ID)

);


CREATE TABLE ORDERS (
   orderID char(13), 
   order_date date, 
   order_time timestamp, 
   status varchar(32), 
   description varchar(2000), 
   siteID char(6) CONSTRAINT orders_siteID_nn NOT NULL,
   CONSTRAINT orders_pk PRIMARY KEY (orderID)
);


CREATE TABLE ORDER_DETAILS (
   order_details_ID char(14),
   orderID char(13) CONSTRAINT order_details_orderID_nn NOT NULL, 
   siteID char(6) CONSTRAINT order_details_siteID_nn NOT NULL, 
   ship_date date, 
   ship_method varchar(32),
   CONSTRAINT order_details_pk PRIMARY KEY (order_details_ID)

);


CREATE TABLE PRODUCTS (
   productID char(6),
   product_group_ID char(4),
   brand varchar(255),
   line_number number(8) CONSTRAINT products_line_number_nn NOT NULL,
   product_avg_cost number(7,2),
   CONSTRAINT products_pk PRIMARY KEY (productID)
);


CREATE TABLE PRODUCT_GROUPS (
   product_group_ID char(4),
   group_name varchar(60),
   CONSTRAINT product_groups_pk PRIMARY KEY (product_group_ID)
);

CREATE TABLE PRODUCT_LINES (
   line_number number(8),
   line_name varchar(60),
   line_began date,
   line_notes varchar(2000),
   highest_profit_item char(6),
   highest_volume_item char(6),
   CONSTRAINT product_lines_pk PRIMARY KEY (line_number)

);


CREATE TABLE PROMOTE (
   promoID char(7),
   productID char(6),
   stateID char(2),
   CONSTRAINT promote_pk PRIMARY KEY (promoID, productID, stateID)

);

CREATE TABLE PROMOTIONS (
   promoID char(7),
   productID char(6),
   start_date date,
   end_date date,
   budget number(10,2),
   empID char(9),
   CONSTRAINT promotions_pk PRIMARY KEY (promoID),
   CONSTRAINT promotion_budget CHECK (budget BETWEEN 0 AND 99999999.99)
);


CREATE TABLE REGIONS (
   regionID char(5), 
   regionName varchar(60),
   CONSTRAINT regions_pk PRIMARY KEY (regionID)

);


CREATE TABLE REPORT (
   clientID char(4),
   empID char(9),
   incidentID char(12),
   CONSTRAINT report_pk PRIMARY KEY (clientID, empID, incidentID)
);

CREATE TABLE REVIEW_DETAILS (
   reviewID char(12) CONSTRAINT review_details_reviewID_nn NOT NULL,
   clientID char(4) CONSTRAINT review_details_clientID_nn NOT NULL,
   review_date date,
   comment varchar(2000),
   CONSTRAINT review_details_pk PRIMARY KEY (reviewID)
);

CREATE TABLE SESSIONS (
   sessionID char(7), 
   courseID char(7),
   start_date date,
   end_date date,
   location varchar(255),
   instructor char(9),
   CONSTRAINT sessions_pk PRIMARY KEY (sessionID)
);


CREATE TABLE SPECIALIZES (
   product_group_ID char(4),
   sessionID char(7),
   CONSTRAINT specializes_pk PRIMARY KEY (product_group_ID, sessionID)

);


CREATE TABLE STATES (
   stateID char(2),
   name varchar(60),
   network_rating varchar(60),
   transportation_cost number(6,2),
   demographics varchar(2000),
   CONSTRAINT states_pk PRIMARY KEY (stateID)

);


CREATE TABLE TAXES (
   stateTax_percentage number(3,2),
   stateID char(2),
   CONSTRAINT taxes_pk PRIMARY KEY (stateTax_percentage, stateID),
   CONSTRAINT taxes_rate CHECK (stateTax_percentage BETWEEN 0 AND 1.00)

);

CREATE TABLE TRAIN_AT (
   sessionID char (7),
   empID char(9),
   CONSTRAINT train_at_pk PRIMARY KEY (sessionID, empID)

);

CREATE TABLE VISITS (
   visitID char(6),
   siteID char(6) CONSTRAINT visit_siteID_nn NOT NULL,
   teamID char(5) CONSTRAINT visit_teamID_nn NOT NULL,
   CONSTRAINT visit_pk PRIMARY KEY (visitID)

);

CREATE TABLE VISIT_DETAILS (
   visit_details_ID char (8),
   visitID char(6) CONSTRAINT visit_details_nn NOT NULL,
   visit_date date,
   feedback varchar(2000),
   CONSTRAINT visit_details_pk PRIMARY KEY(visit_details_ID)
);

CREATE TABLE CUSTOMER_REP_SPECIALTIES (
   empID char(9),
   specialty char(4),
   FOREIGN KEY (empID) REFERENCES CUSTOMER_REPS (empID),
   FOREIGN KEY (specialty) REFERENCES PRODUCT_GROUPS (product_group_ID),
   CONSTRAINT cusrep_specialties_pk PRIMARY KEY (empID, specialty)
);
