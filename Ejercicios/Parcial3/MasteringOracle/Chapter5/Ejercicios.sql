spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\MasteringOracle\Chapter5\salida\ejercicioschapter5.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Realizado el 7 de Junio de 2021                   *
rem *Mishra S., Beaulieu A. (2002). 			  *
rem *Chapter 5. Subqueries				  *
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


rem the following query, which identifies the salesperson responsible for
rem the most orders (Mishra y Beaulieu, 2002, 70)


update employee set salary=5001 where emp_id= 7934; 

SELECT sales_emp_id, COUNT(*)
FROM cust_order
GROUP BY sales_emp_id
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
FROM cust_order
GROUP BY sales_emp_id);


rem Ejemplo miltiple-row subqueries
SELECT fname, lname
FROM employee
WHERE dept_id = 30 AND salary >= ALL
	(SELECT salary
	FROM employee
	WHERE dept_id = 30);

SELECT fname, lname
FROM employee
WHERE dept_id = 30 AND NOT salary < ANY
	(SELECT salary
	FROM employee
	WHERE dept_id = 30);

rem también se puede utilizar con ANY


rem  encontrar todos los empleados cuyo salario exceda el de cualquier gerente de alto nivel
SELECT fname, lname
FROM employee
WHERE manager_emp_id IS NOT NULL
AND salary > ANY
	(SELECT salary
	FROM employee
	WHERE manager_emp_id IS NULL);


spool OFF;
