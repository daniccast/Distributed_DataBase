spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\MasteringOracle\Chapter8\salida\ejercicios2chapter8.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Realizado el 7 de Junio de 2021                   *
rem *Mishra S., Beaulieu A. (2002). 			  *
rem *Chapter 8 Hierarchical Queries. en Mastering Oracle*
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

SELECT E_TOP.LNAME, E_2.LNAME, E_3.LNAME, E_4.LNAME
FROM EMPLOYEE E_TOP, EMPLOYEE E_2, EMPLOYEE E_3, EMPLOYEE E_4
WHERE E_TOP.MANAGER_EMP_ID IS NULL
AND E_TOP.EMP_ID = E_2.MANAGER_EMP_ID (+)
AND E_2.EMP_ID = E_3.MANAGER_EMP_ID (+)
AND E_3.EMP_ID = E_4.MANAGER_EMP_ID (+);

rem USANDO STAR WITH Y CONNECT

SELECT LNAME, EMP_ID, MANAGER_EMP_ID
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY PRIOR EMP_ID = MANAGER_EMP_ID;


rem usando LEVEL

SELECT LEVEL, LNAME, EMP_ID, MANAGER_EMP_ID
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY MANAGER_EMP_ID = PRIOR EMP_ID;


rem Finding the Number of Levels

SELECT COUNT(DISTINCT LEVEL)
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY PRIOR EMP_ID = MANAGER_EMP_ID;


rem Listing Records in Hierarchical Order

SELECT LEVEL, LPAD(' ',2*(LEVEL - 1)) || LNAME "EMPLOYEE",
EMP_ID, MANAGER_EMP_ID
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY PRIOR EMP_ID = MANAGER_EMP_ID;

SELECT LEVEL, LPAD('
 ',2*(LEVEL - 1)) || LNAME "EMPLOYEE",
EMP_ID, MANAGER_EMP_ID, SALARY
FROM EMPLOYEE
WHERE SALARY > 2000
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY MANAGER_EMP_ID = PRIOR EMP_ID;



rem Checking for Ascendancy

SELECT *
FROM EMPLOYEE
WHERE LNAME = 'BLAKE'
START WITH LNAME = 'JONES'
CONNECT BY MANAGER_EMP_ID = PRIOR EMP_ID;



rem Deleting a Subtree

DELETE FROM EMPLOYEE
WHERE EMP_ID IN
(SELECT EMP_ID FROM EMPLOYEE
START WITH LNAME = 'JONES'
CONNECT BY MANAGER_EMP_ID = PRIOR EMP_ID);


rem Listing the Top Few Levels of a Hierarchy


SELECT EMP_ID, LNAME, DEPT_ID, MANAGER_EMP_ID, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE LEVEL <= 2
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY MANAGER_EMP_ID = PRIOR EMP_ID;

rem Aggregating a Hierarchy


SELECT SUM(SALARY)
FROM EMPLOYEE
START WITH LNAME = 'JONES'
CONNECT BY MANAGER_EMP_ID = PRIOR EMP_ID;

SELECT SUM(SALARY)
FROM EMPLOYEE
START WITH LNAME = 'Clark'
CONNECT BY MANAGER_EMP_ID = PRIOR EMP_ID;



spool OFF;
