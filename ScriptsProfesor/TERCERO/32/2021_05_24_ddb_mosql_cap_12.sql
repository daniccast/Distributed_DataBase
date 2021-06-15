﻿spool C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\TERCERO\32\mosql_cap_12.txt
set linesize 130
set pagesize 99
set colsep '|=|'
set null s/Dato


rem [Mishra & Beaulieu,2002,228]
SELECT R.NAME REGION,
 TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
GROUP BY R.NAME, O.MONTH;


rem [Mishra & Beaulieu,2002,230]

SELECT R.NAME REGION,
 TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
GROUP BY R.NAME, O.MONTH
UNION ALL
SELECT R.NAME REGION, NULL, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
GROUP BY R.NAME
UNION ALL
SELECT NULL, NULL, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID;


rem [Mishra & Beaulieu,2002,232]

SELECT R.NAME REGION,
 TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
GROUP BY ROLLUP (R.NAME, O.MONTH);


rem [Mishra & Beaulieu,2002,234]
rem If you want to generate subtotals for each month 
rem instead of for each region, all you
rem need to do is change the order of columns in the ROLLUP operation,
rem 
SELECT R.NAME REGION,
TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
GROUP BY ROLLUP (O.MONTH, R.NAME);
--- ----------------------------------

rem [Mishra & Beaulieu,2002,235]
rem Adding dimensions does not result in additional complexity. 
rem The following query
rem rolls up subtotals for the region, the month, and the year for the first quarter

SELECT O.YEAR, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
R.NAME REGION, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY ROLLUP (O.YEAR, O.MONTH, R.NAME);

rem   [Mishra & Beaulieu,2002,236]
rem As an example of a partial ROLLUP, let’s see what happens
rem  when you take out the
rem first column, which is O.YEAR, from the previous 
rem ROLLUP operation and move it
rem into the GROUP BY clause

SELECT O.YEAR, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
R.NAME REGION, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY O.YEAR ROLLUP (O.MONTH, R.NAME);


rem [Mishra & Beaulieu,2002,237]

SELECT O.YEAR, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
R.NAME REGION, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY O.YEAR, O.MONTH ROLLUP (R.NAME);


rem CUBE
rem The CUBE extension of the GROUP BY clause takes aggregation one step further
rem than ROLLUP.

rem [Mishra & Beaulieu,2002,238]

SELECT R.NAME REGION, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
GROUP BY CUBE(R.NAME, O.MONTH);



rem [Mishra & Beaulieu,2002,239 & 240]
/*
Note that the output contains not only the subtotals for each region, but also the
subtotals for each month. You can get the same result from a query without the
CUBE operation.
*/

SELECT R.NAME REGION, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
GROUP BY R.NAME, O.MONTH
UNION ALL
SELECT R.NAME REGION, NULL, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
GROUP BY R.NAME
UNION ALL
SELECT NULL, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
GROUP BY O.MONTH
UNION ALL
SELECT NULL, NULL, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID;


rem [Mishra & Beaulieu,2002,241]
/*
The following example illustrates this by taking 
the example of the beginning of this section and reversing the
order of columns in the CUBE operation
*/
SELECT R.NAME REGION, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
GROUP BY CUBE(O.MONTH, R.NAME);



