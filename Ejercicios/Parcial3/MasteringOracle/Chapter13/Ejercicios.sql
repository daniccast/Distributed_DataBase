spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\MasteringOracle\Chapter13\salida\ejercicioschapter13.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Realizado el 8 de Junio de 2021                   *
rem *Mishra S., Beaulieu A. (2002). 			*
rem *Chapter 13 Advanced Analytic SQL en Mastering 	*
rem *Oracle						*
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

rem Ejemplo (Mishra y Beaulieu, 2002, 270):


SELECT c.name cust_name,
big_custs.cust_sales cust_sales, r.name region_name,
100 * ROUND(big_custs.cust_sales /
big_custs.region_sales, 2) percent_of_region
FROM region r, customer c,
	(SELECT cust_sales.cust_nbr cust_nbr, cust_sales.region_id region_id,
	cust_sales.tot_sales cust_sales,
	region_sales.tot_sales region_sales
	FROM
		(SELECT o.region_id region_id, SUM(o.tot_sales) tot_sales
		FROM orders o
		WHERE o.year = 2001
		GROUP BY o.region_id) region_sales,
		(SELECT o.cust_nbr cust_nbr, o.region_id region_id,
		SUM(o.tot_sales) tot_sales
		FROM orders o
		WHERE o.year = 2001
		GROUP BY o.cust_nbr, o.region_id) cust_sales
	WHERE cust_sales.region_id = region_sales.region_id
	AND cust_sales.tot_sales > (region_sales.tot_sales * .2)) big_custs
WHERE big_custs.cust_nbr = c.cust_nbr
AND big_custs.region_id = r.region_id;

SELECT c.name cust_name,
cust_sales.tot_sales cust_sales, r.name region_name,
100 * ROUND(cust_sales.tot_sales /
cust_sales.region_sales, 2) percent_of_region
FROM region r, customer c,
	(SELECT o.region_id region_id, o.cust_nbr cust_nbr,
	SUM(o.tot_sales) tot_sales,
	SUM(SUM(o.tot_sales)) OVER (PARTITION BY o.region_id) region_sales
	FROM orders o
	WHERE o.year = 2001
	GROUP BY o.region_id, o.cust_nbr) cust_sales
WHERE cust_sales.tot_sales > (cust_sales.region_sales * .2)
AND cust_sales.region_id = r.region_id
AND cust_sales.cust_nbr = c.cust_nbr;



rem Ejercicios  RANK, DENSE_RANK, and ROW_NUMBER

SELECT region_id, cust_nbr,
SUM(tot_sales) cust_sales,
RANK( ) OVER (ORDER BY SUM(tot_sales) DESC) sales_rank,
DENSE_RANK( ) OVER (ORDER BY SUM(tot_sales) DESC) sales_dense_rank,
ROW_NUMBER( ) OVER (ORDER BY SUM(tot_sales) DESC) sales_number
FROM orders
WHERE year = 2001
GROUP BY region_id, cust_nbr
ORDER BY 6;








spool OFF;
