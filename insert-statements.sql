/*delete from customer_reps;
delete from customer_rep_teams;
delete from customer_reps;
delete from can_service_client;
delete from customer_rep_specialties;
delete from employees;
delete from incidents;
delete from order_details;
delete from orders;
delete from client_sites;
delete from items;
delete from products;
delete from product_lines;
delete from product_groups;
delete from areas;
delete from clients;
delete from can_service_area;
delete from states;*/

ALTER SESSION SET NLS_TIMESTAMP_FORMAT='HH24:MI';


-- Insert data for AREAS
insert into AREAS (AreaID, StateID) values (concat('A', to_char(areaid_seq.nextval)), 'TX');
insert into AREAS (AreaID, StateID) values (concat('A', to_char(areaid_seq.nextval)), 'FL');
insert into AREAS (AreaID, StateID) values (concat('A', to_char(areaid_seq.nextval)), 'VA');
insert into AREAS (AreaID, StateID) values (concat('A', to_char(areaid_seq.nextval)), 'NY');
insert into AREAS (AreaID, StateID) values (concat('A', to_char(areaid_seq.nextval)), 'AZ');
insert into AREAS (AreaID, StateID) values (concat('A', to_char(areaid_seq.nextval)), 'KS');
insert into AREAS (AreaID, StateID) values (concat('A', to_char(areaid_seq.nextval)), 'UT');
insert into AREAS (AreaID, StateID) values (concat('A', to_char(areaid_seq.nextval)), 'WA');
insert into AREAS (AreaID, StateID) values (concat('A', to_char(areaid_seq.nextval)), 'CA');
insert into AREAS (AreaID, StateID) values (concat('A', to_char(areaid_seq.nextval)), 'OR');

-- Insert data for EMPLOYEES
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Aimbo', 'Z', 'Hanway', 'rhanway0@virginia.edu', '23-JUL-1949', '9 Paget Trail', 'Columbus', 'GA', 14028, 440979838, '20-JUL-2012', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Eidel', 'I', 'Pattemore', 'spattemore1@reuters.com', '01-JAN-1958', '03232 Eagan Court', 'Charlotte', 'NC', 24830, 678888806, '02-APR-2008', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Ozu', 'L', 'Denford', 'idenford2@foxnews.com', '02-FEB-1978', '0 Troy Avenue', 'Washington', 'DC', 37985, 235873345, '01-JAN-2009', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Edgepulse', 'V', 'Abbey', 'cabbey3@homestead.com', '03-MAR-1977', '256 Hintze Road', 'Birmingham', 'AL', 78437, 368553445, '11-OCT-2004', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Kwideo', 'F', 'Gossan', 'jgossan4@msu.edu', '04-APR-1988', '1089 Killdeer Circle', 'Albuquerque', 'NM', 10459, 851732344, '01-MAR-2014', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Twitternation', 'F', 'Lenoir', 'llenoir5@comcast.net', '05-MAY-1980', '42400 South Parkway', 'Fort Lauderdale', 'FL', 43201, 506225656, '19-OCT-2015', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Dablist', 'L', 'Ship', 'sship6@nbcnews.com', '06-JUN-1999', '6 Milwaukee Trail', 'Erie', 'PA', 17075, 762055445, '28-NOV-2014', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Wikivu', 'P', 'People', 'wpeople7@hao123.com', '12-JUL-1990', '2 Hoffman Alley', 'Bellevue', 'WA', 87301, 937718989, '29-MAR-2002', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Trunyx', 'D', 'Kinig', 'skinig8@wunderground.com', '13-AUG-1979', '18 Gateway Drive', 'Philadelphia', 'PA', 93081, 628155663, '12-DEC-2001', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Kwilith', 'O', 'Crauford', 'ncrauford9@sciencedaily.com', '14-SEP-1983', '5190 Claremont Hill', 'Springfield', 'OH', 68678, 920945446, '04-APR-2002', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Realcube', 'I', 'Gecke', 'dgeckea@scribd.com', '15-OCT-1981', '3119 Kim Point', 'Tampa', 'FL', 11940, 890345455, '03-SEP-2003', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Twimm', 'Y', 'Mepham', 'mmephamb@themeforest.net', '16-NOV-1982', '17056 Loftsgordon Road', 'Bloomington', 'IN', 78187, 976923323, '09-OCT-2005', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Demivee', 'P', 'Wooddisse', 'gwooddissec@ucoz.ru', '17-DEC-1978', '3 Killdeer Trail', 'Port Charlotte', 'FL', 75834, 616522111, '01-JAN-2012', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Thoughtblab', 'C', 'Tales', 'ktalesd@marriott.com', '18-DEC-1969', '673 Dahle Avenue', 'Hollywood', 'FL', 57242, 631434322, '01-FEB-2008', '13-DEC-2018', NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Agivu', 'K', 'Penticost', 'vpenticoste@prweb.com', '19-FEB-1980', '83 Steensland Circle', 'Sacramento', 'CA', 29073, 104587787, '27-FEB-2007', '23-DEC-2017', NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Digitube', 'S', 'Crown', 'mcrownf@elpais.com', '20-JUL-1993', '37 Namekagon Plaza', 'Pinellas Park', 'FL', 69597, 555923232, '04-APR-2013', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Wikido', 'E', 'Reekie', 'areekieg@tamu.edu', '25-JUN-1991', '2 Scott Pass', 'Houston', 'TX', 23515, 371698996, '03-JUL-2011', '01-DEC-2018', NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Vidoo', 'O', 'Bremen', 'abremenh@geocities.com', '26-JUN-1996', '67043 Paget Junction', 'El Paso', 'TX', 52863, 504044444, '10-DEC-2011', NULL,NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Trilith', 'E', 'Marlor', 'dmarlori@goo.gl', '27-JAN-1968', '16 Jenifer Point', 'Atlanta', 'GA', 81395, 783222338, '15-JAN-2010', '16-JUL-2019', NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Devpulse', 'G', 'Gettens', 'xgettensj@bloomberg.com', '28-APR-1976', '7 Carey Hill', 'Raleigh', 'NC', 17256, 284846787, '22-JUN-2004', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Roomm', 'A', 'Hamill', 'mhamillk@squidoo.com', '29-MAR-1987', '5261 Lakeland Drive', 'Hollywood', 'FL', 97113, 177712230, '25-OCT-2005', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Kazio', 'R', 'Ferrand', 'jferrandl@artisteer.com', '30-OCT-1988', '5043 High Crossing Center', 'Stockton', 'CA', 51800, 665769875, '06-JAN-2003', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Tagtune', 'R', 'Denacamp', 'ldenacampm@domainmarket.com', '22-DEC-1986', '58 Tomscot Plaza', 'Wilkes Barre', 'PA', 88268, 929924544, '04-JUL-2005', NULL, NULL);
insert into EMPLOYEES (EmpID, Fname, Minitial, Lname, Email, DOB, Street, City, Emp_State, Zip, SSN, Start_date, End_date, BranchID) values (concat('E', to_char(empid_seq.nextval)), 'Jaxworks', 'A', 'Aird', 'eairdn@so-net.ne.jp', '08-FEB-1986', '04 Troy Place', 'Minneapolis', 'MN', 17217, 210674432, '11-AUG-2001', NULL, NULL);