rem [Mishra & Beaulieu,2002,243]
rem The GROUPING Function
SELECT NVL(TO_CHAR(O.YEAR), 'All Years') YEAR,
NVL(TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month'), 'First Quarter') MONTH,
NVL(R.NAME, 'All Regions') REGION, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY ROLLUP (O.YEAR, O.MONTH, R.NAME);

rem [Mishra & Beaulieu,2002,245]
SELECT NVL(TO_CHAR(CUST_NBR), 'All Customers') CUSTOMER,
NVL(STATUS, 'All Status') STATUS,
COUNT(*) FROM CUST_ORDER
GROUP BY CUBE(CUST_NBR, STATUS);


rem [Mishra & Beaulieu,2002,246]
SELECT O.YEAR, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
R.NAME REGION, SUM(O.TOT_SALES),
GROUPING(O.YEAR) Y, GROUPING(O.MONTH) M, GROUPING(R.NAME) R
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY ROLLUP (O.YEAR, O.MONTH, R.NAME);

rem [Mishra & Beaulieu,2002,247]
SELECT DECODE(GROUPING(O.YEAR), 1, 'All Years', O.YEAR) Year,
DECODE(GROUPING(O.MONTH), 1, 'All Months',
TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month')) Month,
DECODE(GROUPING(R.NAME), 1, 'All Regions', R.NAME) Region, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY ROLLUP (O.YEAR, O.MONTH, R.NAME);

rem [Mishra & Beaulieu,2002,248]

SELECT DECODE(GROUPING(CUST_NBR), 1, 'All Customers', CUST_NBR) CUSTOMER,
DECODE(GROUPING(STATUS), 1, 'All Status', STATUS) STATUS, COUNT(*)
FROM CUST_ORDER
GROUP BY CUBE(CUST_NBR, STATUS);

rem [Mishra & Beaulieu,2002,249]
sELECT O.YEAR, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
R.NAME REGION, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY GROUPING SETS (O.YEAR, O.MONTH, R.NAME);


rem [Mishra & Beaulieu,2002,250]
SELECT O.YEAR, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
R.NAME REGION, SUM(O.TOT_SALES)
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY GROUPING SETS (O.MONTH, R.NAME, O.YEAR);


rem [Mishra & Beaulieu,2002,251]
SELECT O.YEAR, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
R.NAME REGION, SUM(O.TOT_SALES) TOTAL
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY O.YEAR, ROLLUP (O.YEAR, O.MONTH, R.NAME);

rem [Mishra & Beaulieu,2002,253]
SELECT O.YEAR, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
R.NAME REGION, SUM(O.TOT_SALES) Total
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY ROLLUP ((O.YEAR, O.MONTH),R.NAME);



rem [Mishra & Beaulieu,2002,254]
SELECT O.YEAR, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
R.NAME REGION, SUM(O.TOT_SALES) Total
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY ROLLUP (O.YEAR, O.MONTH), ROLLUP(R.NAME);
/

rem [Mishra & Beaulieu,2002,256]
SELECT O.YEAR, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
R.NAME REGION, SUM(O.TOT_SALES) Total
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY GROUPING SETS (O.YEAR, O.MONTH), GROUPING SETS (R.NAME);
/
rem [Mishra & Beaulieu,2002,258]
SELECT O.YEAR, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
 R.NAME REGION, SUM(O.TOT_SALES) Total
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY GROUPING SETS (ROLLUP (O.YEAR), ROLLUP (O.MONTH), ROLLUP(R.NAME));
/
rem [Mishra & Beaulieu,2002,259]

SELECT DISTINCT O.YEAR, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
R.NAME REGION, SUM(O.TOT_SALES) Total
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY GROUPING SETS (ROLLUP (O.YEAR), ROLLUP (O.MONTH), ROLLUP(R.NAME));
/

rem [Mishra & Beaulieu,2002,261]
SELECT O.YEAR, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
R.NAME REGION, SUM(O.TOT_SALES) Total,
GROUPING(O.YEAR) Y, GROUPING(O.MONTH) M, GROUPING(R.NAME) R,
GROUPING_ID (O.YEAR, O.MONTH, R.NAME) GID
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY CUBE (O.YEAR, O.MONTH, R.NAME);
/

rem [Mishra & Beaulieu,2002,263]
SELECT O.YEAR, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
R.NAME REGION, SUM(O.TOT_SALES) Total
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY CUBE (O.YEAR, O.MONTH, R.NAME)
HAVING GROUPING(O.YEAR) > 0
OR GROUPING(O.MONTH) > 0
OR GROUPING(R.NAME) > 0;
/

rem [Mishra & Beaulieu,2002,265]
SELECT O.YEAR, TO_CHAR(TO_DATE(O.MONTH, 'MM'), 'Month') MONTH,
R.NAME REGION, SUM(O.TOT_SALES) Total, GROUP_ID( )
FROM ORDERS O, REGION R
WHERE R.REGION_ID = O.REGION_ID
AND O.MONTH BETWEEN 1 AND 3
GROUP BY O.YEAR, ROLLUP (O.YEAR, O.MONTH, R.NAME)
HAVING GROUP_ID( ) = 0;


spool off 