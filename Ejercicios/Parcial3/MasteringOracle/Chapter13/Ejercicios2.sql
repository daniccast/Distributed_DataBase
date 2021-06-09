spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\MasteringOracle\Chapter13\salida\ejercicios2chapter13.txt

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

rem Ejemplo (Mishra y Beaulieu, 2002, 278)

SELECT
MIN(region_id)
	KEEP (DENSE_RANK FIRST ORDER BY SUM(tot_sales) DESC) best_region,
MIN(region_id)
	KEEP (DENSE_RANK LAST ORDER BY SUM(tot_sales) DESC) worst_region
FROM orders
WHERE year = 2001
GROUP BY region_id;

SELECT
MAX(region_id)
	KEEP (DENSE_RANK FIRST ORDER BY SUM(tot_sales) DESC) best_region,
MAX(region_id)
	KEEP (DENSE_RANK LAST ORDER BY SUM(tot_sales) DESC) worst_region
FROM orders
WHERE year = 2001
GROUP BY region_id;



rem Ejemplo (Mishra y Beaulieu, 2002, 281)

SELECT region_id, cust_nbr,
SUM(tot_sales) cust_sales,
WIDTH_BUCKET(SUM(tot_sales), 1, 3000000, 3) sales_buckets
FROM orders
WHERE year = 2001
GROUP BY region_id, cust_nbr
ORDER BY 3;

SELECT region_id, cust_nbr,
SUM(tot_sales) cust_sales,
CUME_DIST( ) OVER (ORDER BY SUM(tot_sales) DESC) sales_cume_dist,
PERCENT_RANK( ) OVER (ORDER BY SUM(tot_sales) DESC) sales_percent_rank
FROM orders
WHERE year = 2001
GROUP BY region_id, cust_nbr
ORDER BY 3 DESC;



spool OFF;