-- Insert data for CLIENTS
insert into CLIENTS (ClientID, Name, Street, City, StateID, Zip, Discount, Primary_contact_fname, Primary_contact_minitial, Primary_contact_lname, Primary_contact_phone, Primary_contact_email) values (concat('C', to_char(clientid_seq.nextval)), 'Yakijo', '222 Bluejay Park', 'Rochester', 'NY', 87964, 0.03, 'Kassey', 'N', 'Trevers', '5854673661', 'ktrevers0@angelfire.com');
insert into CLIENTS (ClientID, Name, Street, City, StateID, Zip, Discount, Primary_contact_fname, Primary_contact_minitial, Primary_contact_lname, Primary_contact_phone, Primary_contact_email) values (concat('C', to_char(clientid_seq.nextval)), 'Jaxspan', '02 Vernon Terrace', 'Phoenix', 'AZ', 47210, 0.30, 'Delcine', 'V', 'Gorbell', '3211396574', 'dgorbell1@trellian.com');
insert into CLIENTS (ClientID, Name, Street, City, StateID, Zip, Discount, Primary_contact_fname, Primary_contact_minitial, Primary_contact_lname, Primary_contact_phone, Primary_contact_email) values (concat('C', to_char(clientid_seq.nextval)), 'Pixope', '9 Waxwing Park', 'Salt Lake', 'UT', 84709, 0.40, 'Demetre', 'W', 'Tabour', '4194835556', 'dtabour2@alibaba.com');
insert into CLIENTS (ClientID, Name, Street, City, StateID, Zip, Discount, Primary_contact_fname, Primary_contact_minitial, Primary_contact_lname, Primary_contact_phone, Primary_contact_email) values (concat('C', to_char(clientid_seq.nextval)), 'Oyoloo', '671 Novick Avenue', 'Glendale', 'CA', 12152, 0.26, 'Godart', 'N', 'Donnellan', '8031279794', 'gdonnellan3@psu.edu');
insert into CLIENTS (ClientID, Name, Street, City, StateID, Zip, Discount, Primary_contact_fname, Primary_contact_minitial, Primary_contact_lname, Primary_contact_phone, Primary_contact_email) values (concat('C', to_char(clientid_seq.nextval)), 'Gigaclub', '3 5th Drive', 'Phoenix', 'AZ', 52576, 0.11, 'Zandra', 'G', 'Halfacre', '6124664059', 'zhalfacre4@360.cn');
insert into CLIENTS (ClientID, Name, Street, City, StateID, Zip, Discount, Primary_contact_fname, Primary_contact_minitial, Primary_contact_lname, Primary_contact_phone, Primary_contact_email) values (concat('C', to_char(clientid_seq.nextval)), 'Devpoint', '078 Randy Place', 'Tucson', 'AZ', 83015, 0.12, 'Joice', 'G', 'Pinckard', '3165145350', 'jpinckard5@nih.gov');
insert into CLIENTS (ClientID, Name, Street, City, StateID, Zip, Discount, Primary_contact_fname, Primary_contact_minitial, Primary_contact_lname, Primary_contact_phone, Primary_contact_email) values (concat('C', to_char(clientid_seq.nextval)), 'Cogilith', '1405 Blue Bill Park Hill', 'Rochester', 'NY', 35230, 0.45, 'Alena', 'K', 'Maleby', '2156017499', 'amaleby6@mac.com');
insert into CLIENTS (ClientID, Name, Street, City, StateID, Zip, Discount, Primary_contact_fname, Primary_contact_minitial, Primary_contact_lname, Primary_contact_phone, Primary_contact_email) values (concat('C', to_char(clientid_seq.nextval)), 'BlogXS', '63743 Browning Crossing', 'Rochester', 'NY', 73874, 0.50, 'Layne', 'P', 'Knutsen', '5013058017', 'lknutsen7@edublogs.org');
insert into CLIENTS (ClientID, Name, Street, City, StateID, Zip, Discount, Primary_contact_fname, Primary_contact_minitial, Primary_contact_lname, Primary_contact_phone, Primary_contact_email) values (concat('C', to_char(clientid_seq.nextval)), 'Jaxworks', '6038 Evergreen Street', 'Seattle', 'WA', 95308, 0.40, 'Rafaelita', 'N', 'Toynbee', '7857464896', 'rtoynbee8@cafepress.com');
insert into CLIENTS (ClientID, Name, Street, City, StateID, Zip, Discount, Primary_contact_fname, Primary_contact_minitial, Primary_contact_lname, Primary_contact_phone, Primary_contact_email) values (concat('C', to_char(clientid_seq.nextval)), 'Buzzshare', '5042 Elgar Circle', 'Tucson', 'AZ', 17963, 0.05, 'Edvard', 'O', 'Mc Pake', '2171047851', 'emcpake9@exblog.jp');
insert into CLIENTS (ClientID, Name, Street, City, StateID, Zip, Discount, Primary_contact_fname, Primary_contact_minitial, Primary_contact_lname, Primary_contact_phone, Primary_contact_email) values (concat('C', to_char(clientid_seq.nextval)), 'Wikido', '94 Bonner Point', 'Salt Lake', 'UT', 95518, 0.20, 'Siward', 'R', 'Oman', '5026272111', 'somana@nhs.uk');
insert into CLIENTS (ClientID, Name, Street, City, StateID, Zip, Discount, Primary_contact_fname, Primary_contact_minitial, Primary_contact_lname, Primary_contact_phone, Primary_contact_email) values (concat('C', to_char(clientid_seq.nextval)), 'Kamba', '85 Myrtle Way', 'Sacramento', 'CA', 48937, 0.30, 'Jacobo', 'L', 'Drains', '9165902756', 'jdrainsb@elpais.com');

