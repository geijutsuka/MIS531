drop table AREAS;
drop table AREA_ZIP;
drop table BRANCHES;
drop table MAIN_BRANCHES;
drop table CAN_SERVICE;
drop table CLIENTS;
drop table CLIENT_SITES;
drop table COMMENTS;
drop table COURSES;
drop table CUSTOMER_REPS;
drop table CUSTOMER_REP_SPECIALTIES;
drop table CUSTOMER_REP_TEAMS;
drop table DISTRIBUTE;
drop table DISTRIBUTION_DETAILS;
drop table EMAIL;
drop table EMERGENCY_ORDER;
drop table EMPLOYEES;
drop table FUNCTIONAL_EMPLOYEES;
drop table INCIDENTS;
drop table ITEMS;
drop table MANAGERS;
drop table BRAND_MANAGERS;
drop table PRODUCT_LINE_MANAGERS;
drop table REGIONAL_MANAGERS;
drop table MARKET_DEMOGRAPHICS;
drop table NEW_PRODUCT;
drop table ORDERS;
drop table ORDER_DETAILS;
drop table PRODUCTS;
drop table PRODUCT_GROUPS;
drop table PRODUCT_LINES;
drop table PROMOTE;
drop table PROMOTIONS;
drop table REGIONS;
drop table REPORT;
drop table REVIEWS;
drop table REVIEW_DETAILS;
drop table SALARIED;
drop table SESSIONS;
drop table SPECIALIZES;
drop table STATES;
drop table TAXES;
drop table TEMPORARY;
drop table TRAIN_AT;
drop table VISIT;
drop table VISIT_DETAILS;

-- Create tables

CREATE TABLE AREAS (
   areaID char(4),
   state char(2),
   CONSTRAINT areas_pk PRIMARY KEY (areaID),
   FOREIGN KEY (state) REFERENCES STATES (state)

);

CREATE TABLE AREA_ZIP (
   areaID char(4),
   zip char(5),
   CONSTRAINT area_zip_pk PRIMARY KEY (areaID, zip),
   FOREIGN KEY (areaID) REFERENCES AREAS (areaID)
);

CREATE TABLE BRANCHES (
   branchID char(4),
   branch_name varchar(255) CONSTRAINT branches_nn NOT NULL,
   branch_type varchar(255),
   street varchar(255),
   city varchar(255),
   state char(2),
   zip char(5),
   main_branch_ID char (4),
   CONSTRAINT branches_pk PRIMARY KEY (branchID),
   FOREIGN KEY (main_branch_ID) REFERENCES MAIN_BRANCHES (main_branch_ID)

);

CREATE TABLE MAIN_BRANCHES (
   main_branch_ID char(5),
   regionID char(5),
   CONSTRAINT main_branches_pk PRIMARY KEY (main_branch_ID, regionID),
   FOREIGN KEY (main_branch_ID) REFERENCES BRANCHES (branchID),
   FOREIGN KEY (regionID) REFERENCES REGIONS (regionID)
);


CREATE TABLE CAN_SERVICE (
   clientID char(4),
   empID char(9),
   CONSTRAINT can_service_pk PRIMARY KEY (clientID, empID),
   FOREIGN KEY (clientID) REFERENCES CLIENTS (clientID),
   FOREIGN KEY (empID) REFERENCES EMPLOYEES (empID)
);


CREATE TABLE CLIENTS (
   clientID char(4),
   name varchar(255),
   street varchar(255),
   city varchar(255),
   state char(2),
   zip char(5),
   primary_contact_name varchar(255),
   primary_contact_title varchar(255),
   primary_contact_phone varchar(10),
   primary_contact_email varchar(255),
   discount number(1,2),
   CONSTRAINT clients_pk PRIMARY KEY (clientID)

);


