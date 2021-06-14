spool C:\Users\ozkr_\OneDrive\Documentos\Github\Distributed_DataBase\Ejercicios\Parcial3\MasteringOracle\Chapter13\salida\ejercicios3chapter13.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cort�s Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Realizado el 7 de Junio de 2021                   *
rem *Mishra S., Beaulieu A. (2002). 			*
rem *Chapter 4 Group Operations			        *
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

/*
Usando nada más exótico que las vistas en línea, podemos construir una sola consulta que genere los resultados deseados. La solución, sin embargo, tiene las siguientes deficiencias:
• La consulta es bastante compleja.
• Se requieren dos pasadas por las mismas filas de la tabla de pedidos para generar los diferentes niveles de agregación que necesita la consulta. 

(Mishra y Beaulieu, 2002, 269)
*/

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





spool OFF;