-- Insert data for CLIENT_SITES
insert into CLIENT_SITES (SiteID, ClientID, AreaID, Site_size, Street, City, StateID, Zip) values (concat('CS', to_char(client_siteid_seq.nextval)), 'C0001', 'A001', 6590, '8 Meadow Vale Street', 'Phoenix', 'AZ', 90446);
insert into CLIENT_SITES (SiteID, ClientID, AreaID, Site_size, Street, City, StateID, Zip) values (concat('CS', to_char(client_siteid_seq.nextval)), 'C0002', 'A002', 9968, '15984 Quincy Park', 'Lakewood', 'WA', 37447);
insert into CLIENT_SITES (SiteID, ClientID, AreaID, Site_size, Street, City, StateID, Zip) values (concat('CS', to_char(client_siteid_seq.nextval)), 'C0003', 'A003', 4275, '338 Di Loreto Avenue', 'Buffalo', 'NY', 70641);
insert into CLIENT_SITES (SiteID, ClientID, AreaID, Site_size, Street, City, StateID, Zip) values (concat('CS', to_char(client_siteid_seq.nextval)), 'C0004', 'A004', 4858, '5839 Pond Park', 'Topeka', 'KS', 60662);
insert into CLIENT_SITES (SiteID, ClientID, AreaID, Site_size, Street, City, StateID, Zip) values (concat('CS', to_char(client_siteid_seq.nextval)), 'C0005', 'A005', 5560, '386 Colorado Park', 'Whittier', 'CA', 65807);
insert into CLIENT_SITES (SiteID, ClientID, AreaID, Site_size, Street, City, StateID, Zip) values (concat('CS', to_char(client_siteid_seq.nextval)), 'C0006', 'A006', 8355, '3598 Hooker Pass', 'Salinas', 'CA', 32800);
insert into CLIENT_SITES (SiteID, ClientID, AreaID, Site_size, Street, City, StateID, Zip) values (concat('CS', to_char(client_siteid_seq.nextval)), 'C0006', 'A007', 8300, '660 Vera Point', 'Phoenix', 'AZ', 32829);
insert into CLIENT_SITES (SiteID, ClientID, AreaID, Site_size, Street, City, StateID, Zip) values (concat('CS', to_char(client_siteid_seq.nextval)), 'C0007', 'A008', 6380, '0 Manufacturers Trail', 'San Francisco', 'CA', 13803);
insert into CLIENT_SITES (SiteID, ClientID, AreaID, Site_size, Street, City, StateID, Zip) values (concat('CS', to_char(client_siteid_seq.nextval)), 'C0008', 'A009', 7945, '0991 Vermont Drive', 'Phoenix', 'AZ', 43254);
insert into CLIENT_SITES (SiteID, ClientID, AreaID, Site_size, Street, City, StateID, Zip) values (concat('CS', to_char(client_siteid_seq.nextval)), 'C0009', 'A010', 5705, '903 Quincy Pass', 'Sacramento', 'CA', 23277);

