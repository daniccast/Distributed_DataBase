spool C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\TERCERO\40\con_val_desc.txt
set pagesize 99
set linesize 130
set null s/Datos
set colsep '|=|'
SET SQLNUMBER ON

SELECT * FROM DBA_TAB_PRIVS
	WHERE GRANTEE IN 
	(SELECT GRANTED_ROLE FROM 
	DBA_ROLE_PRIVS  
	WHERE GRANTEE = 'SERGIOARGEN')
	ORDER BY 3;

SELECT TABLE_NAME FROM DICT 
	WHERE TABLE_NAME LIKE '%PRIVS%';
	
SELECT TABLE_NAME FROM DICT 
	WHERE TABLE_NAME LIKE '%ROLE%';
	
DESC DBA_ROLE_PRIVS
DESC DBA_TAB_PRIVS
---
col grantee format a30
col table_name format a29
col grantor    format a14
col privilege  format a19
col granteable format a2
col hierarchy  format a4
select grantee, table_name,grantor, privilege,
	grantable, hierarchy
	from dba_tab_privs
	where grantor IN ( 'SYS')
	  AND PRIVILEGE != 'SELECT'
	  AND PRIVILEGE != 'EXECUTE'
	ORDER BY 3,1,4,2;
	
select distinct grantee from dba_tab_privs
	order by 1;
	


select distinct grantor from dba_tab_privs
	order by 1;
---
SELECT GRANTEE, GRANTED_ROLE,
	ADMIN_OPTION,
	DEFAULT_ROLE
	FROM DBA_ROLE_PRIVS;
	
SELECT GRANTEE, GRANTED_ROLE,
	ADMIN_OPTION,
	DEFAULT_ROLE
	FROM DBA_ROLE_PRIVS
	WHERE GRANTEE LIKE '%SERGIO%'
	ORDER BY 2,1;

---
COL GRANTEE FORMAT A10
COL OWNER   FORMAT A10
COL TABLE_NAME FORMAT A30
COL  PRIVILEGE FORMAT A14
SELECT * FROM DBA_TAB_PRIVS
	WHERE GRANTEE IN ('HR');
--
COL GRANTEE         FORMAT A14
COL PRIVILEGE       FORMAT A30
COL ADMIN_OPTION    FORMAT A6	
select * from dba_sys_privs
	where grantee = 'SERGIONAVA';
	

	
select * from dba_sys_privs
	where grantee = 'SERGIONAVA';
	
select * from dba_sys_privs
	where grantee IN ('SERGIONAVA','SERGIOARGEN');

SELECT *
	FROM ROLE_SYS_PRIVS
	WHERE ROLE IN ('DBA', 'RESOURCE', 'CONNECT')
	ORDER BY 1,2;
	
REM AHORA SOLO RESOURCE & CONNECT
SELECT *
	FROM ROLE_SYS_PRIVS
	WHERE ROLE IN ('RESOURCE', 'CONNECT')
	ORDER BY 1,2;
	
SELECT 
	FROM ROLE_TAB_PRIVS 

SELECT 
	FROM ROLE_ROLE_PRIVS 
	
DESC ROLE_ROLE_PRIVS
DESC ROLE_SYS_PRIVS

SELECT ROLE,GRANTED_ROLE,ADMIN_OPTION
	FROM ROLE_ROLE_PRIVS
	ORDER BY 1,2;
	
SELECT ROLE,PRIVILEGE,ADMIN_OPTION
	FROM ROLE_SYS_PRIVS;

REM LIMITEMOS A DBA 
SELECT ROLE,PRIVILEGE,ADMIN_OPTION
	FROM ROLE_SYS_PRIVS
	WHERE ROLE IN ('DBA');	
	
COL ROLE FORMAT A25
COL OWNER FORMAT A15
COL PRIVILEGE FORMAT A18
SELECT ROLE,OWNER,PRIVILEGE,GRANTABLE
	FROM  ROLE_TAB_PRIVS;

SELECT DISTINCT ROLE FROM ROLE_TAB_PRIVS;
SELECT ROLE,OWNER,PRIVILEGE,GRANTABLE
	FROM  ROLE_TAB_PRIVS
	WHERE ROLE = 'DBA';
	
	
REM DESPLIEGA LAS ATRIBUTOS DE LOS ROLES
COL TABLE_NAME  FORMAT A29
COL COLUMN_NAME FORMAT A12
COL ROLE        FORMAT A6
COL OWNER       FORMAT A8
COL PRIVILEGE   FORMAT A13
COL GRANTABLE   FORMAT A10	
SELECT ROLE,
 	OWNER,
	TABLE_NAME,
	COLUMN_NAME,
	PRIVILEGE,
	GRANTABLE
	FROM  ROLE_TAB_PRIVS
	WHERE ROLE = 'DBA' AND OWNER = 'SYS';

SELECT ROLE,OWNER,PRIVILEGE,GRANTABLE,TABLE_NAME,COLUMN_NAME
	FROM  ROLE_TAB_PRIVS
	WHERE ROLE = 'DBA'AND OWNER = 'SYS'
	ORDER BY 1,2,3;
	

SELECT GRANTED_ROLE FROM 
	DBA_ROLE_PRIVS  
	WHERE GRANTEE = 'SERGIOARGEN'
	ORDER BY 1;
	
	spool off;