CREATE TABLE CLIENT_SITES (
   siteID char(6),
   size number(4),
   street varchar(255),
   city varchar(255),
   state char(2),
   zip char(5),
   clientID char(4) CONSTRAINT clients_nn NOT NULL,
   areaID char(4),
   CONSTRAINT client_sites_pk PRIMARY KEY (siteID),
   FOREIGN KEY (clientID) REFERENCES CLIENTS (clientID),
   FOREIGN KEY (areaID) REFERENCES AREAS (areaID),
   CONSTRAINT client_site_emp_size CHECK (size BETWEEN 1 AND 9999)
);


CREATE TABLE COMMENTS (
   review_details_ID char(12),
   comments varchar(2000),
   CONSTRAINT comments_pk PRIMARY KEY (review_details_ID),
   FOREIGN KEY (review_details_ID) REFERENCES REVIEWS (review_details_ID)

);


CREATE TABLE COURSES  (
   courseID char(7),
   course_name varchar(255),
   description varchar(255),
   cost number(5,2),
   product_group_ID char(4) CONSTRAINT courses_product_group_nn NOT NULL,
   CONSTRAINT courses_pk PRIMARY KEY (courseID),
   CONSTRAINT courses_cost CHECK (cost BETWEEN 0 AND 99999.99),
   FOREIGN KEY (product_group_ID) REFERENCES PRODUCT_GROUPS (product_group_ID)
);


CREATE TABLE CUSTOMER_REPS (
   empID char(9),
   seniority varchar(255),
   full-time_or_trainee varchar(255) CONSTRAINT ft_or_trainee_nn NOT NULL,
   commission_rate number(1,2),
   bonus_amount number(5,2),
   quarter_bonus number(1),
   branchID char(4),
   teamID char(5),
   CONSTRAINT customer_reps_pk PRIMARY KEY (empID, teamID),
   FOREIGN KEY (empID) REFERENCES EMPLOYEES (empID),
   FOREIGN KEY (teamID) REFERENCES CUSTORMER_REP_TEAMS (teamID),
   CONSTRAINT cust_rep_quarter_bonus CHECK (quarter_bonus BETWEEN 1 AND 4),
   CONSTRAINT cust_rep_bonus_amount CHECK (bonus_amount BETWEEN 0 AND 99999.99)

);


CREATE TABLE CUSTOMER_REP_SPECIALTIES (
   empID char(9),
   specialty char(4),
   FOREIGN KEY (empID) REFERENCES CUSTOMER_REPS (empID),
   FOREIGN KEY (specialty) REFERENCES PRODUCT_GROUPS (specialty),
);


CREATE TABLE CUSTOMER_REP_TEAMS (
   teamID char(5), 
   team_name varchar(255), 
   team_leadID char(9) CONSTRAINT cust_rep_team_leadID_nn NOT NULL, 
   form_date date, 
   office_area char(4), 
   CONSTRAINT customer_rep_teams_pk PRIMARY KEY (teamID),
   FOREIGN KEY (team_leadID) REFERENCES EMPLOYEES (team_leadID),
   FOREIGN KEY (office_area) REFERENCES AREAS (office_area)

);


CREATE TABLE DISTRIBUTE (
   stateID char(2), 
   productID char(6), 
   dist_details_ID char(12),
   CONSTRAINT distribute_pk PRIMARY KEY (stateID, productID, dist_details_ID),
   FOREIGN KEY (stateID) REFERENCES STATES (stateID),
   FOREIGN KEY (productID) REFERENCES PRODUCTS (productID),
   FOREIGN KEY (dist_details_ID) REFERENCES DISTRIBUTION_DETAILS (dist_details_ID)
);


CREATE TABLE DISTRIBUTION_DETAILS (
   dist_details_ID char(12), 
   state_price_premium number(5,2),
   price_change_count number(5),
   CONSTRAINT distribute_details_pk PRIMARY KEY (dist_details_ID)

);


CREATE TABLE EMAIL (
   empID char(9), 
   email varchar(255),
   CONSTRAINT email_pk PRIMARY KEY (empID, email),
   FOREIGN KEY (empID) REFERENCES EMPLOYEES (empID)
);