-- Insert data for CUSTOMER_REPS
insert into CUSTOMER_REPS (EmpID, Seniority, Fulltime_or_trainee, Commission_rate, Quarter_bonus, Bonus_amount, BranchID, TeamID) values ('E00000001', 'senior', 'full', 0.72, 2, '1024.02', NULL, 'TM001');
insert into CUSTOMER_REPS (EmpID, Seniority, Fulltime_or_trainee, Commission_rate, Quarter_bonus, Bonus_amount, BranchID, TeamID) values ('E00000002', 'lead', 'full', 0.23, 3, '1272.77', NULL, 'TM002');
insert into CUSTOMER_REPS (EmpID, Seniority, Fulltime_or_trainee, Commission_rate, Quarter_bonus, Bonus_amount, BranchID, TeamID) values ('E00000003', 'senior', 'full', 0.33, 4, '1086.32', NULL, 'TM003');
insert into CUSTOMER_REPS (EmpID, Seniority, Fulltime_or_trainee, Commission_rate, Quarter_bonus, Bonus_amount, BranchID, TeamID) values ('E00000004', 'entry', 'trainee', 0.23, 3, '1355.53', NULL, 'TM004');
insert into CUSTOMER_REPS (EmpID, Seniority, Fulltime_or_trainee, Commission_rate, Quarter_bonus, Bonus_amount, BranchID, TeamID) values ('E00000005', 'middle', 'full', 0.84, 3, '1166.56', NULL, 'TM005');
insert into CUSTOMER_REPS (EmpID, Seniority, Fulltime_or_trainee, Commission_rate, Quarter_bonus, Bonus_amount, BranchID, TeamID) values ('E00000006', 'entry', 'trainee', 0.09, 2, '3180.01', NULL, 'TM006');
insert into CUSTOMER_REPS (EmpID, Seniority, Fulltime_or_trainee, Commission_rate, Quarter_bonus, Bonus_amount, BranchID, TeamID) values ('E00000007', 'middle', 'full', 0.21, 3, '247.99', NULL, 'TM007');
insert into CUSTOMER_REPS (EmpID, Seniority, Fulltime_or_trainee, Commission_rate, Quarter_bonus, Bonus_amount, BranchID, TeamID) values ('E00000008', 'middle', 'full', 0.62, 2, '2834.64', NULL, 'TM008');
insert into CUSTOMER_REPS (EmpID, Seniority, Fulltime_or_trainee, Commission_rate, Quarter_bonus, Bonus_amount, BranchID, TeamID) values ('E00000009', 'lead', 'full', 0.18, 4, '3926.14', NULL, 'TM009');
insert into CUSTOMER_REPS (EmpID, Seniority, Fulltime_or_trainee, Commission_rate, Quarter_bonus, Bonus_amount, BranchID, TeamID) values ('E00000010', 'senior', 'full', 0.21, 1, '2767.25', NULL, 'TM010');
insert into CUSTOMER_REPS (EmpID, Seniority, Fulltime_or_trainee, Commission_rate, Quarter_bonus, Bonus_amount, BranchID, TeamID) values ('E00000011', 'entry', 'trainee', 0.11, 1, '4324.76', NULL, 'TM001');
insert into CUSTOMER_REPS (EmpID, Seniority, Fulltime_or_trainee, Commission_rate, Quarter_bonus, Bonus_amount, BranchID, TeamID) values ('E00000012', 'entry', 'trainee', 0.96, 1, '4041.30', NULL, 'TM003');

-- Insert data for CUSTOMER_REP_TEAMS
insert into CUSTOMER_REP_TEAMS (TeamID, Team_name, Team_leadID, Form_date, Office_area) values (concat('TM', to_char(teamid_seq.nextval)), 'Puffin', 'E00000001', '17-APR-2018', 'A001');
insert into CUSTOMER_REP_TEAMS (TeamID, Team_name, Team_leadID, Form_date, Office_area) values (concat('TM', to_char(teamid_seq.nextval)), 'Whale', 'E00000002', '04-APR-2020', 'A002');
insert into CUSTOMER_REP_TEAMS (TeamID, Team_name, Team_leadID, Form_date, Office_area) values (concat('TM', to_char(teamid_seq.nextval)), 'Booby', 'E00000003', '10-OCT-2018', 'A003');
insert into CUSTOMER_REP_TEAMS (TeamID, Team_name, Team_leadID, Form_date, Office_area) values (concat('TM', to_char(teamid_seq.nextval)), 'Roller', 'E00000004', '14-FEB-2020', 'A004');
insert into CUSTOMER_REP_TEAMS (TeamID, Team_name, Team_leadID, Form_date, Office_area) values (concat('TM', to_char(teamid_seq.nextval)), 'Turtle', 'E00000005', '28-DEC-2020', 'A005');
insert into CUSTOMER_REP_TEAMS (TeamID, Team_name, Team_leadID, Form_date, Office_area) values (concat('TM', to_char(teamid_seq.nextval)), 'Kookaburra', 'E00000006', '29-DEC-2019', 'A006');
insert into CUSTOMER_REP_TEAMS (TeamID, Team_name, Team_leadID, Form_date, Office_area) values (concat('TM', to_char(teamid_seq.nextval)), 'Boa', 'E00000007', '18-APR-2019', 'A007');
insert into CUSTOMER_REP_TEAMS (TeamID, Team_name, Team_leadID, Form_date, Office_area) values (concat('TM', to_char(teamid_seq.nextval)), 'Bushpig', 'E00000008', '26-JAN-2019', 'A008');
insert into CUSTOMER_REP_TEAMS (TeamID, Team_name, Team_leadID, Form_date, Office_area) values (concat('TM', to_char(teamid_seq.nextval)), 'Wallaby', 'E00000009', '12-JUN-2019', 'A009');
insert into CUSTOMER_REP_TEAMS (TeamID, Team_name, Team_leadID, Form_date, Office_area) values (concat('TM', to_char(teamid_seq.nextval)), 'Camel', 'E00000010', '24-JUL-2018', 'A010');

--Insert data for CAN_SERVICE_AREA
insert into CAN_SERVICE_AREA (AreaID, TeamID) values ('A001', 'TM001');
insert into CAN_SERVICE_AREA (AreaID, TeamID) values ('A002', 'TM002');
insert into CAN_SERVICE_AREA (AreaID, TeamID) values ('A003', 'TM003');
insert into CAN_SERVICE_AREA (AreaID, TeamID) values ('A004', 'TM004');
insert into CAN_SERVICE_AREA (AreaID, TeamID) values ('A005', 'TM005');

