spool C:\Users\ORA_bases\2021_02_24_clase_2\salida\pga_ARCHITEC.txt
rem consultas sobre los procesos 
set colsep '|=|'
set pagesize 99
set linesize 130
set feedback on
set underline =
-- set null s/Datos
set null Null
set numwidth 7
REM DESPLEGAR LAS TABLAS DEL DICTIONARY QUE SE REFIEREN A USERS 


-- desc v$porcess
col pid format 999
col username format a8
col pga_used     format  9,999.9
col pga_alloc    format 99,999.9
col pga_freeab   format  9,999.9
col pga_max      format 99,999.9
col bg           format a4
prompt memoria en KBytes
select addr,pid,pname,username,
	background            BG,
	pga_used_mem/1024     pga_used,
	pga_alloc_mem/1024    pga_alloc,
	pga_freeable_mem/1024 pga_freeab,
	pga_max_mem/1024      pga_max
	from v$process;
-- ---------------------------------------	
REM [KYTE T,2005,170]
REM CONSULTAR LOS PROCESOS DE LA TABLE vg$PROCESS
COL DESCRIPTION FORMAT A49
COL PSER        FORMAT 9999
COL ERROR       FORMAT 999
SELECT PADDR,PSERIAL#,NAME,DESCRIPTION,ERROR
	FROM V$BGPROCESS
	WHERE ROWNUM <= 105
	ORDER BY 1 DESC,3,4;
	
---- -------------------------	
REM [KYTE T,2005,160]	
rem consultar la tabla de la session

SELECT SID,SERIAL#,USER#,USERNAME,STATUS,PROGRAM
	FROM V$SESSION
	ORDER BY 4,6;
	
SELECT SID, SERIAL#, PADDR 
	FROM V$SESSION WHERE USERNAME = USER;
	
-- -------------------------	
REM DATABASECONCEPTS
REM REM [Ashdown, L & Kyte,T,2015,15_7]
rem   consultar la tabla de  los procesos
COL PROGRAM A40	
SELECT PNAME,PROGRAM,USERNAME 
FROM V$PROCESS 
WHERE PNAME IS NOT NULL 
ORDER BY PNAME;
-------------------------------------
rem  consultas de cortesia
rem estudienlas !!!!
REM DESPLEGAR LAS TABLAS DEL DICTIONARY QUE SE REFIEREN A USERS 
select table_name from dict 
where table_name like '%USER_USERS%';

select username,user_id,account_status,expiry_date from user_users;

-- alter user sergio identified by sergio;

REM DESPLEGAR LAS TABLAS DEL DICTIONARY QUE SE REFIEREN A PERFILES 
select table_name from dict 
where table_name like '%PROFIL%';
rem consultar la tabla de los usuarios

DESC DBA_PROFILES

REM DESPLEGAR LOS PERFILES 
SELECT PROFILE,
	RESOURCE_NAME,
	RESOURCE_TYPE,
	LIMIT
	FROM DBA_PROFILES;
---------------------------------	
spool off
