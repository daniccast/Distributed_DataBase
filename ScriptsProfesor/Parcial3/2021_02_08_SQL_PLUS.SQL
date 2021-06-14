SELECT table_name, tablespace_name,status
 FROM user_tables; 
 rem
 set colsep '| =|'
 set pagesize 99
 set linesize 130
 set sqlnumber  on
 
 col object_name format a28
 col object_type format a29
SELECT object_name, object_type
	FROM user_objects
		WHERE status = 'INVALID'
		ORDER BY object_type, object_name; 

rem
COL DATA_TYPE FORMAT A15
col table_name format a30
col column_name format a24
col data_scale   format 99999
col data_length  format 9999
SELECT table_name, column_name,data_scale
	,DATA_TYPE,DATA_LENGTH
FROM user_tab_columns
WHERE data_type = 'NUMBER'
AND data_scale <> 2
order by 1,2;
rem
rem
col table_name format a25

SELECT table_name, column_name,data_scale
	,DATA_TYPE,DATA_LENGTH
FROM user_tab_columns
WHERE data_type = 'NUMBER'
AND (data_scale <> 2 
OR data_scale IS NULL)
order by 1,2; 

col data_type format a20
SELECT table_name, column_name,data_scale
	,DATA_TYPE,DATA_LENGTH
FROM user_tab_columns
order by 1,2;

/*
WHERE data_type = 'NUMBER'
AND (data_scale <> 2 
OR data_scale IS NULL)
order by 1,2; 
*/

SELECT table_name, NVL(num_rows,0) filas
FROM user_tables
ORDER BY NVL(num_rows,0); 

SELECT table_name, num_rows
FROM user_tables
ORDER BY 2,1; 

SELECT table_name
FROM user_tables
MINUS
SELECT DISTINCT table_name
FROM user_indexes
WHERE table_owner = USER
ORDER BY table_name; 

rem analicemos la consulta
SELECT DISTINCT table_name
FROM user_indexes
WHERE table_owner = USER
ORDER BY table_name;

col index_name fromat a14
col index_type format a9
col table_owner format a10
col table_name format a27
col table_type format a10
col b_level format a5
col num_rows format 9,999
select index_name,index_type,table_owner,
	table_name,table_type
	b_level,num_rows
	from user_indexes
	order by 4,1;
	
rem

TTITLE LEFT "IPN EsCom " CENTER "Bases de Datos" -
RIGHT "Page" FORMAT 999 SQL.PNO SKIP 1 -
CENTER "Listado de Índices" SKIP 4 

SET TERMOUT OFF
COLUMN curdate NEW_VALUE report_date
SELECT TO_CHAR(SYSDATE,'dd-Mon-yyyy') curdate 
 FROM DUAL;
SET TERMOUT ON 
col table_name format a50

SELECT owner, table_name
  FROM all_tables
  ORDER BY owner, table_name;
  
rem
----------------------

BREAK ON owner SKIP PAGE ON object_type SKIP 1
SELECT  owner,object_type, object_name
 FROM all_objects
 where rownum <= 200
ORDER BY owner, object_type, object_name;
 
col segment_name format a25 
 COMPUTE SUM OF bytes ON segment_name
COMPUTE COUNT OF segment_name ON segment_type
BREAK ON segment_type ON segment_name
SELECT segment_name, segment_type, bytes
 FROM user_extents
ORDER BY segment_type, segment_name; 


 SELECT TO_CHAR(SYSDATE,
  'dd-Mon-yyyy hh:mi:ss PM') FECHA
  FROM dual;
 
 SELECT TO_CHAR(SYSDATE,
  'dd-FMMonth-yyyy hh:mi:ss PM') FECHA
  FROM dual; 
  
CLEAR BREAKS