-- Insert data for CAN_SERVICE_CLIENT
insert into CAN_SERVICE_CLIENT (ClientID, EmpID) values ('C0001', 'E00000001');
insert into CAN_SERVICE_CLIENT (ClientID, EmpID) values ('C0002', 'E00000002');
insert into CAN_SERVICE_CLIENT (ClientID, EmpID) values ('C0003', 'E00000003');
insert into CAN_SERVICE_CLIENT (ClientID, EmpID) values ('C0004', 'E00000004');
insert into CAN_SERVICE_CLIENT (ClientID, EmpID) values ('C0005', 'E00000005');

-- Insert data for INCIDENTS
insert into INCIDENTS (IncidentID, Incident_date, Complaint_date, Resolution_date, Resolution_time, ClientID, Description, OrderID) values (concat('INC', to_char(incidentid_seq.nextval)), '03-JAN-2020', '29-DEC-2019', '06-JAN-2020', '06-JAN-20 07.24.00.000000000 AM', 'C0001', 'Lorem ipsum sit dolor', 'OR00000000001');
insert into INCIDENTS (IncidentID, Incident_date, Complaint_date, Resolution_date, Resolution_time, ClientID, Description, OrderID) values (concat('INC', to_char(incidentid_seq.nextval)), '14-JAN-2020', '10-JAN-2020', '13-JAN-2020', '13-JAN-20 07.24.00.000000000 AM', 'C0002', 'Lorem ipsum sit dolor', 'OR00000000003');
insert into INCIDENTS (IncidentID, Incident_date, Complaint_date, Resolution_date, Resolution_time, ClientID, Description, OrderID) values (concat('INC', to_char(incidentid_seq.nextval)), '08-FEB-2020', '01-FEB-2020', '10-FEB-2020', '10-FEB-20 07.24.00.000000000 AM', 'C0003', 'Lorem ipsum sit dolor', 'OR00000000002');
insert into INCIDENTS (IncidentID, Incident_date, Complaint_date, Resolution_date, Resolution_time, ClientID, Description, OrderID) values (concat('INC', to_char(incidentid_seq.nextval)), '03-MAR-2020', '23-FEB-2020', '08-MAR-2020', '08-MAR-20 07.24.00.000000000 AM', 'C0004', 'Lorem ipsum sit dolor', 'OR00000000003');
insert into INCIDENTS (IncidentID, Incident_date, Complaint_date, Resolution_date, Resolution_time, ClientID, Description, OrderID) values (concat('INC', to_char(incidentid_seq.nextval)), '10-MAR-2020', '01-MAR-2020', '19-MAR-2020', '19-MAR-20 07.24.00.000000000 AM', 'C0005', 'Lorem ipsum sit dolor', 'OR00000000001');
insert into INCIDENTS (IncidentID, Incident_date, Complaint_date, Resolution_date, Resolution_time, ClientID, Description, OrderID) values (concat('INC', to_char(incidentid_seq.nextval)), '12-MAR-2020', '10-MAR-2020', '14-MAR-2020', '14-MAR-20 07.24.00.000000000 AM', 'C0006', 'Lorem ipsum sit dolor', 'OR00000000002');
insert into INCIDENTS (IncidentID, Incident_date, Complaint_date, Resolution_date, Resolution_time, ClientID, Description, OrderID) values (concat('INC', to_char(incidentid_seq.nextval)), '18-MAR-2020', '17-FEB-2020', '19-MAR-2020', '19-MAR-20 07.24.00.000000000 AM', 'C0007', 'Lorem ipsum sit dolor', 'OR00000000003');
insert into INCIDENTS (IncidentID, Incident_date, Complaint_date, Resolution_date, Resolution_time, ClientID, Description, OrderID) values (concat('INC', to_char(incidentid_seq.nextval)), '24-MAR-2020', '25-JAN-2020', '25-MAR-2020', '25-MAR-20 07.24.00.000000000 AM', 'C0005', 'Lorem ipsum sit dolor', 'OR00000000004');
insert into INCIDENTS (IncidentID, Incident_date, Complaint_date, Resolution_date, Resolution_time, ClientID, Description, OrderID) values (concat('INC', to_char(incidentid_seq.nextval)), '03-MAR-2020', '04-JAN-2020', '04-MAR-2020', '04-MAR-20 07.24.00.000000000 AM', 'C0004', 'Lorem ipsum sit dolor', 'OR00000000005');
insert into INCIDENTS (IncidentID, Incident_date, Complaint_date, Resolution_date, Resolution_time, ClientID, Description, OrderID) values (concat('INC', to_char(incidentid_seq.nextval)), '19-MAY-2020', '15-MAR-2018', '20-MAY-2020', '20-MAY-20 07.24.00.000000000 AM', 'C0003', 'Lorem ipsum sit dolor', 'OR00000000006');
insert into INCIDENTS (IncidentID, Incident_date, Complaint_date, Resolution_date, Resolution_time, ClientID, Description, OrderID) values (concat('INC', to_char(incidentid_seq.nextval)), '10-MAY-2019', '09-APR-2018', '11-MAY-2019', '11-MAY-19 07.24.00.000000000 AM', 'C0001', 'Lorem ipsum sit dolor', 'OR00000000007');
insert into INCIDENTS (IncidentID, Incident_date, Complaint_date, Resolution_date, Resolution_time, ClientID, Description, OrderID) values (concat('INC', to_char(incidentid_seq.nextval)), '25-AUG-2019', '04-JUN-2019', '26-AUG-2019', '26-AUG-19 07.24.00.000000000 AM', 'C0002', 'Lorem ipsum sit dolor', 'OR00000000008');
insert into INCIDENTS (IncidentID, Incident_date, Complaint_date, Resolution_date, Resolution_time, ClientID, Description, OrderID) values (concat('INC', to_char(incidentid_seq.nextval)), '14-JAN-2019', '27-DEC-2018', '17-JAN-2019', '17-JAN-19 07.24.00.000000000 AM', 'C0001', 'Lorem ipsum sit dolor', 'OR00000000009');
insert into INCIDENTS (IncidentID, Incident_date, Complaint_date, Resolution_date, Resolution_time, ClientID, Description, OrderID) values (concat('INC', to_char(incidentid_seq.nextval)), '01-AUG-2018', '01-AUG-2018', '02-AUG-2018', '02-AUG-18 07.24.00.000000000 AM', 'C0001', 'Lorem ipsum sit dolor', 'OR00000000010');

