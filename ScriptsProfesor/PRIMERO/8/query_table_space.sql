spool C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\PRIMERO\8\TABLE_SPACES.txt
rem script de utilidad y cortesia
set pagesize 88
set linesize 130
set colsep '|=|';
set underline =
set sqln on 
set flush on
set echo on
SET NULL S/Datos
REM SCRIPT PARA CREAR UN USUARIO
REM CONSIDERANDO QUE EL TABLESPACE TENGA UNA ASIGNACIÓN ORIGINAL DE CERO
REM 
/*
create user student identified by learn
default tablespace users
temporary tablespace temp
quota unlimited on users;

REM SI NO PERMITE GENERAR SCRIPT 

alter session set "_ORACLE_SCRIPT"=true;

alter system set "_ORACLE_SCRIPT"=true SCOPE=SPFILE;
*/
REM CONSULTAR LAS TABLAS DEL DICTIONARY QUE SE REFIERAN AS TABLESPACES

select table_name from dict
	where table_name like '%TABLESPACE%'
	ORDER BY 1;




REM SCRIPTS TOMADOS DE 
REM   ORACLE COMMUNITIES

col "Tablespace" for a22
col "Used MB" for 99,999,999
col "Free MB" for 99,999,999
col "Total MB" for 99,999,999

select df.tablespace_name "Tablespace",
	totalusedspace "Used MB",
	(df.totalspace - tu.totalusedspace) "Free MB",
	df.totalspace "Total MB",
	round(100 * ( (df.totalspace - tu.totalusedspace)/ df.totalspace))
	"Pct. Free"
from
	(select tablespace_name,
	round(sum(bytes) / 1048576) TotalSpace
	from dba_data_files
	group by tablespace_name) df,
		(select round(sum(bytes)/(1024*1024)) totalusedspace, tablespace_name
			from dba_segments
			group by tablespace_name) tu
		where df.tablespace_name = tu.tablespace_name
		ORDER BY 1;
-- -------------------------------		
REM   ORACLE COMMUNITIES
REM DESPIEGA EL ESPACIO LIBRE Y EL ASIGNADO A LOS TABLESPACES
select b.tablespace_name, tbs_size SizeMb, a.free_space FreeMb
	from  (select tablespace_name, round(sum(bytes)/1024/1024 ,2) as free_space
			from dba_free_space
			group by tablespace_name) a,
				(select tablespace_name, sum(bytes)/1024/1024 as tbs_size
					from dba_data_files
					group by tablespace_name) b
	where a.tablespace_name(+)=b.tablespace_name
		ORDER BY 1;
-- -----------------------------------------
REM   ORACLE COMMUNITIES		
REM DESPLIEGA EL ESPACIO ASIGNADO AL TABLESPACE TEMP
select sum(bytes)/1024 kbytes_alloc, tablespace_name
	from sys.dba_temp_files
		group by tablespace_name;
spool off 
		
