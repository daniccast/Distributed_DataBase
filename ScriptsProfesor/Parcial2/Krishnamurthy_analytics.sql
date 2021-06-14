rem querys de hr /hr 
rem table employees
rem 
SET PAGESIZE 99
SET LINESIZE 130
SET COLSEP '|=|'
SET NULL S/Data

rem manual Oracle Database SQL Language Reference, 21c

rem  Krishnamurthy,U (2021). Oracle Database SQL Language Reference, 21c, USA, Oracle Corp.


rem  autor principal Usha Krishnamurthy


/*

rem [ Krishnamurthy  , 2021,p 7-145 ]
				Aggregate Example
The following example returns, within each department of the sample table
hr.employees, the minimum salary among the employees who make the lowest
commission and the maximum salary among the employees who make the highest
commission:
*/

SELECT department_id,
 MIN(salary) KEEP (DENSE_RANK FIRST ORDER BY commission_pct) "Worst",
 MAX(salary) KEEP (DENSE_RANK LAST ORDER BY commission_pct) "Best"
 FROM employees
 GROUP BY department_id
 ORDER BY department_id;
 
-- ----------------------------------

/*
Analytic Example
The next example makes the same calculation as the previous example but returns
the result for each employee within the department:


*/


SELECT last_name, department_id, salary,
 MIN(salary) KEEP (DENSE_RANK FIRST ORDER BY commission_pct)
 OVER (PARTITION BY department_id) "Worst",
 MAX(salary) KEEP (DENSE_RANK LAST ORDER BY commission_pct)
 OVER (PARTITION BY department_id) "Best"
 FROM employees
 ORDER BY department_id, salary, last_name; 
 
 -- ------------------------------------------
/* 
 The following example selects, for each employee in Department 90, the name of the
employee with the lowest salary.

UNBOUNDED PRECEDING : The window starts at the first row of the partition, 
or the whole result set if no partitioning clause is used.
 Only available for start points.
UNBOUNDED FOLLOWING
*/

SELECT employee_id, last_name, salary, hire_date,
 FIRST_VALUE(last_name)
 OVER (ORDER BY salary ASC ROWS UNBOUNDED PRECEDING) AS fv
 FROM (SELECT * FROM employees
 WHERE department_id = 90
 ORDER BY hire_date);
 
 -- ---------------------------------------
SELECT employee_id, last_name, salary, hire_date,
last_VALUE(last_name)
 OVER (ORDER BY salary ASC ROWS UNBOUNDED FOLLOWING) AS fv
 FROM (SELECT * FROM employees
 WHERE department_id = 90
 ORDER BY hire_date);
 
 -- ---------------------------------------
 
rem The following example returns, for each row, 
rem the hire date of the employee earning the
rem   lowest salary:
SELECT employee_id, last_name, salary, hire_date,
 LAST_VALUE(hire_date)
 OVER (ORDER BY salary DESC ROWS BETWEEN UNBOUNDED PRECEDING 
                                      AND UNBOUNDED  FOLLOWING) AS lv
 FROM (SELECT * FROM employees
 WHERE department_id = 90
 ORDER BY hire_date);

rem subquery 

SELECT department_id, employee_id, last_name, salary, hire_date
 FROM employees
 WHERE department_id = 90
 ORDER BY hire_date;
 

/*
 revisar en detalle 
 
 SELECT employee_id, last_name, salary, hire_date,
 FIRST_VALUE(last_name)
 OVER (ORDER BY salary ASC ROWS UNBOUNDED FOLLOWING) AS fv
 FROM (SELECT * FROM employees
 WHERE department_id = 90
 ORDER BY hire_date);
 */

rem [ Krishnamurthy  , 2021,p 7-147 ]

SELECT employee_id, last_name, salary, hire_date,
 FIRST_VALUE(last_name)
 OVER (ORDER BY salary ASC ROWS UNBOUNDED PRECEDING) AS fv
 FROM (SELECT * FROM employees
 WHERE department_id = 90
 ORDER by hire_date DESC);

-- ----------------------------------
/*
The following example selects, for each employee in Department 90, the name of the
employee with the lowest salary.
*/

rem [ Krishnamurthy  , 2021,p 7-147 ]