CREATE TABLE EMERGENCY_ORDER (
   orderID char(13), 
   assigned_cus_repID char(9),
   CONSTRAINT emergency_order_pk PRIMARY KEY (orderID, assigned_cus_repID),
   FOREIGN KEY (orderID) REFERENCES ORDERS (orderID),
   FOREIGN KEY (assigned_cus_repID) REFERENCES CUSTOMER_REPS (empID)
);


CREATE TABLE EMPLOYEES (
   empID char(9), 
   SSN char(9), 
   start_date date, 
   end_date date, 
   DOB date, 
   FName varchar (255), 
   Initial varchar(20), 
   LName varchar(255),
   branchID char(4),
   CONSTRAINT employees_pk PRIMARY KEY (empID),
   FOREIGN KEY (branchID) REFERENCES BRANCHES (branchID),
   CONSTRAINT emp_ssn_unique UNIQUE (ssn)
);


CREATE TABLE FUNCTIONAL_EMPLOYEES (
   empID char(9), 
   role varchar(255), 
   branchID,
   CONSTRAINT functional_employees_pk PRIMARY KEY (empID, role, branchID),
   FOREIGN KEY (empID) REFERENCES EMPLOYEES (empID),
   FOREIGN KEY (branchID) REFERENCES BRANCHES (branchID)
);


CREATE TABLE INCIDENTS (
   incidentID char(12), 
   incident_date date,
   complaint_date date,
   description varchar(2000), 
   count number(7), 
   orderID char (13) CONSTRAINT incident_orderID_nn NOT NULL,
   CONSTRAINT incidents_pk PRIMARY KEY (incidentID),
   FOREIGN KEY (orderID) REFERENCES ORDERS (orderID) 
);


CREATE TABLE ITEMS (
   order_details_ID char(13),
   discount number (1,2), 
   productID char(6), 
   unitprice number(4,2), 
   qty number(4),
   CONSTRAINT items_pk PRIMARY KEY (order_details_ID, productID),
   FOREIGN KEY (order_details_ID) REFERENCES ORDER_DETAILS (order_details_ID),
   FOREIGN KEY (productID) REFERENCES PRODUCTS (productID)
);


CREATE TABLE MANAGERS (
   empID char(9),
   years_experience number(2), 
   branchID char(4),
   CONSTRAINT managers_pk PRIMARY KEY (empID, branchID),
   FOREIGN KEY (branchID) REFERENCES BRANCHES (branchID),
   FOREIGN KEY (empID) REFERENCES EMPLOYEES (empID)

);


CREATE TABLE BRAND_MANAGERS (
   empID char(9), 
   promoID char(7),
   CONSTRAINT brand_managers_pk PRIMARY KEY (empID, promoID),
   FOREIGN KEY (empID) REFERENCES EMPLOYEES (empID),
   FOREIGN KEY (promoID) REFERENCES PROMOTIONS (promoID)
);

CREATE TABLE PRODUCT_LINE_MANAGERS (
   empID char(9), 
   line_number char(8),
   CONSTRAINT product_line_managers_pk PRIMARY KEY (empID, line_number),
   FOREIGN KEY (empID) REFERENCES EMPLOYEES (empID),
   FOREIGN KEY (line_number) REFERENCES PRODUCT_LINES (line_number)
);


CREATE TABLE REGIONAL_MANAGERS (
   empID char(9),
   regionID char(5),
   CONSTRAINT regional_managers_pk PRIMARY KEY (empID, regionID),
   FOREIGN KEY (empID) REFERENCES EMPLOYEES (empID),
   FOREIGN KEY (regionID) REFERENCES REGIONS (regionID)
);


CREATE TABLE MARKET_DEMOGRAPHICS (
   stateID char(2), 
   demographic varchar(255),
   CONSTRAINT market_demographics_pk PRIMARY KEY (state_ID, demographic),
   FOREIGN KEY (stateID) REFERENCES STATES (stateID)
);


