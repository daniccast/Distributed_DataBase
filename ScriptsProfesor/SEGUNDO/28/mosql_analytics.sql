SPOOL C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\SEGUNDO\28\mosql_Analytics.txt

SET COLSEP ' || '
SET LINESIZE 150 
SET PAGESIZE 99

select cust_nbr, region_id, 
	stddev(tot_sales) over (order by region_id)
	from orders
	where cust_nbr = 27
	group by cust_nbr,region_id;
	
	
select cust_nbr, region_id, 
	sum(tot_sales) over (order by region_id)
	from orders
	where cust_nbr = 27
	group by cust_nbr,region_id;
	
select cust_nbr, region_id, 
	sum(tot_sales) 
	from orders
	where cust_nbr = 27
	group by cust_nbr,region_id;
	
select cust_nbr, region_id, 
	stddev(tot_sales) 
	from orders
	where cust_nbr = 27
	group by cust_nbr,region_id;
	
SELECT STDDEV_POP(tot_sales) "Pop",
	STDDEV_SAMP(tot_sales) "Samp"
FROM orders;

SELECT cust_nbr, region_id, tot_sales,
WIDTH_BUCKET(tot_sales, 1, 100000, 4) "ventas"
FROM orders WHERE cust_nbr in (1,2,4,3,5)
ORDER BY 2,1;

SELECT cust_nbr, region_id, sum(tot_sales),
WIDTH_BUCKET(sum(tot_sales), 1, 100000, 4) "Cubeta"
FROM orders WHERE cust_nbr in (1,2,4,3,5)
group by cust_nbr, region_id
ORDER BY 2,1;

SELECT cust_nbr, region_id, sum(tot_sales),
WIDTH_BUCKET(sum(tot_sales), 1, 3000000, 4) "Cubeta"
FROM orders WHERE cust_nbr in (1,2,4,3,5)
group by cust_nbr, region_id
ORDER BY 2,1;
SELECT cust_nbr, region_id, sum(tot_sales),
WIDTH_BUCKET(sum(tot_sales), 1, 100000, 4) "Cubeta"
FROM orders WHERE cust_nbr in (1,2,4,3,5)
group by cust_nbr, region_id
ORDER BY 2,1;

SELECT cust_nbr, region_id, sum(tot_sales),
WIDTH_BUCKET(sum(tot_sales), 500000, 1800000, 4) "Cubeta"
FROM orders WHERE cust_nbr in (1,2,4,3,5)
group by cust_nbr, region_id
ORDER BY 4;

col DESSTD FORMAT $999,999.99
SELECT cust_nbr, region_id, sum(tot_sales) total_V, 
 STDDEV_POP(tot_sales) "DESSTD",
WIDTH_BUCKET(sum(tot_sales), 1000000, 1800000, 4) "Cubeta"
FROM orders WHERE cust_nbr in (1,2,4,3,5)
group by cust_nbr, region_id
ORDER BY 4;

SELECT CUME_DIST(50000000, .005) WITHIN GROUP
(ORDER BY REGION_ID, CUST_NBR) "Cume-Dist"
FROM ORDERS;

SELECT CUST_NBR, REGION_ID, CUME_DIST()
OVER (PARTITION BY REGION_ID ORDER BY CUST_NBR) AS cume_dist
FROM ORDERS
GROUP BY CUST_NBR,REGION_ID;

SELECT CUST_NBR, REGION_ID, CUME_DIST()
OVER (PARTITION BY REGION_ID ORDER BY CUST_NBR) AS cume_dist
FROM ORDERS
GROUP BY CUST_NBR,REGION_ID;

col "Med_cont" format 999,999.00
col "Med_disc" format 999,999.00
SELECT CUST_NBR, REGION_ID,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY tot_sales DESC)
				"Med_cont",
	PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY tot_sales DESC)
				"Med_disc"
	FROM orders 
GROUP BY  REGION_ID, CUST_NBR;

col "Med_cont" format 999,999.00
col "Med_disc" format 999,999.00
SELECT CUST_NBR, REGION_ID,
	PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY tot_sales DESC)
				"Med_cont",
	PERCENTILE_DISC(0.9) WITHIN GROUP (ORDER BY tot_sales DESC)
				"Med_disc"
	FROM orders 
GROUP BY  REGION_ID, CUST_NBR;
col "Med_cont" format 99,999.99
col "Med_disc" format 99,999
SELECT '',CUST_NBR, REGION_ID,
	PERCENTILE_CONT(.99) WITHIN GROUP (ORDER BY tot_sales DESC)
				"Med_cont",
	PERCENTILE_DISC(.99) WITHIN GROUP (ORDER BY tot_sales DESC)
				"Med_disc"
	,''
	FROM orders 
GROUP BY  REGION_ID, CUST_NBR;

SELECT CUST_NBR, REGION_ID,
	PERCENTILE_CONT(.99) WITHIN GROUP (ORDER BY tot_sales DESC)
				"Med_cont",
	PERCENTILE_DISC(.99) WITHIN GROUP (ORDER BY tot_sales DESC)
				"Med_disc"
	FROM orders 
	where region_id in(6,8)
GROUP BY  REGION_ID, CUST_NBR;



SPOOL OFF;