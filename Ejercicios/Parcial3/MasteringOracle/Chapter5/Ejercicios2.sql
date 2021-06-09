spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\MasteringOracle\Chapter5\salida\ejercicios2chapter5.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Realizado el 7 de Junio de 2021                   *
rem *Mishra S., Beaulieu A. (2002). 			*
rem *Chapter 5. Subqueries				*
rem * SQL (pp. 157-174).Gravenstein Highway North,	*
rem * Sebastopol, CA 95472. 				*
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

rem  We might, for example, want to find all parts that have shipped
rem at least once in 2002. The EXISTS operator is used for these types of queries, as illus-
rem trated by the following query: (Mishra y Beaulieu, 2002, 75)

SELECT p.part_nbr, p.name, p.unit_cost
FROM part p
WHERE EXISTS
	(SELECT 1 FROM line_item li, cust_order co
	WHERE li.part_nbr = p.part_nbr
	AND li.order_nbr = co.order_nbr
	AND co.ship_dt >= TO_DATE('01-JAN-2002','DD-MON-YYYY'));

rem Ejemplo de INLINE VIEWS

SELECT d.dept_id, d.name, emp_cnt.tot
FROM department d,
	(SELECT dept_id, COUNT(*) tot
	FROM employee
	GROUP BY dept_id) emp_cnt
	WHERE d.dept_id = emp_cnt.dept_id;



SELECT e.lname employee, top5_emp_orders.tot_sales total_sales,
ROUND(top5_emp_orders.tot_sales * 0.01) bonus
FROM
	(SELECT all_emp_orders.sales_emp_id emp_id,
	all_emp_orders.tot_sales tot_sales
	FROM
		(SELECT sales_emp_id, SUM(sale_price) tot_sales,
		RANK( ) OVER (ORDER BY SUM(sale_price) DESC) sales_rank
		FROM cust_order
		WHERE order_dt >= TO_DATE('01-JUL-2001','DD-MON-YYYY')
		AND order_dt < TO_DATE('01-JUL-2002','DD-MON-YYYY')
		GROUP BY sales_emp_id
		) all_emp_orders
	WHERE all_emp_orders.sales_rank <= 5
	) top5_emp_orders, employee e
WHERE top5_emp_orders.emp_id = e.emp_id
ORDER BY 2 DESC;


spool OFF;