CREATE TABLE NEW_PRODUCT (
   visit_details_ID char(8),
   productID char(6),
   CONSTRAINT new_product_pk PRIMARY KEY (visit_details_ID, productID),
   FOREIGN KEY (visit_details_ID) REFERENCES VISIT_DETAILS (visit_details_ID),
   FOREIGN KEY (productID) REFERENCES PRODUCTS (productID)

);


CREATE TABLE ORDERS (
   orderID char(13), 
   order_date date, 
   order_time date, 
   status varchar(255), 
   description varchar(2000), 
   resolution_date date, 
   resolution_time date,  
   siteID char(6) CONSTRAINT orders_siteID_nn NOT NULL,
   CONSTRAINT orders_pk PRIMARY KEY (orderID),
   FOREIGN KEY (siteID) REFERENCES CLIENT_SITES (siteID)
);


CREATE TABLE ORDER_DETAILS (
   order_details_ID char(14),
   siteID char(6) CONSTRAINT order_details_siteID_nn NOT NULL, 
   orderID char(13) CONSTRAINT order_details_orderID_nn NOT NULL, 
   ship_date date, 
   ship_method varchar(255),
   CONSTRAINT order_details_pk PRIMARY KEY (order_details_ID),
   FOREIGN KEY (siteID) REFERENCES CLIENT_SITES (siteID),
   FOREIGN KEY (orderID) REFERENCES ORDERS (orderID)

);


CREATE TABLE PRODUCTS (
   productID char(6),
   brand varchar(255),
   product_avg_cost number(5,2),
   line_number number(8) CONSTRAINT products_line_number_nn NOT NULL,
   CONSTRAINT products_pk PRIMARY KEY (productID),
   FOREIGN KEY (line_number) REFERENCES PRODUCT_LINES (line_number)
);


CREATE TABLE PRODUCT_GROUPS (
   product_group_ID char(4),
   group_name varchar(255),
   CONSTRAINT product_groups_pk PRIMARY KEY (product_group_ID)
);


CREATE TABLE PRODUCT_LINES (
   line_number char(8),
   line_notes varchar(2000),
   line_began date,
   line_name varchar(255),
   highest_profit_item varchar(255),
   highest_volume_item varchar(255),
   CONSTRAINT product_lines_pk PRIMARY KEY (line_number)

);


CREATE TABLE PROMOTE (
   promoID char(7),
   productID char(6),
   stateID char(2),
   CONSTRAINT promote_pk PRIMARY KEY (promoID, productID, stateID),
   FOREIGN KEY (promoID) REFERENCES PROMOTIONS (promoID),
   FOREIGN KEY (productID) REFERENCES PRODUCTS (productID),
   FOREIGN KEY (stateID) REFERENCES STATES (stateID)

);


CREATE TABLE PROMOTIONS (
   promoID char(7),
   start_date date,
   end_date date,
   budget number(8,2),
   empID char(9),
   CONSTRAINT promotions_pk PRIMARY KEY (promoID),
   FOREIGN KEY (employees_pk) REFERENCES EMPLOYEES (empID),
   CONSTRAINT promotion_budget CHECK (budget BETWEEN 0 AND 99999999.99)
);


CREATE TABLE REGIONS (
   regionID char(5), 
   regionName varchar(255),
   CONSTRAINT regions_pk PRIMARY KEY (regionID)

);


CREATE TABLE REPORT (
   clientID char(4),
   empID char(9),
   incidentID char(12),
   CONSTRAINT report_pk PRIMARY KEY (clientID, empID, incidentID),
   FOREIGN KEY (clientID) REFERENCES CLIENTS (clientID),
   FOREIGN KEY (empID) REFERENCES EMPLOYEES (empID),
   FOREIGN KEY (incidentID) REFERENCES INCIDENTS (incidentID)
);


CREATE TABLE REVIEWS (
   reviewID char(12),
   incidentID char(12) CONSTRAINT reviews_incidentID_nn NOT NULL,
   empID char(9) CONSTRAINT reviews_empID_nn NOT NULL,
   CONSTRAINT reviews_pk PRIMARY KEY (reviewID),
   FOREIGN KEY (empID) REFERENCES EMPLOYEES (empID),
   FOREIGN KEY (incidentID) REFERENCES INCIDENTS (incidentID)
);


