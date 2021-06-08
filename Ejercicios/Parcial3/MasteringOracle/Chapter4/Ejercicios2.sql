spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial3\MasteringOracle\Chapter4\salida\ejercicioschapter4.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Realizado el 7 de Junio de 2021                   *
rem *Mishra S., Beaulieu A. (2002). 			  *
rem *Chapter 4 Group Operations			  *
rem * SQL (pp. 157-174).Gravenstein Highway North,	  *
rem * Sebastopol, CA 95472. 				  *
rem *****************************************************

rem Establecer formato para las tablas

set colsep '|=|'
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150

alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE= 'ENGLISH';
rem para estos ejercicios necesitamos este tipo de formato


rem HAVING CLAUSE

SELECT CUST_NBR, COUNT(ORDER_NBR)
FROM CUST_ORDER
GROUP BY CUST_NBR
HAVING CUST_NBR < 260;

rem similar a where, funciona como filtro

SELECT CUST_NBR, COUNT(ORDER_NBR)
FROM CUST_ORDER
GROUP BY CUST_NBR
HAVING COUNT(ORDER_NBR) > 2;


SELECT CUST_NBR, COUNT(ORDER_NBR)
FROM CUST_ORDER
GROUP BY CUST_NBR
HAVING ORDER_DT < SYSDATE;


rem tener HAVING Y WHERE JUNTAS
SELECT CUST_NBR, COUNT(ORDER_NBR)
FROM CUST_ORDER
WHERE SALE_PRICE > 25
GROUP BY CUST_NBR
HAVING COUNT(ORDER_NBR) > 1;

spool OFF;
