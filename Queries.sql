/*
========== QUERY #1 INCIDENT REPORTS =====================

For each Client Site, the total number of incidents 
report in the current month and the previous month

NOTE: This query needs incidents entered for current month (May)
and last Month (April). Currently no incidents in April/May

Additionally, the following two sites need a Client Name - 
            CS6195
            CS7777
*/

WITH 
    CurrentMonth AS (   --Need incidents for this month (May)
        SELECT 
            CS.SiteID 
            ,COUNT(I.IncidentID) as CurrentM
        FROM CLIENT_SITES CS
        LEFT JOIN ORDERS O on O.SiteID = CS.SiteID --NEED DATA FOR THIS TABLE
        LEFT JOIN INCIDENTS I on I.OrderID = O.OrderID
        WHERE TO_CHAR(I.INCIDENT_DATE, 'YYYYMM') = (SELECT TO_CHAR(SYSDATE, 'YYYYMM')  FROM DUAL)           
        GROUP BY CS.SiteID
        )
    ,PreviousMonth AS (   --Need more incidents for last month (April)
         SELECT 
             CS.SiteID 
            ,COUNT(I.IncidentID) as LastM
        FROM CLIENT_SITES CS
        LEFT JOIN ORDERS O on O.SiteID = CS.SiteID --NEED DATA FOR THIS TABLE
        LEFT JOIN INCIDENTS I on I.OrderID = O.OrderID
        WHERE TO_CHAR(I.INCIDENT_DATE, 'YYYYMM') = (SELECT TO_CHAR(ADD_MONTHS(SYSDATE, -1), 'YYYYMM')  FROM DUAL)           
        GROUP BY CS.SiteID, I.Incident_Date
        )
SELECT 
    CS.SiteID
    ,C.Name as "Client Name"
    ,NVL(CM.CurrentM, 0) as "Incidents This Month"
    ,NVL(PM.LastM, 0) as "Incidents Last Month"
FROM CLIENT_SITES CS
LEFT JOIN CLIENTS C on C.ClientID = CS.ClientID
LEFT JOIN CURRENTMONTH CM on CM.SiteID = CS.SiteID
LEFT JOIN PREVIOUSMONTH PM on PM.SiteID = CS.SiteID
ORDER BY C.Name, CM.CurrentM;
---------------------------------------------------------------------------

/*
========== QUERY #2 SALES PERFORMANCE ===================

For the current year, the total sales are calculated for each 
Customer Rep.Sales are display by the month, and then totals for 
each quarter.  Total Sales YTD are reflected in the last column.

*/

WITH TS AS (
            SELECT DISTINCT 
                 CR.EmpID
                ,SUM(I.QTY * I.UnitPrice) as TotalSales
            FROM CUSTOMER_REPS CR
            JOIN EMPLOYEES E on E.EmpID = CR.EmpID
             JOIN CAN_SERVICE_CLIENT CSC on CSC.EmpID = E.EmpID
             JOIN CLIENTS C on C.ClientId = CSC.ClientID
             JOIN CLIENT_SITES CS on CS.ClientID =  C.ClientID
             JOIN ORDERS O on O.SiteID = CS.SiteID
             JOIN ORDER_DETAILS OD On OD.ORDERID = O.OrderID
             JOIN ITEMS I on I.OrderID = OD.ORderID
            GROUP BY CR.EmpID
            )
