
set pagesize 88
set linesize 130
set colsep '|=|';
set sqln on 
set flush on
set echo on

rem despliega las restricciones y la columnas asociadas a las restricciones
rem
COL TABLE_NAME FORMAT A30
SELECT TABLE_NAME FROM DICT
	WHERE TABLE_NAME LIKE '%CONSTRAINT%';
REM 

COL OWNER FORMAT A10
COL NOMBRE FORMAT A22
COL TABLE_NAME      FORMAT A15
COL TIPO            FORMAT A4
COL STATUS          FORMAT A8
COL DEFERRABLE      FORMAT A15
COL DEFERRED        FORMAT A10

select owner
	, constraint_name NOMBRE
	, constraint_type TIPO
	, table_name 
	, status
	, deferrable
	, deferred
	from user_constraints
	where owner = 'SERGIONAVA'
	ORDER BY 3,2;
	
COL COLUMN_NAME FORMAT A19	
SELECT OWNER
	, CONSTRAINT_NAME
	, TABLE_NAME
	, COLUMN_NAME
	FROM USER_CONS_COLUMNS;