SELECT employee_id, last_name, salary, hire_date,
 FIRST_VALUE(last_name)
 OVER (ORDER BY salary ASC ROWS UNBOUNDED PRECEDING) AS fv
 FROM (SELECT * FROM employees
 WHERE department_id = 90
 ORDER BY hire_date);

-- -------------------------------
SELECT department_id,
 MIN(salary) KEEP (DENSE_RANK FIRST ORDER BY commission_pct) "Worst",
 MAX(salary) KEEP (DENSE_RANK LAST ORDER BY commission_pct) "Best"
 FROM employees
 GROUP BY department_id
 ORDER BY department_id;

rem [ Krishnamurthy  , 2021,p 7-219 ]

col "Emp_list" format a27
SELECT department_id "Dept",
	first_name        "Nombre",
	hire_date         "Date", 
	last_name         "Name",
	LISTAGG(last_name, '; ')
	WITHIN GROUP (ORDER BY hire_date, last_name)
	OVER (PARTITION BY department_id) as "Emp_list"
 FROM employees
 WHERE hire_date < '01-SEP-2003'
 ORDER BY "Dept", "Date", "Name";
 
 
 -- ------------------------------------
 rem [ Krishnamurthy  , 2021,p 7-216 ]
 
rem   For a specified measure, LISTAGG orders data within 
rem   each group specified in the ORDER
rem   BY clause and then concatenates the values of the measure column.
 
 col "Emp_list" format a50
 SELECT LISTAGG(last_name, '; ')
	WITHIN GROUP (ORDER BY hire_date, last_name) "Emp_list",
	MIN(hire_date) "Earliest"
 FROM employees
 WHERE department_id = 30;

-- ----------------------
 rem [ Krishnamurthy  , 2021,p 7-218 ]
 
col "Employees" format a90
SELECT department_id "Dept.",
 LISTAGG(last_name, '; ') 
	WITHIN GROUP (ORDER BY hire_date) "Employees"
 FROM employees
 GROUP BY department_id
 ORDER BY department_id;
 
 -- ----------------------------------
 
  rem [ Krishnamurthy  , 2021,p 7-219 ]
 
 SELECT department_id "Dept", 
	hire_date "Date", 
	last_name "Name",
	LISTAGG(last_name, '; ') WITHIN GROUP (ORDER BY hire_date, last_name)
			OVER (PARTITION BY department_id) as "Emp_list"
 FROM employees
 WHERE hire_date < '01-SEP-2003'
 ORDER BY "Dept", "Date", "Name";
 
 -- ----------------------------------------
 
rem [ Krishnamurthy  , 2021,p 7-227 ]
 
rem The following example calculates, 
rem for each employee, the highest salary of the
rem employees reporting to the same manager as the employee.

SELECT manager_id, last_name, salary,
 MAX(salary) OVER (PARTITION BY manager_id) AS mgr_max
 FROM employees
 ORDER BY manager_id,  salary desc, last_name ;
 
 -- ------------------------------------------
rem The following query returns the median salary 
rem for each manager in a subset of
rem  departments in the hr.employees table.

rem [ Krishnamurthy  , 2021,p 7-230 ] pag 517 del pdf 

SELECT manager_id, employee_id, salary,
 MEDIAN(salary) 
 OVER (PARTITION BY manager_id) "Median by Mgr"
 FROM employees
 WHERE department_id > 60
 ORDER BY manager_id, salary desc, employee_id;
 
 rem desplegar solo los del manager_id = 100
 
 SELECT manager_id, employee_id, salary,
 MEDIAN(salary) 
 OVER (PARTITION BY manager_id) "Median by Mgr"
 FROM employees
 WHERE department_id > 60
	and manager_id = 100
 ORDER BY manager_id, salary desc, employee_id;

-- -------------------------------------------
 rem desplegar solo los del manager_id = 145
 
 SELECT manager_id, employee_id, salary,
 MEDIAN(salary) 
 OVER (PARTITION BY manager_id) "Median by Mgr"
 FROM employees
 WHERE department_id > 60
	and manager_id = 145
 ORDER BY manager_id, salary desc, employee_id;
 
 -- --------------------------------------------
 
rem  Analytic Example
rem The following example determines, for each employee, the employees who were
rem hired on or before the same date as the employee. It then determines the subset
rem of employees reporting to the same manager as the employee, and returns the lowest
rem salary in that subset.
 
 rem [ Krishnamurthy  , 2021,p 7-231 ] pag 518 del pdf