SELECT DISTINCT
    CR.EmpID 
    ,E.LName AS LastName
    ,E.FName AS FirstName
    ,EXTRACT(YEAR FROM O.Order_date) as YEAR 
    ,(CASE WHEN TO_CHAR(O.Order_Date, 'MM') = '01' THEN (SUM(TS.TotalSales)) ELSE 0 END) AS JAN
    ,(CASE WHEN TO_CHAR(O.Order_Date, 'MM') = '02' THEN (SUM(TS.TotalSales)) ELSE 0 END) AS FEB    
    ,(CASE WHEN TO_CHAR(O.Order_Date, 'MM') = '03' THEN (SUM(TS.TotalSales)) ELSE 0 END) AS MAR
    ,(CASE
        WHEN TO_CHAR(O.Order_Date, 'MM') IN ('01', '02', '03')
        THEN SUM(TS.TotalSales)
        ELSE 0
      END) AS Q1
    ,(CASE WHEN TO_CHAR(O.Order_Date, 'MM') = '04' THEN (SUM(TS.TotalSales)) ELSE 0 END) AS APR
    ,(CASE WHEN TO_CHAR(O.Order_Date, 'MM') = '05' THEN (SUM(TS.TotalSales)) ELSE 0 END) AS MAY    
    ,(CASE WHEN TO_CHAR(O.Order_Date, 'MM') = '06' THEN (SUM(TS.TotalSales)) ELSE 0 END) AS JUN 
    ,(CASE
        WHEN TO_CHAR(O.Order_Date, 'MM') IN ('04', '05', '06')
        THEN SUM(TS.TotalSales)
        ELSE 0
      END) AS Q2      
    ,(CASE WHEN TO_CHAR(O.Order_Date, 'MM') = '07' THEN (SUM(TS.TotalSales)) ELSE 0 END) AS JUL    
    ,(CASE WHEN TO_CHAR(O.Order_Date, 'MM') = '08' THEN (SUM(TS.TotalSales)) ELSE 0 END) AS AUG    
    ,(CASE WHEN TO_CHAR(O.Order_Date, 'MM') = '09' THEN (SUM(TS.TotalSales)) ELSE 0 END) AS SEPT   
    ,(CASE
        WHEN TO_CHAR(O.Order_Date, 'MM') IN ('07', '08', '09')
        THEN SUM(TS.TotalSales)
        ELSE 0
      END) AS Q3     
    ,(CASE WHEN TO_CHAR(O.Order_Date, 'MM') = '10' THEN (SUM(TS.TotalSales)) ELSE 0 END) AS OCT    
    ,(CASE WHEN TO_CHAR(O.Order_Date, 'MM') = '11' THEN (SUM(TS.TotalSales)) ELSE 0 END) AS NOV    
    ,(CASE WHEN TO_CHAR(O.Order_Date, 'MM') = '12' THEN (SUM(TS.TotalSales)) ELSE 0 END) AS DEC 
    ,(CASE
        WHEN TO_CHAR(O.Order_Date, 'MM') IN ('10', '11', '12')
        THEN SUM(TS.TotalSales)
        ELSE 0
      END) AS Q4
    ,SUM(TS.TotalSales) as "Total Sales YTD"
FROM CUSTOMER_REPS CR
JOIN EMPLOYEES E on E.EmpID = CR.EmpID
JOIN CAN_SERVICE_CLIENT CSC on CSC.EmpID = E.EmpID
JOIN CLIENTS C on C.ClientId = CSC.ClientID
JOIN CLIENT_SITES CS on CS.ClientID =  C.ClientID
JOIN ORDERS O on O.SiteID = CS.SiteID
JOIN ORDER_DETAILS OD On OD.ORDERID = O.OrderID
JOIN ITEMS I on I.OrderID = OD.ORderID
JOIN TS on TS.Empid = CR.EmpiD
WHERE EXTRACT(YEAR FROM O.Order_date) = (SELECT TO_CHAR(sysdate, 'YYYY') FROM DUAL)
GROUP BY CR.EmpID, E.LName, E.FName, TS.TotalSales, O.Order_Date
ORDER BY E.LName;
---------------------------------------------------------------

/*
=========== QUERY #3 CLIENT ORDERS ======================


For clients who have placed an order, the
total number of orders YTD is listed for each client, 
along with the total Order Cost YTD and the average
number of days between orders for each client. Query is sorted
by Client Name

*/