CREATE TABLE REVIEW_DETAILS (
   review_details_ID char(12),
   clientID char(4) CONSTRAINT review_details_clientID_nn NOT NULL,
   review_date date,
   CONSTRAINT review_details_pk PRIMARY KEY (review_details_ID),
   FOREIGN KEY (clientID) REFERENCES CLIENTS (clientID)

);


CREATE TABLE SALARIED (
   empID char(9),
   salary number(9,2),
   role varchar(255),
   status varchar(255),
   CONSTRAINT salaried_pk PRIMARY KEY (empID, salary),
   FOREIGN KEY (empID) REFERENCES EMPLOYEES (empID),
   CONSTRAINT salaried_salary CHECK(salary BETWEEN 0 AND 999999999.99)

);


CREATE TABLE SESSIONS (
   sessionID char(7), 
   courseID char(7)
   start_date date,
   end_date date,
   location varchar(255),
   empID char(9),
   CONSTRAINT sessions_pk PRIMARY KEY (sessionID),
   FOREIGN KEY (empID) REFERENCES EMPLOYEES (empID),
   FOREIGN KEY (courseID) REFERENCES COURSES (courseID)

);


CREATE TABLE SPECIALIZES (
   product_group_ID char(4),
   sessionID char(9),
   CONSTRAINT specializes_pk PRIMARY KEY (product_group_ID, sessionID),
   FOREIGN KEY (sessionID) REFERENCES SESSIONS (sessionID),
   FOREIGN KEY (product_group_ID) REFERENCES PRODUCT_GROUPS (product_group_ID)

);


CREATE TABLE STATES (
   stateID char(2),
   name varchar(255),
   network_rating varchar(255),
   transportation_cost number(4,2),
   CONSTRAINT states_pk PRIMARY KEY (stateID)

);


CREATE TABLE TAXES (
   stateID char(2),
   taxRate number(1,2),
   CONSTRAINT taxes_pk PRIMARY KEY (stateID, taxRate),
   FOREIGN KEY (stateID) REFERENCES STATES (stateID),
   CONSTRAINT taxes_rate CHECK (taxRate BETWEEN 0 AND 1.00)

);


CREATE TABLE TEMPORARY (
   empID char(9),
   hourly_wage number(4,2),
   CONSTRAINT temporary_pk PRIMARY KEY (empID,hourly_wage),
   FOREIGN KEY (empID) REFERENCES EMPLOYEES (empID),
   CONSTRAINT temporary_wage CHECK (hourly_wage BETWEEN 0 AND 9999.99)
);


CREATE TABLE TRAIN_AT (
   sessionID char (7),
   empID char(9),
   CONSTRAINT train_at_pk PRIMARY KEY (sessionID, empID),
   FOREIGN KEY (sessionID) REFERENCES SESSIONS(sessionID),
   FOREIGN KEY (empID) REFERENCES EMPLOYEES (empID)
);


CREATE TABLE VISITS (
   visitID char(6),
   siteID char(6) CONSTRAINT visit_siteID_nn NOT NULL,
   teamID char(5) CONSTRAINT visit_teamID_nn NOT NULL,
   CONSTRAINT visit_pk PRIMARY KEY (visitID),
   FOREIGN KEY (siteID) REFERENCES CLIENT_SITES (siteID),
   FOREIGN KEY (teamID) REFERENCES CUSTORMER_REP_TEAMS (teamID)

);


CREATE TABLE VISIT_DETAILS (
   visit_details_ID char (8),
   visitID char(6) CONSTRAINT visit_details_nn NOT NULL,
   feedback varchar(2000),
   visit_date date,
   CONSTRAINT visit_details_pk PRIMARY KEY(visit_details_ID),
   FOREIGN KEY (visitID) REFERENCES VISITS (visitID)
);