SELECT manager_id, last_name, hire_date, salary,
 MIN(salary) OVER(PARTITION BY manager_id ORDER BY hire_date
					RANGE UNBOUNDED PRECEDING) AS p_cmin
 FROM employees
 ORDER BY manager_id, last_name, hire_date, salary;



SELECT manager_id, last_name, hire_date, salary,
 MIN(salary) OVER(PARTITION BY manager_id ORDER BY hire_date
					RANGE UNBOUNDED PRECEDING) AS p_cmin
 FROM employees
 where manager_id = 100
 ORDER BY manager_id,  hire_date, salary,last_name ;
 
 SELECT manager_id, last_name, hire_date, salary,
 MIN(salary) OVER(PARTITION BY manager_id ORDER BY hire_date)
					 AS p_cmin
 FROM employees
 where manager_id = 100
 ORDER BY manager_id,  hire_date, salary,last_name ;
 
 
 
 rem 
 
 
 ----------------------------------
 
 -- =============================================
rem   PERCENT_RANK 

rem PERCENT_RANK is similar to the CUME_DIST 
rem (cumulative distribution) function. The range
rem of values returned by PERCENT_RANK is 0 to 1,
rem  inclusive. The first row in any set has a
rem PERCENT_RANK of 0. The return value is NUMBER

rem Analytic Example
rem The following example calculates, 
rem for each employee, the percent rank of the
rem employees salary within the department:

col pr format 90.99999
SELECT department_id, last_name, salary, PERCENT_RANK() 
 OVER (PARTITION BY department_id ORDER BY salary DESC) AS pr
 FROM employees
 ORDER BY pr, salary, last_name;
 
 col pr format 90.99999
SELECT department_id, last_name, salary, PERCENT_RANK() 
 OVER (PARTITION BY department_id ORDER BY salary DESC) AS pr
 FROM employees
 where department_id = 100
 ORDER BY department_id, salary, last_name;
 
rem the following example computes the median salary in each department:


 rem [ Krishnamurthy  , 2021,p 7-264 ] pag 551 del pdf
 
 
SELECT department_id,
 PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY salary DESC) "Median cont",
 PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY salary DESC) "Median disc"
 FROM employees
 GROUP BY department_id
 ORDER BY department_id;
 
 -- --------------------------------------
 
rem Analytic Example
rem The following statement ranks the employees in the sample hr schema in department
rem 60 based on their salaries. Identical salary values receive the same rank and
rem   cause nonconsecutive ranks. Compare this example with the analytic example for
rem       DENSE_RANK .

 rem [ Krishnamurthy  , 2021,p 7-297 ] pag 584 del pdf
 

SELECT department_id, last_name, salary,
 RANK() OVER (PARTITION BY department_id ORDER BY salary) RANK
 FROM employees 
 WHERE department_id = 60
 ORDER BY RANK, last_name;
 
 SELECT department_id, last_name, salary,
 RANK() OVER (PARTITION BY department_id ORDER BY salary) RANK
 FROM employees 
 WHERE department_id in ( 60, 100)
 ORDER BY department_id,RANK, last_name;
 
 -- -------------------------------------------
 
 /*
 DENSE_RANK computes the rank of a row in an ordered group of rows and returns the
rank as a NUMBER. The ranks are consecutive integers beginning with 1. The largest
rank value is the number of unique values returned by the query. Rank values are not
skipped in the event of ties. Rows with equal values for the ranking criteria receive the
same rank. This function is useful for top-N and bottom-N reporting.
 */
 
rem [ Krishnamurthy  , 2021,p 7-119 ] pag 406 del pdf
  
 SELECT department_id, last_name, salary,
	DENSE_RANK() OVER 
	(PARTITION BY department_id ORDER BY salary) DENSE_RANK
 FROM employees WHERE department_id = 60
 ORDER BY DENSE_RANK, last_name;


 SELECT department_id, last_name, salary,
	DENSE_RANK() OVER 
	(PARTITION BY department_id ORDER BY salary) DENSE_RANK
 FROM employees WHERE department_id in ( 60,100)
 ORDER BY department_id, DENSE_RANK, last_name;
 
 
 
 
 
 
 


