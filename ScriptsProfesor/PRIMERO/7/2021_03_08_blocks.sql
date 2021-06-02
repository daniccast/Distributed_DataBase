spool C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\PRIMERO\7\SGA_ARCHITEC.txt
REM  Maxey G & Bhatiya R & Chan I & Ashdown. (2020)Oracle Database Database Performance Tuning Guide, 21c, USA :Oracle Corp.
rem  chapter 13 Tuning the Database Buffer Cache
rem   Morales T & Rich K (2009). Oracle database reference, USA: Oracle Corp. 
rem Kyte T (2005). Expert Oracle Database Architecture. New York, USA: Apress.
rem pag 1576
set pagesize 88
set linesize 130
set colsep '|=|';
set sqln on
SET UNDERLINE =
set feedback on 

desc v$database;

select dbid,Name, log_mode,open_mode
	from v$database;

SELECT NAME, BYTES/1024/1024/1024 GB  
     FROM V$SGAINFO WHERE NAME = 'Buffer Cache Size';

select count (*) from v$sgainfo;

col name format a45
col Mbytes format 9,999.99
col resize format a9
select name, bytes/1024/1024 Mbytes, resizeable resize
	from v$sgainfo
	order by 1;
rem
rem tomado  de oracle database performing guide, ,P252
rem [Maxey G & Bhatiya,2020,252]
SELECT name, value
FROM V$SYSSTAT
WHERE name IN ('db block gets from cache', 'consistent gets from cache',
'physical reads cache');


rem querys ssl
rem
         oracle database performing guide, ,257
select count(*) from v$db_cache_advice;

COL NAME FORMAT A13
col BZ FORMAT 99999
COL PRF FORMAT 999.99
COL PR  FORMAT 999,999
COL PRT FORMAT 999
COL PCTR FORMAT 999.99
select id, name, block_size    BZ,
	estd_physical_read_factor   PRF,
	estd_physical_reads         PR,
	estd_physical_read_time     PRT,
	estd_pct_of_db_time_for_reads PCTR
	from v$db_cache_advice;
REM


SELECT name, physical_reads, db_block_gets, consistent_gets,
 1 - (physical_reads / (db_block_gets + consistent_gets)) "Hit Ratio"
 FROM V$BUFFER_POOL_STATISTICS;
REM

REM    P 258

COLUMN object_name FORMAT A40
COLUMN number_of_blocks FORMAT 999,999,999,999
SELECT o.object_name, COUNT(*) number_of_blocks
 FROM DBA_OBJECTS o, V$BH bh
 WHERE o.data_object_id = bh.OBJD
 AND o.owner != 'SYS'
 GROUP BY o.object_Name
 ORDER BY COUNT(*),1;
 
REM    PAG 259
SELECT name, block_size, SUM(buffers)
FROM V$BUFFER_POOL
GROUP BY name, block_size
HAVING SUM(buffers) > 0;


-- aplica solo en oracle 12

-- SELECT FORCE_FULL_DB_CACHING FROM V$DATABASE;


desc v$database;

select table_Name, comments from dict 
where table_name like '%$BH%';
rem aunque no exicte en el directorio
desc X$BH
desc v$bh
 rem  consultemos la tabla   x$bh
SELECT
   dbarfil,
   dbablk,
   class,
   count(*)
FROM
   x$bh
where rownum <= 15
GROUP BY
   dbarfil,
   dbablk,
   class
  ;
   
 rem ahora consultemos la tabla   v$bh
col file# format 99,99
col block# format 99999
col class format 999
col status format a6
col xnc format 999
col forced_reads format 9999
col forced_writes format 9999
col dierect format a6
col ts# format 999
col cachehint format 999,999
select file#,block#,class#,status,
	dirty,temp,
	ping,stale,
	direct,
	TS#
	from v$BH
	where rownum <=20
	order by 4,2;

rem   [Morales T & Rich K,2009, 1576]	
	SELECT min(BLOCK#),max(block#)
	from v$BH;


	
select status, count(*) 
		from v$BH
		group by status;
		
		
rem  XCur   Exclusives 
rem free   free
rem cr     consistent read 


Rem    dirty blocks	
	select dirty, count(*) 
		from v$BH
		group by dirty;
		
Rem   ping  blocks	
	select ping, count(*) 
		from v$BH
		group by ping;
		
Rem   temp  blocks	
	select temp, count(*) 
		from v$BH
		group by temp;
		
Rem   temp  stale	
	select stale, count(*) 
		from v$BH
		group by stale;
		
Rem   direct  blocks	
	select direct, count(*) 
		from v$BH
		group by direct;
		
------------------

REM CUENTA LOS BLOKS

SELECT BLOCK#, COUNT(*)
	FROM V$bh
	where rownum <= 20
	GROUP BY BLOCK#
	order by 2 desc ,1;
	
	
SELECT BLOCK#, COUNT(*)
	FROM V$bh
	GROUP BY BLOCK#
	HAVING COUNT(*) > 4
	ORDER BY 2 desc, 1;

drop table subtotal;
CREATE TABLE SUBTOTAL AS 
SELECT BLOCK#, COUNT(*) TOTAL
	FROM V$bh
	GROUP BY BLOCK#
	HAVING COUNT(*) > 1;

SELECT BLOCK#, TOTAL FROM SUBTOTAL
		WHERE TOTAL > 2
	ORDER BY 2,1;
	
	
SELECT BLOCK#, STATUS
	FROM V$bh
	WHERE BLOCK# IN ( 851,422,2,853,45378,45834)
	ORDER BY 1,2;
	
SELECT BLOCK#, STATUS,
	dirty,temp,
	ping,stale,
	direct,
	TS#
	FROM V$bh
	WHERE BLOCK# IN ( 851,422,2,853,45378,45834)
	ORDER BY 1,2;
	
	
SELECT BLOCK#,STATUS,
	DIRTY, PING
	FROM V$bh 
	WHERE (DIRTY = 'Y'
	or ping = 'Y') and rownum <= 20
	order by 1,2;
	
spool off