WITH DaysBetween as (
        SELECT
            CS.ClientID
           ,ROUND(Sysdate - Order_date) as DaysBetw
        FROM CLIENTS C 
        JOIN CLIENT_SITES CS on CS.ClientID =  C.ClientID
        JOIN ORDERS O on O.SiteID = CS.SiteID
        JOIN ORDER_DETAILS OD On OD.ORDERID = O.OrderID
        JOIN ITEMS I on I.OrderID = OD.ORderID
        WHERE EXTRACT(YEAR FROM O.Order_date) = (SELECT TO_CHAR(sysdate, 'YYYY') FROM DUAL)
        GROUP BY CS.ClientID, order_date
        )
SELECT
    CS.ClientID
    ,C.Name as "Client Name"
    ,COUNT(DISTINCT(O.OrderID)) as "Number of Orders YTD"
   ,TO_CHAR(SUM(I.Qty * I.UnitPrice), '$99,999,999') "Order Cost YTD"
   ,AVG(DB.DaysBetw) as "Avg Days Between Orders"
FROM CLIENTS C 
JOIN CLIENT_SITES CS on CS.ClientID =  C.ClientID
JOIN ORDERS O on O.SiteID = CS.SiteID
JOIN ORDER_DETAILS OD On OD.ORDERID = O.OrderID
JOIN ITEMS I on I.OrderID = OD.ORderID
JOIN DAYSBETWEEN DB on DB.ClientID = C.ClientID
WHERE EXTRACT(YEAR FROM O.Order_date) = (SELECT TO_CHAR(sysdate, 'YYYY') FROM DUAL)
GROUP BY CS.ClientID, C.Name
Order by C.Name;
------------------------------------------------------------------------------------------

----Query 6 Commission and Seniority 

/*
=========== QUERY #4 COMISSION AND SENIORITY ======================

Returns each Customer Rep with Sales in the
current year. For each Rep, the Seniority is shown as well
as total sales YTD and total commission earned YTD

*/

SELECT DISTINCT 
    CR.EmpID 
    ,E.LName AS "Last Name"
    ,E.FName AS "First Name"
    ,CR.Seniority as "Seniority"
    ,((CR.Commission_Rate*100)||'%') as "Commission %"
    ,TO_CHAR(SUM(I.QTY * I.UnitPrice), '$99,999,999') as "Total Sales"
    ,TO_CHAR((CR.Commission_Rate * SUM(I.QTY * I.UnitPrice)), '$99,999,999') "Commission YTD"
FROM CUSTOMER_REPS CR
LEFT JOIN EMPLOYEES E on E.EmpID = CR.EmpID
LEFT JOIN CAN_SERVICE_CLIENT CSC on CSC.EmpID = E.EmpID
LEFT JOIN CLIENTS C on C.ClientId = CSC.ClientID
LEFT JOIN CLIENT_SITES CS on CS.ClientID =  C.ClientID
LEFT JOIN ORDERS O on O.SiteID = CS.SiteID
LEFT JOIN ORDER_DETAILS OD On OD.ORDERID = O.OrderID
LEFT JOIN ITEMS I on I.OrderID = OD.ORderID
WHERE EXTRACT(YEAR FROM O.Order_date) = (SELECT TO_CHAR(sysdate, 'YYYY') FROM DUAL)
GROUP BY CR.EmpID, E.LName, E.FName, CR.Seniority, Commission_Rate
ORDER BY E.LName;
------------------------------------------------------------------------------


--Query 7 Best Selling Product

/*
=========== QUERY #5 BEST SELLING PRODUCTS ======================
Displays each product ranked by total quantity 
sold in the current year. Product Revenue for the
year to date is shown as well

*/

SELECT Distinct
    I.ProductID
    ,SUM(I.Qty) as "Units Sold"
    ,TO_CHAR(SUM(I.QTY * I.UnitPrice), '$99,999,999') as "Product Revenue YTD"
FROM ITEMS I
JOIN ORDER_DETAILS OD on OD.OrderID = I.OrderID
JOIN ORDERS O on O.OrderID = OD.OrderID
WHERE EXTRACT(YEAR FROM O.Order_date) = (SELECT TO_CHAR(sysdate, 'YYYY') FROM DUAL)
GROUP BY I.ProductID
ORDER BY SUM(I.QTY) DESC;
-----------------------------------------------------------------