-- Insert data for ORDERS
insert into ORDERS (OrderID, Order_date, Order_time, Status, Description, SiteID) values (concat('OR', to_char(orderid_seq.nextval)), '10-FEB-2020', '19:55', 'shipped', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'CS0001');
insert into ORDERS (OrderID, Order_date, Order_time, Status, Description, SiteID) values (concat('OR', to_char(orderid_seq.nextval)), '12-FEB-2020', '7:24', 'pending', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'CS0002');
insert into ORDERS (OrderID, Order_date, Order_time, Status, Description, SiteID) values (concat('OR', to_char(orderid_seq.nextval)), '18-FEB-2020', '6:32', 'delivered', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'CS0003');
insert into ORDERS (OrderID, Order_date, Order_time, Status, Description, SiteID) values (concat('OR', to_char(orderid_seq.nextval)), '24-FEB-2020', '17:24', 'pending', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'CS0004');
insert into ORDERS (OrderID, Order_date, Order_time, Status, Description, SiteID) values (concat('OR', to_char(orderid_seq.nextval)), '03-FEB-2020', '20:00', 'pending', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'CS0005');
insert into ORDERS (OrderID, Order_date, Order_time, Status, Description, SiteID) values (concat('OR', to_char(orderid_seq.nextval)), '19-APR-2020', '8:50', 'pending', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'CS0006');
insert into ORDERS (OrderID, Order_date, Order_time, Status, Description, SiteID) values (concat('OR', to_char(orderid_seq.nextval)), '09-MAY-2019', '17:35', 'pending', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'CS0007');
insert into ORDERS (OrderID, Order_date, Order_time, Status, Description, SiteID) values (concat('OR', to_char(orderid_seq.nextval)), '24-JUL-2019', '9:30', 'pending', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'CS0008');
insert into ORDERS (OrderID, Order_date, Order_time, Status, Description, SiteID) values (concat('OR', to_char(orderid_seq.nextval)), '13-JAN-2019', '8:15', 'pending', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'CS0009');
insert into ORDERS (OrderID, Order_date, Order_time, Status, Description, SiteID) values (concat('OR', to_char(orderid_seq.nextval)), '01-AUG-2018', '11:45', 'pending', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'CS0010');

-- Insert data for ORDER_DETAILS
insert into ORDER_DETAILS (Order_details_ID, OrderID, SiteID, Ship_date, Ship_method) values (concat('ORD', to_char(order_detailsid_seq.nextval)), 'OR00000000001', 'CS0001', '12-FEB-2020', 'overnight');
insert into ORDER_DETAILS (Order_details_ID, OrderID, SiteID, Ship_date, Ship_method) values (concat('ORD', to_char(order_detailsid_seq.nextval)), 'OR00000000002', 'CS0002', '13-FEB-2020', 'overnight');
insert into ORDER_DETAILS (Order_details_ID, OrderID, SiteID, Ship_date, Ship_method) values (concat('ORD', to_char(order_detailsid_seq.nextval)), 'OR00000000003', 'CS0003', '19-FEB-2020', 'ground');
insert into ORDER_DETAILS (Order_details_ID, OrderID, SiteID, Ship_date, Ship_method) values (concat('ORD', to_char(order_detailsid_seq.nextval)), 'OR00000000004', 'CS0004', '24-FEB-2020', 'ground');
insert into ORDER_DETAILS (Order_details_ID, OrderID, SiteID, Ship_date, Ship_method) values (concat('ORD', to_char(order_detailsid_seq.nextval)), 'OR00000000005', 'CS0005', '04-FEB-2020', 'ground');
insert into ORDER_DETAILS (Order_details_ID, OrderID, SiteID, Ship_date, Ship_method) values (concat('ORD', to_char(order_detailsid_seq.nextval)), 'OR00000000006', 'CS0006', '19-FEB-2020', 'overnight');
insert into ORDER_DETAILS (Order_details_ID, OrderID, SiteID, Ship_date, Ship_method) values (concat('ORD', to_char(order_detailsid_seq.nextval)), 'OR00000000007', 'CS0007', '10-MAY-2019', 'ground');
insert into ORDER_DETAILS (Order_details_ID, OrderID, SiteID, Ship_date, Ship_method) values (concat('ORD', to_char(order_detailsid_seq.nextval)), 'OR00000000008', 'CS0008', '24-JUL-2019', 'ground');
insert into ORDER_DETAILS (Order_details_ID, OrderID, SiteID, Ship_date, Ship_method) values (concat('ORD', to_char(order_detailsid_seq.nextval)), 'OR00000000009', 'CS0009', '16-JAN-2019', 'priority');
insert into ORDER_DETAILS (Order_details_ID, OrderID, SiteID, Ship_date, Ship_method) values (concat('ORD', to_char(order_detailsid_seq.nextval)), 'OR00000000010', 'CS0010', '05-AUG-2018', 'ground');

