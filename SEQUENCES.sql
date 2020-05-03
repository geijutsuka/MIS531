drop sequence areaid_seq;
drop sequence empid_seq;
drop sequence clientid_seq;
drop sequence client_siteid_seq;
drop sequence teamid_seq;
drop sequence incidentid_seq;
drop sequence order_detailsid_seq;
drop sequence orderid_seq;
drop sequence productid_seq;
drop sequence product_groupid_seq;
drop sequence product_lineid_seq;

drop trigger TrigAreaIDSeq;
drop trigger TrigEmpIDSeq;
drop trigger TrigClientIDSeq;
drop trigger TrigClientSiteIDSeq;
drop trigger TrigTeamIDSeq;
drop trigger TrigIncidentIDSeq;
drop trigger TrigOrderDetailsIDSeq;
drop trigger TrigOrderIDSeq;
drop trigger TrigProductIDSeq;
drop trigger TrigProductGroupSeq;
drop trigger TrigProductLineSeq;


CREATE SEQUENCE areaid_seq INCREMENT BY 1 START WITH 001 MAXVALUE 999;
CREATE SEQUENCE empid_seq INCREMENT BY 1 START WITH 00000001 MAXVALUE 99999999;
CREATE SEQUENCE clientid_seq INCREMENT BY 1 START WITH 0001 MAXVALUE 9999;
CREATE SEQUENCE client_siteid_seq INCREMENT BY 1 START WITH 0001 MAXVALUE 9999;
CREATE SEQUENCE teamid_seq INCREMENT BY 1 START WITH 001 MAXVALUE 999;
CREATE SEQUENCE incidentid_seq INCREMENT BY 1 START WITH 000000001 MAXVALUE 999999999;
CREATE SEQUENCE orderid_seq INCREMENT BY 1 START WITH 00000000001 MAXVALUE 99999999999;
CREATE SEQUENCE order_detailsid_seq INCREMENT BY 1 START WITH 00000000001 MAXVALUE 99999999999;
CREATE SEQUENCE productid_seq INCREMENT BY 1 START WITH 00001 MAXVALUE 99999;
CREATE SEQUENCE product_groupid_seq INCREMENT BY 1 START WITH 01 MAXVALUE 99;
CREATE SEQUENCE product_lineid_seq INCREMENT BY 1 START WITH 10000000 MAXVALUE 99999999;


CREATE OR REPLACE TRIGGER TrigAreaIDSeq
BEFORE INSERT
ON AREAS
FOR EACH ROW

DECLARE
    temp_areaID AREAS.areaID%type;

BEGIN
    SELECT LPAD(to_char(areaid_seq.currval), 4, 'A000') INTO temp_areaID FROM dual;
    :new.areaID := temp_areaID;

END;
/

CREATE OR REPLACE TRIGGER TrigEmpIDSeq
BEFORE INSERT
ON EMPLOYEES
FOR EACH ROW

DECLARE
    temp_empID EMPLOYEES.empID%type;
BEGIN
    SELECT LPAD(to_char(empid_seq.currval), 9, 'E00000000') INTO temp_empID FROM dual;
    :new.empID := temp_empID;
END;
/

CREATE OR REPLACE TRIGGER TrigClientIDSeq
BEFORE INSERT
ON CLIENTS
FOR EACH ROW

DECLARE
    temp_clientID CLIENTS.clientID%type;
BEGIN
    SELECT LPAD(to_char(clientid_seq.currval), 5, 'C0000') INTO temp_clientID FROM dual;
    :new.clientID := temp_clientID;
END;
/

CREATE OR REPLACE TRIGGER TrigClientSiteIDSeq
BEFORE INSERT
ON CLIENT_SITES
FOR EACH ROW

DECLARE
    temp_siteID CLIENT_SITES.siteID%type;
BEGIN
    SELECT LPAD(to_char(client_siteid_seq.currval), 6, 'CS0000') INTO temp_siteID FROM dual;
    :new.siteID := temp_siteID;
END;
/

CREATE OR REPLACE TRIGGER TrigTeamIDSeq
BEFORE INSERT
ON CUSTOMER_REP_TEAMS
FOR EACH ROW

DECLARE
    temp_teamID CUSTOMER_REP_TEAMS.teamID%type;
BEGIN
    SELECT LPAD(to_char(teamid_seq.currval), 5, 'TM000') INTO temp_teamID FROM dual;
    :new.teamID := temp_teamID;
END;
/


CREATE OR REPLACE TRIGGER TrigIncidentIDSeq
BEFORE INSERT
ON INCIDENTS
FOR EACH ROW

DECLARE
    temp_incidentID INCIDENTS.incidentID%type;
BEGIN
    SELECT LPAD(to_char(incidentid_seq.currval), 12, 'INC000000000') INTO temp_incidentID FROM dual;
    :new.incidentID := temp_incidentID;
END;
/


CREATE OR REPLACE TRIGGER TrigOrderIDSeq
BEFORE INSERT
ON ORDERS
FOR EACH ROW

DECLARE
    temp_orderID ORDERS.orderID%type;
BEGIN
    SELECT LPAD(to_char(orderid_seq.currval), 13, 'OR00000000000') INTO temp_orderID FROM dual;
    :new.orderID := temp_orderID;
END;
/


CREATE OR REPLACE TRIGGER TrigOrderDetailsIDSeq
BEFORE INSERT
ON ORDER_DETAILS
FOR EACH ROW

DECLARE
    temp_orderDetailsID ORDER_DETAILS.order_details_ID%type;
BEGIN
    SELECT LPAD(to_char(order_detailsid_seq.currval), 14, 'ORD00000000000') INTO temp_orderDetailsID FROM dual;
    :new.order_details_ID := temp_orderDetailsID;
END;
/


CREATE OR REPLACE TRIGGER TrigProductIDSeq
BEFORE INSERT
ON PRODUCTS
FOR EACH ROW

DECLARE
    temp_productID PRODUCTS.productID%type;
BEGIN
    SELECT LPAD(to_char(productid_seq.currval), 6, 'P00000') INTO temp_productID FROM dual;
    :new.productID := temp_productID;
END;
/

CREATE OR REPLACE TRIGGER TrigProductGroupSeq
BEFORE INSERT
ON PRODUCT_GROUPS
FOR EACH ROW

DECLARE
    temp_productGroupID PRODUCT_GROUPS.product_group_ID%type;
BEGIN
    SELECT LPAD(to_char(product_groupid_seq.currval), 4, 'GR00') INTO temp_productGroupID FROM dual;
    :new.product_group_ID := temp_productGroupID;
END;
/

CREATE OR REPLACE TRIGGER TrigProductLineSeq
BEFORE INSERT
ON PRODUCT_LINES
FOR EACH ROW

DECLARE
    temp_productLineID PRODUCT_LINES.line_number%type;
BEGIN
    SELECT LPAD(to_char(product_lineid_seq.currval), 8, '10000000') INTO temp_productLineID FROM dual;
    :new.line_number := temp_productLineID;
END;
/