spool C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\TERCERO\33\mosql_cap_7_sts.txt
rem Mastering Oracle SQL
rem  [Mishra &  Beaulieu,2002,145]
rem The first
rem query retrieves all the customers in region 5
SELECT CUST_NBR, NAME
FROM CUSTOMER
WHERE REGION_ID = 5;

rem  [Mishra &  Beaulieu,2002,145]

rem The second query retrieves all the customers with the 
rem sales representative is 'MARTIN'.
SELECT C.CUST_NBR, C.NAME
FROM CUSTOMER C
WHERE C.CUST_NBR IN (SELECT O.CUST_NBR
 FROM CUST_ORDER O, EMPLOYEE E
 WHERE O.SALES_EMP_ID = E.EMP_ID
 AND E.LNAME = 'MARTIN');
 
 rem  [Mishra &  Beaulieu,2002,145]
 rem UNION ALL
rem The UNION ALL operator merges the result sets of two component queries
sELECT CUST_NBR, NAME
FROM CUSTOMER
WHERE REGION_ID = 5
UNION ALL
SELECT C.CUST_NBR, C.NAME
FROM CUSTOMER C
WHERE C.CUST_NBR IN (SELECT O.CUST_NBR
 FROM CUST_ORDER O, EMPLOYEE E
 WHERE O.SALES_EMP_ID = E.EMP_ID
 AND E.LNAME = 'MARTIN');
 
 rem The UNION operation eliminates duplicates
  rem  [Mishra &  Beaulieu,2002,146]
  SELECT CUST_NBR, NAME
FROM CUSTOMER
WHERE REGION_ID = 5
UNION
SELECT C.CUST_NBR, C.NAME
FROM CUSTOMER C
WHERE C.CUST_NBR IN (SELECT O.CUST_NBR
 FROM CUST_ORDER O, EMPLOYEE E
 WHERE O.SALES_EMP_ID = E.EMP_ID
 AND E.LNAME = 'MARTIN');
 
 
rem  [Mishra &  Beaulieu,2002,146]
rem INTERSECT returns only the rows retrieved by both component queries
SELECT CUST_NBR, NAME
FROM CUSTOMER
WHERE REGION_ID = 5
INTERSECT
SELECT C.CUST_NBR, C.NAME
FROM CUSTOMER C
WHERE C.CUST_NBR IN (SELECT O.CUST_NBR
 FROM CUST_ORDER O, EMPLOYEE E
 WHERE O.SALES_EMP_ID = E.EMP_ID
 AND E.LNAME = 'MARTIN');
 
 rem  [Mishra &  Beaulieu,2002,148]
 rem INUS returns all rows from the 
 rem first SELECT that are not also returned by the second SELECT
 SELECT CUST_NBR, NAME
FROM CUSTOMER
WHERE REGION_ID = 5
MINUS
SELECT C.CUST_NBR, C.NAME
FROM CUSTOMER C
WHERE C.CUST_NBR IN (SELECT O.CUST_NBR
 FROM CUST_ORDER O, EMPLOYEE E
 WHERE O.SALES_EMP_ID = E.EMP_ID
 AND E.LNAME = 'MARTIN');
 
rem  [Mishra &  Beaulieu,2002,148]
rem  However, the result of
rem MINUS will be different if we alter the order of the component queries
 SELECT C.CUST_NBR, C.NAME
FROM CUSTOMER C
WHERE C.CUST_NBR IN (SELECT O.CUST_NBR
 FROM CUST_ORDER O, EMPLOYEE E
 WHERE O.SALES_EMP_ID = E.EMP_ID
 AND E.LNAME = 'MARTIN')
MINUS
SELECT CUST_NBR, NAME
FROM CUSTOMER
WHERE REGION_ID = 5;

rem  [Mishra &  Beaulieu,2002,153]


 SELECT CUST_NBR "Customer ID", NAME "Customer Name"
FROM CUSTOMER
WHERE REGION_ID = 5
UNION
SELECT C.CUST_NBR, C.NAME
FROM CUSTOMER C
WHERE C.CUST_NBR IN (SELECT O.CUST_NBR
 FROM CUST_ORDER O, EMPLOYEE E
 WHERE O.SALES_EMP_ID = E.EMP_ID
 AND E.LNAME = 'MARTIN');
 
 rem  [Mishra &  Beaulieu,2002,153]
rem  he same thing happens when we create a view based on a
rem set operation. 
rem The column names in the view are taken from the first SELECT:
drop view V_TEST_CUST;
CREATE VIEW V_TEST_CUST AS
SELECT CUST_NBR "Customer ID", NAME "Customer Name"
FROM CUSTOMER
WHERE REGION_ID = 5
UNION
SELECT C.CUST_NBR, C.NAME
FROM CUSTOMER C
WHERE C.CUST_NBR IN (SELECT O.CUST_NBR
 FROM CUST_ORDER O, EMPLOYEE E
 WHERE O.SALES_EMP_ID = E.EMP_ID
 AND E.LNAME = 'MARTIN');
 rem 
 DESC V_TEST_CUST
 rem 
 
 /*
 If we want to use ORDER BY in a query involving set operations, we must place the
ORDER BY at the end of the entire statement. The ORDER BY clause can appear
only once at the end of the compound query. The component queries can’t have
individual ORDER BY clauses. For example:
 */
 
 SELECT CUST_NBR, NAME
FROM CUSTOMER
WHERE REGION_ID = 5
UNION
SELECT EMP_ID, LNAME
FROM EMPLOYEE
WHERE LNAME = 'MARTIN'
ORDER BY CUST_NBR;

 rem  [Mishra &  Beaulieu,2002,155]
rem The ORDER BY clause doesn’t recognize the column names of the second SELECT
SELECT CUST_NBR, NAME
FROM CUSTOMER
WHERE REGION_ID = 5
UNION
SELECT EMP_ID, LNAME
FROM EMPLOYEE
WHERE LNAME = 'MARTIN'
ORDER BY 1;

rem Component queries are executed from top to bottom. If we want to alter the
rem sequence of execution, use parentheses appropriately.
spool off 


 