--Query 9 Client Summary
/*

=========== QUERY #6 CLIENT SUMMARY ======================

Shows summary information for each Client.

Client Name, State of residence, Discount Percentage,
Primary Contact Info, total sites for each client, 
as well as total amount of number of employees employed 
by the client. If the client has an assigned Customer Rep, 
the Representatives name is shown, along  with their seniority 
level.

*/

SELECT DISTINCT
    C.ClientID
    ,C.Name as "Client Name"
    ,C.StateID as "State"
    ,((C.Discount*100)||'%') as "Discount %"
    ,(C.Primary_Contact_FName || ' ' || C.Primary_Contact_LName) as "Primary Contact"
    ,C.Primary_Contact_Phone as "Contact Number"
    ,COUNT(CS.SiteID) as "Total Sites"
    ,NVL(SUM(CS.Site_Size), '0') as "Company Size"
    ,COALESCE(CR.EmpID, ' ') as "Rep ID"
    ,COALESCE((E.Fname || ' ' || E.LName), ' ') as "Customer Rep"
    ,COALESCE(CR.Seniority,' ') as "Rep Seniority"
FROM CLIENTS C
LEFT JOIN CAN_SERVICE_CLIENT CSC on CSC.ClientID = C.ClientID
LEFT JOIN CLIENT_SITES CS on CS.ClientID = CSC.ClientID
LEFT JOIN CUSTOMER_REPS CR on CR.EmpID = CSC.Empid
LEFT JOIN EMPLOYEES E on E.EmpID = CR.EmpID
GROUP BY C.ClientID, C.Name, C.StateID, C.Discount, C.Primary_Contact_FName, C.Primary_Contact_LName, C.Primary_Contact_Phone, CR.EmpID, E.FName, E.LName, CR.Seniority
ORDER BY C.Name;
--------------------------------------------------------------------------

--Query 10

/*
================= QUERY #7 ORDERS & INCIDENTS ======================


Display total orders  along with the Order Date and Ship Date.  
The time elapsed betweeen Order Date and Ship Date is calculated to show how much time
has elpased between the order being placed and the order being shipped.
This query is sorted on orders that take the most time to ship. 
The shipping method is also shown fore ach order.  If any incidents have occured with 
the order, the Incident is listed, along with the complaint date. The last column
represents whether the Complaint was filed before the product was shipped.
As seen in the results - if most complaints were filed before shipping, 
that gives the company an opportunity to look into the incident and perhaps
alter the shipment to better serve the client. 

*/

SELECT
     O.OrderID
    ,O.Order_Date
    ,OD.Ship_Date
    ,(OD.Ship_Date - O.Order_Date) as "Elapsed Days Before Shipping"
    ,OD.Ship_Method
    ,I.IncidentID
    ,I.Complaint_Date
   ,(CASE WHEN (I.Complaint_Date > OD.Ship_Date) THEN 'AFTER SHIPPING' 
        ELSE 'BEFORE SHIPPING' END) as "Complaint Date Occured:"
FROM ORDERS O
LEFT JOIN ORDER_DETAILS OD on OD.OrderID = O.OrderID
LEFT JOIN INCIDENTS I on I.OrderID = O.OrderID
ORDER BY (OD.Ship_Date - O.Order_Date) DESC;
----------------------------------------------------------------

/*
================= QUERY #8 PENDING ORDERS ======================

Query displays all pending orderes, sorted by the number of 
days since the order has taken place. This query can highlight
lost orders and/or display orders in which shipping procedures 
and order fullfillment may have to be streamlined.

The number assigned Customer Rep and their Seniority Level is
also shown

*/

SELECT
    O.OrderID
    ,OD.SiteID
    ,O.Status
    ,ROUND(SysDate - O.Order_Date) as "Days Since Order"
    ,COALESCE((E.Fname || ' ' || E.LName), ' ') as "Customer Rep"
    ,COALESCE(CR.Seniority,' ') as "Rep Seniority"
