spool C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\TERCERO\40\control_file.txt
/*
ejecutarlo en SYS
Oracle Database Administrator's Guide, 11g Release 2 (11.2)
E25494-07
Copyright © 2001, 2015, Oracle and/or its affiliates. All rights reserved.
Primary Author: Steve Fogel

*/

/*

pag 363
managing control files
What Is a Control File?
Every Oracle Database has a control file, which is a small binary file that records the 
physical structure of the database. The control file includes: 
■ The database name
■ Names and locations of associated data files and redo log files
■ The timestamp of the database creation
■ The current log sequence number
■ Checkpoint information
*/


rem  [Fogel,2015, p371]
rem Displays the names of control files 
rem as specified in 
rem the CONTROL_FILES initialization parameter
rem la vista  V$PARAMETER 
desc v$parameter


col num format 999
col name format a40
col type format 999
col value format a70
select num, name, type, value
	from v$parameter
	where rownum <= 25;
	
rem 
select num, name, type, value
	from v$parameter;
	where rownum <= 25;
	
---
---

rem la vista 
rem  V$DATABASE
rem  Displays database information from the control file
desc V$DATABASE
col name format a12
select dbid, name, created,
	log_mode,open_mode,controlfile_type,
	flashback_on
	from V$database;
	
rem V$CONTROLFILE 	
rem Lists the names of control files
rem
col status format a10
col name format a60
col is_recovery_dest_file format a4
col block_size   format 9999999
col file_size_blks format 9999
select status,
	name,is_recovery_dest_file,
	block_size, file_size_blks
	from V$controlfile;
	
spool off

	