--Insert data for PRODUCTS
insert into PRODUCTS (ProductID, Product_Group_ID, Brand, Line_Number, Product_Avg_cost) values (concat('P',to_char(productid_seq.nextval)), 'GR02', 'Brand1', 10000001 ,20);
insert into PRODUCTS (ProductID, Product_Group_ID, Brand, Line_Number, Product_Avg_cost) values (concat('P',to_char(productid_seq.nextval)), 'GR01', 'Brand2', 10000002 ,5);
insert into PRODUCTS (ProductID, Product_Group_ID, Brand, Line_Number, Product_Avg_cost) values (concat('P',to_char(productid_seq.nextval)), 'GR02', 'Brand3', 10000003 ,2);
insert into PRODUCTS (ProductID, Product_Group_ID, Brand, Line_Number, Product_Avg_cost) values (concat('P',to_char(productid_seq.nextval)), 'GR02', 'Brand4', 10000004 ,20);
insert into PRODUCTS (ProductID, Product_Group_ID, Brand, Line_Number, Product_Avg_cost) values (concat('P',to_char(productid_seq.nextval)), 'GR03', 'Brand1', 10000005 ,10);
insert into PRODUCTS (ProductID, Product_Group_ID, Brand, Line_Number, Product_Avg_cost) values (concat('P',to_char(productid_seq.nextval)), 'GR04', 'Brand2', 10000006 ,10);
insert into PRODUCTS (ProductID, Product_Group_ID, Brand, Line_Number, Product_Avg_cost) values (concat('P',to_char(productid_seq.nextval)), 'GR02', 'Brand3', 10000007 ,5);
insert into PRODUCTS (ProductID, Product_Group_ID, Brand, Line_Number, Product_Avg_cost) values (concat('P',to_char(productid_seq.nextval)), 'GR01', 'Brand4', 10000008 ,10);
insert into PRODUCTS (ProductID, Product_Group_ID, Brand, Line_Number, Product_Avg_cost) values (concat('P',to_char(productid_seq.nextval)), 'GR01', 'Brand1', 10000009 ,20);
insert into PRODUCTS (ProductID, Product_Group_ID, Brand, Line_Number, Product_Avg_cost) values (concat('P',to_char(productid_seq.nextval)), 'GR02', 'Brand2', 10000010 ,10);

--Insert data for PRODUCT_LINES
insert into PRODUCT_LINES (Line_number, Line_name, Line_began, Line_notes, Highest_Profit_Item, Highest_Volume_Item) values (to_char(product_lineid_seq.nextval), Null, Null, Null, Null, Null);
insert into PRODUCT_LINES (Line_number, Line_name, Line_began, Line_notes, Highest_Profit_Item, Highest_Volume_Item) values (to_char(product_lineid_seq.nextval), Null, Null, Null, Null, Null);
insert into PRODUCT_LINES (Line_number, Line_name, Line_began, Line_notes, Highest_Profit_Item, Highest_Volume_Item) values (to_char(product_lineid_seq.nextval), Null, Null, Null, Null, Null);
insert into PRODUCT_LINES (Line_number, Line_name, Line_began, Line_notes, Highest_Profit_Item, Highest_Volume_Item) values (to_char(product_lineid_seq.nextval), Null, Null, Null, Null, Null);
insert into PRODUCT_LINES (Line_number, Line_name, Line_began, Line_notes, Highest_Profit_Item, Highest_Volume_Item) values (to_char(product_lineid_seq.nextval), Null, Null, Null, Null, Null);
insert into PRODUCT_LINES (Line_number, Line_name, Line_began, Line_notes, Highest_Profit_Item, Highest_Volume_Item) values (to_char(product_lineid_seq.nextval), Null, Null, Null, Null, Null);
insert into PRODUCT_LINES (Line_number, Line_name, Line_began, Line_notes, Highest_Profit_Item, Highest_Volume_Item) values (to_char(product_lineid_seq.nextval), Null, Null, Null, Null, Null);
insert into PRODUCT_LINES (Line_number, Line_name, Line_began, Line_notes, Highest_Profit_Item, Highest_Volume_Item) values (to_char(product_lineid_seq.nextval), Null, Null, Null, Null, Null);
insert into PRODUCT_LINES (Line_number, Line_name, Line_began, Line_notes, Highest_Profit_Item, Highest_Volume_Item) values (to_char(product_lineid_seq.nextval), Null, Null, Null, Null, Null);
insert into PRODUCT_LINES (Line_number, Line_name, Line_began, Line_notes, Highest_Profit_Item, Highest_Volume_Item) values (to_char(product_lineid_seq.nextval), Null, Null, Null, Null, Null);

