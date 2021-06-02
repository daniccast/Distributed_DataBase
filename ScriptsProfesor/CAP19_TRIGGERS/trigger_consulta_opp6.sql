spool C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\CAP19_TRIGGERS\trigger_consulta.txt
rem deplegar   las tablas de usuario hr/hr
/*
consultar la tabla del dict referente a  los objetos
primero consultemos las tablas que en su nombre tengan
la cadena objetos


*/
set colsep '|=|'
set linesize 130
set pagesize 99
set feedback on
set null nada
select table_name from dict 
	where table_name like '%OBJ%';

desc all_objects

desc all_object_tables

--   
COL OWNER FORMAT A12
COL object_name format a18
col status   format  a6
col object_type format a10 
select owner,object_name,
	object_type,status
	from all_objects
	where object_type = 'TABLE'
	AND OWNER = 'MASTERING';

col table_name format a22
col tablespace_name format a10
col iot_name   format a12	
select owner,table_name,tablespace_name,
		iot_name,
		pct_free,
		pct_used
		from all_object_tables;


/*
CONSULTEMOS LA TABLA DE LOS TRIGGERS

*/
select table_name from dict 
	where table_name like '%TRIGGERS%';

SELECT TABLE_NAME, INTERNAL_TRIGGER_TYPE
	FROM USER_INTERNAL_TRIGGERS;
REM 
REM  CONSULTAR LOS TRIGGER DECLARADOS PARA ESTE USUARIO
REM 
COL TABLE_OWNER FORMAT A5
COL COLUMN_NAME FORMAT A15
COL TRIGGERING_EVENT FORMAT A17
COL TABLE_NAME FORMAT A17
SELECT TRIGGER_NAME,TRIGGER_TYPE,TRIGGERING_EVENT,
	TABLE_OWNER,TABLE_NAME,
	STATUS
	FROM USER_TRIGGERS order by 2,1;
rem 
rem consultar por orden de tabla, tipo, nombre
--               -----------------------------------------   < -----
SELECT TRIGGER_NAME,TRIGGER_TYPE,TRIGGERING_EVENT,
	TABLE_OWNER,TABLE_NAME,
	STATUS
	FROM USER_TRIGGERS order by 5,2,1;
	
REM   SOLO LAS TUPLAS DE LAS TABLAS FRAME & FRAME AUDIT
---                                    ---------------------   <------
---                                    ---------------------   <------
---                                    ---------------------   <------
COL TABLE_OWNER FORMAT A5
COL COLUMN_NAME FORMAT A15
COL TRIGGERING_EVENT FORMAT A17
COL TABLE_NAME FORMAT A17
SELECT TRIGGER_NAME,TRIGGER_TYPE,TRIGGERING_EVENT,
	TABLE_OWNER,TABLE_NAME,
	STATUS
	FROM USER_TRIGGERS
	WHERE TABLE_NAME IN ('FRAME','FRAME_AUDIT') 
	order by 5,2,1;
-------------------------------                -------------   <------

SELECT TRIGGER_NAME,TRIGGER_TYPE,TRIGGERING_EVENT,
	TABLE_OWNER,TABLE_NAME,
	STATUS
	FROM USER_TRIGGERS
	order by 5,2,1;
------	----------------------------------------------     <-----  <-------
------
----------------------------------------------------------------	
--   CONSULTAR UN TRIGGER DESCRIPTION
COL DESCRIPTION FORMAT A25 WRAPPED
SELECT TRIGGER_NAME,
    DESCRIPTION,
	TABLE_OWNER,TABLE_NAME,
	COLUMN_NAME, STATUS
	FROM USER_TRIGGERS;	

/*
consultar la tabla EMPLOYEE
insertemos   tuplas en EMPLOYEE


*/	
set serveroutput on 
COL EMP_ID FORMAT 99999
COL FIRST_N FORMAT A19
COL LAST_NAME FORMAT A12
COL EMAIL     FORMAT A9
COL PHONE_NUMBER FORMAT A18
COL JOB_ID FORMAT  A10
COL SALARY FORMAT 99,999.99
COL MAN_ID FORMAT 9999
COL CPCT  FORMAT 99.99
COL DEPT_ID   FORMAT 9999
SELECT EMPLOYEE_ID EMP_ID,
	FIRST_NAME FIRST_N,
	LAST_NAME
	,EMAIL,PHONE_NUMBER,
	HIRE_DATE,JOB_ID,
	SALARY,
	COMMISSION_PCT CPCT,
	MANAGER_ID MAN_ID,
	DEPARTMENT_ID DEPT_ID
	FROM EMPLOYEE  
	WHERE ROWNUM 	<= 10
	ORDER BY 1;
INSERT INTO EMPLOYEE  VALUES
	(12,'IRMA','Mireles','IMIRELES2','650.124.122',
	TO_DATE('22/09/06','DD/MM/YY'),'ST_CLERK',2700.00,NULL,120,50);	

INSERT INTO EMPLOYEE  VALUES
	(13,'Erendida','Mireles','IMIRELES2','650.124.122',
	TO_DATE('22/09/06','DD/MM/YY'),'ST_CLERK',2700.00,NULL,120,50);
REM CORREO DUPLICADO	
INSERT INTO EMPLOYEE  VALUES
	(14,'ERNESTINA','Mireles','IMIRELES2','650.124.122',
	TO_DATE('22/09/06','DD/MM/YY'),'ST_CLERK',2700.00,NULL,120,50);	
	
INSERT INTO EMPLOYEE  VALUES
	(14,'ERNESTINA','Mireles','ERNESTINA','650.124.122',
	TO_DATE('22/09/06','DD/MM/YY'),'ST_CLERK',2700.00,NULL,120,50);	

rem borremos las tuplas de prueba
delete from employees
		where EMPLOYEE_ID = 12 OR EMPLOYEE_ID = 13
		OR EMPLOYEE_ID = 14;
spool off;