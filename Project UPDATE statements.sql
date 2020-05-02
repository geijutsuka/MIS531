/* 
=============== UPDATE STATEMENTS ==================
*/


/*========== Update 1 ==============

Updates Product Group to diabetic
Original Insert had incorrect group name
*/ 

UPDATE PRODUCT_GROUPS
SET GROUP_NAME = 'diabetic'
WHERE PRODUCT_GROUP_ID = 'GR04';  
----------------------------------------

/*========== Update 2 ==============

UPDATE FOR EQUIVALENT COMMISSION RATES
BASED ON SENIORITY 
*/ 

UPDATE CUSTOMER_REPS 
SET Commission_Rate = 0.10
WHERE Seniority = 'lead';

UPDATE CUSTOMER_REPS 
SET Commission_Rate = 0.075
WHERE Seniority = 'senior';

UPDATE CUSTOMER_REPS 
SET Commission_Rate = 0.05
WHERE Seniority = 'middle';

UPDATE CUSTOMER_REPS 
SET Commission_Rate = 0.025
WHERE Seniority = 'entry';
------------------------------------

/*========== Update 3 ==============

UPDATE SHIPPING DATES TO GET NULL VALUE
FOR SHIP DATE IF ORDER IS STILL PENDING
*/ 

UPDATE (SELECT 
            OD.Ship_date
            ,O.Status 
        FROM ORDERS O 
        JOIN ORDER_DETAILS OD on OD.OrderID = O.OrderID) ORDERS
SET ORDERS.SHIP_DATE = NULL
WHERE ORDERS.Status = 'pending';