-- Insert data for ITEMS
insert into ITEMS (Order_details_ID, OrderID, ProductID, Discount, Unitprice, Qty) values ('ORD00000000001', 'OR00000000001', 'P00001', 0.34, 64.66, 185);
insert into ITEMS (Order_details_ID, OrderID, ProductID, Discount, Unitprice, Qty) values ('ORD00000000002', 'OR00000000002', 'P00003', 0.00, 110.0, 32);
insert into ITEMS (Order_details_ID, OrderID, ProductID, Discount, Unitprice, Qty) values ('ORD00000000003', 'OR00000000003', 'P00004', 0.00, 29.93, 67);
insert into ITEMS (Order_details_ID, OrderID, ProductID, Discount, Unitprice, Qty) values ('ORD00000000004', 'OR00000000004', 'P00005', 0.00, 379.15, 43);
insert into ITEMS (Order_details_ID, OrderID, ProductID, Discount, Unitprice, Qty) values ('ORD00000000005', 'OR00000000005', 'P00006', 0.45, 333.65, 41);
insert into ITEMS (Order_details_ID, OrderID, ProductID, Discount, Unitprice, Qty) values ('ORD00000000006', 'OR00000000006', 'P00007', 0.26, 167.41, 297);
insert into ITEMS (Order_details_ID, OrderID, ProductID, Discount, Unitprice, Qty) values ('ORD00000000007', 'OR00000000007', 'P00008', 0.06, 88.95, 70);
insert into ITEMS (Order_details_ID, OrderID, ProductID, Discount, Unitprice, Qty) values ('ORD00000000008', 'OR00000000008', 'P00009', 0.00, 253.35, 275);
insert into ITEMS (Order_details_ID, OrderID, ProductID, Discount, Unitprice, Qty) values ('ORD00000000009', 'OR00000000009', 'P00010', 0.21, 418.54, 152);
insert into ITEMS (Order_details_ID, OrderID, ProductID, Discount, Unitprice, Qty) values ('ORD00000000010', 'OR00000000010', 'P00011', 0.60, 186.44, 114);

-- Insert data for STATES
insert into STATES (StateID, Name, Network_rating, Transportation_cost, Demographics) values ('TX', 'Texas', 'high', 61.49, 'lorem ipsum');
insert into STATES (StateID, Name, Network_rating, Transportation_cost, Demographics) values ('FL', 'Florida', 'low', 53.63, 'lorem ipsum');
insert into STATES (StateID, Name, Network_rating, Transportation_cost, Demographics) values ('VA', 'Virginia', 'high', 14.32, 'lorem ipsum');
insert into STATES (StateID, Name, Network_rating, Transportation_cost, Demographics) values ('NY', 'New York', 'low', 26.29, 'lorem ipsum');
insert into STATES (StateID, Name, Network_rating, Transportation_cost, Demographics) values ('AZ', 'Arizona', 'low', 39.21, 'lorem ipsum');
insert into STATES (StateID, Name, Network_rating, Transportation_cost, Demographics) values ('KS', 'Kansas', 'low', 32.54, 'lorem ipsum');
insert into STATES (StateID, Name, Network_rating, Transportation_cost, Demographics) values ('UT', 'Utah', 'medium', 64.94, 'lorem ipsum');
insert into STATES (StateID, Name, Network_rating, Transportation_cost, Demographics) values ('WA', 'Washington', 'high', 20.94, 'lorem ipsum');
insert into STATES (StateID, Name, Network_rating, Transportation_cost, Demographics) values ('CA', 'California', 'medium', 23.40, 'lorem ipsum');
insert into STATES (StateID, Name, Network_rating, Transportation_cost, Demographics) values ('OR', 'Oregon', 'medium', 23.40, 'lorem ipsum');

-- Insert data for PRODUCT_GROUPS
insert into PRODUCT_GROUPS (Product_group_ID, Group_name) values (concat('GR', to_char(product_groupid_seq.nextval)), 'cosmetic');
insert into PRODUCT_GROUPS (Product_group_ID, Group_name) values (concat('GR', to_char(product_groupid_seq.nextval)), 'dental');
insert into PRODUCT_GROUPS (Product_group_ID, Group_name) values (concat('GR', to_char(product_groupid_seq.nextval)), 'dermal');
insert into PRODUCT_GROUPS (Product_group_ID, Group_name) values (concat('GR', to_char(product_groupid_seq.nextval)), 'diabetic');

-- Insert data for CUSTOMER_REP_SPECIALTIES
insert into CUSTOMER_REP_SPECIALTIES (EmpID, Specialty) values ('E00000001', 'GR03');
insert into CUSTOMER_REP_SPECIALTIES (EmpID, Specialty) values ('E00000002', 'GR04');
insert into CUSTOMER_REP_SPECIALTIES (EmpID, Specialty) values ('E00000003', 'GR03');
insert into CUSTOMER_REP_SPECIALTIES (EmpID, Specialty) values ('E00000004', 'GR01');
insert into CUSTOMER_REP_SPECIALTIES (EmpID, Specialty) values ('E00000005', 'GR02');
insert into CUSTOMER_REP_SPECIALTIES (EmpID, Specialty) values ('E00000006', 'GR01');
insert into CUSTOMER_REP_SPECIALTIES (EmpID, Specialty) values ('E00000007', 'GR04');
insert into CUSTOMER_REP_SPECIALTIES (EmpID, Specialty) values ('E00000008', 'GR03');
insert into CUSTOMER_REP_SPECIALTIES (EmpID, Specialty) values ('E00000009', 'GR02');
insert into CUSTOMER_REP_SPECIALTIES (EmpID, Specialty) values ('E00000010', 'GR01');

commit;

select * from  AREAS;
select * from  EMPLOYEES;
select * from  CLIENTS;
select * from  CLIENT_SITES;
select * from  CUSTOMER_REPS;
select * from  CUSTOMER_REP_SPECIALTIES;
select * from  CUSTOMER_REP_TEAMS;
select * from  CAN_SERVICE_AREA;
select * from  CAN_SERVICE_CLIENT;
select * from  INCIDENTS;
select * from  ORDERS;
select * from  ORDER_DETAILS;
select * from  ITEMS;
select * from  STATES;
select * from  PRODUCT_GROUPS;

--------------------Testing--------------------
set serveroutput on;