FROM ORDERS O
LEFT JOIN ORDER_DETAILS OD on OD.OrderID = O.OrderID
LEFT JOIN CLIENT_SITES CS on CS.SiteID = O.SiteID
LEFT JOIN CAN_SERVICE_CLIENT CSC on CSC.ClientID = CS.ClientID
LEFT JOIN CUSTOMER_REPS CR on CR.EmpID = CSC.Empid
LEFT JOIN EMPLOYEES E on E.EmpID = CR.EmpID
WHERE O.Status = 'pending'
ORDER BY (SysDate - O.Order_Date) DESC;
-----------------------------------------------------------------

/*
================= QUERY #9 SPECIALTY GROUPS ======================

Displays all the Customer Reps and their product Specialties. 
Customer Reps are sorted based on total number of specialties

*/

WITH COSMETIC AS (
        SELECT DISTINCT 
            CR.EmpID
           ,PG.GROUP_NAME            
        FROM CUSTOMER_REPS CR
        JOIN CUSTOMER_REP_SPECIALTIES CPS on CPS.EmpID = CR.EmpID
        JOIN PRODUCT_GROUPS PG on PG.Product_Group_ID = CPS.Specialty 
        WHERE CPS.SPECIALTY = 'GR01'  --Cosmetic 
        )
     
     ,DENTAL AS (
        SELECT DISTINCT 
            CR.EmpID
           ,PG.GROUP_NAME              
        FROM CUSTOMER_REPS CR
        JOIN CUSTOMER_REP_SPECIALTIES CPS on CPS.EmpID = CR.EmpID
        JOIN PRODUCT_GROUPS PG on PG.Product_Group_ID = CPS.Specialty 
        WHERE CPS.SPECIALTY = 'GR02'  --DENTAL 
        )
     
     ,DERMAL AS (
        SELECT DISTINCT 
            CR.EmpID
            ,PG.GROUP_NAME
        FROM CUSTOMER_REPS CR
        JOIN CUSTOMER_REP_SPECIALTIES CPS on CPS.EmpID = CR.EmpID
        JOIN PRODUCT_GROUPS PG on PG.Product_Group_ID = CPS.Specialty 
        WHERE CPS.SPECIALTY = 'GR03'  --DERMAL   
        )
     ,DIABETIC AS (
        SELECT DISTINCT 
            CR.EmpID
           ,PG.GROUP_NAME              
        FROM CUSTOMER_REPS CR
        JOIN CUSTOMER_REP_SPECIALTIES CPS on CPS.EmpID = CR.EmpID
        JOIN PRODUCT_GROUPS PG on PG.Product_Group_ID = CPS.Specialty 
        WHERE CPS.SPECIALTY = 'GR04'  --DIABETIC      
        )

SELECT DISTINCT
    CR.EmpID
    ,E.LName
    ,E.FName
    ,COUNT(DISTINCT(CPS.Specialty)) as NumSpecialties
    ,NVL(COS.Group_Name, ' ') as Specialty1
    ,NVL(DEN.Group_Name, ' ') as Specialty2
    ,NVL(DERM.Group_Name, ' ') as Specialty3
    ,NVL(DIA.Group_Name, ' ') as Specialty4

FROM CUSTOMER_REPS CR
LEFT JOIN EMPLOYEES E on E.EmpID = CR.EmpID
LEFT JOIN CUSTOMER_REP_SPECIALTIES CPS on CPS.EmpID = CR.EmpID
LEFT JOIN PRODUCT_GROUPS PG on PG.Product_Group_ID = CPS.Specialty
LEFT JOIN COSMETIC COS on COS.EmpID = CR.Empid
LEFT JOIN DENTAL DEN on DEN.EmpID = CR.Empid
LEFT JOIN DERMAL DERM on DERM.EmpID = CR.Empid
LEFT JOIN DIABETIC DIA on DIA.EMPID = CR.Empid
GROUP BY CR.EmpID, E.LName, E.FName, COS.Group_Name, DEN.Group_Name, DERM.Group_Name, DIA.Group_Name
ORDER BY COUNT(DISTINCT(CPS.Specialty)) DESC, E.LName;
