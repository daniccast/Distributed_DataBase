SPOOL C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\SEGUNDO\21\mi_primer_trigger.txt

set feedback off
set pagesize 99
set linesize 130
set colsep '|=|'
set feedback on


REM 
REM Owens, Kevin.
REM  Programming Oracle triggers and stored procedures / Kevin Owens

REM [Owens,2003,section 6.1]
set serveroutput on 

drop table temp;
CREATE TABLE temp (N NUMBER);

CREATE OR REPLACE TRIGGER temp_air
   AFTER INSERT ON TEMP 
   FOR EACH ROW
   BEGIN
   dbms_output.put_line('         H O L A   ESCOM');
   dbms_output.put_line('executing temp_air');
   dbms_output.put_line
		('Estoy en clase Remota de ESCOM------------');
  END;
  
INSERT INTO temp VALUES (10); 
INSERT INTO temp VALUES (20); 
INSERT INTO temp VALUES (30); 
INSERT INTO temp VALUES (40); 
INSERT INTO temp VALUES (50); 
INSERT INTO temp VALUES (60); 
INSERT INTO temp VALUES (70); 


desc user_triggers


col trigger_name format a13
col trigger_type format a20
col triggering_event format A20
col table_owner format A10
col status format A10

select trigger_name,trigger_type,triggering_event,
	table_owner,status
	from user_triggers;
	
alter trigger 	temp_air DISABLE; 

alter trigger 	temp_air ENABLE; 
  

CREATE OR REPLACE TRIGGER temp_air2
   AFTER INSERT ON TEMP
   FOR EACH ROW
  BEGIN
  dbms_output.put_line('executing temp_air');
  dbms_output.put_line('         H O L A  ALUMNOS DE DDB ESCOM');
  END;
  
INSERT INTO temp VALUES (150); 
INSERT INTO temp VALUES (160); 
INSERT INTO temp VALUES (170); 
-- -------------------------------------------
rem 
rem REM [Owens,2003,section 6.3]
rem 
DROP TABLE TEMPORAL;
CREATE TABLE temporal (N NUMBER DEFAULT 0, M NUMBER);

rem declaremos el trigger
CREATE OR REPLACE TRIGGER temp_aiur
AFTER INSERT OR UPDATE ON TEMPORAL
FOR EACH ROW
BEGIN
    CASE
    WHEN inserting THEN
        dbms_output.put_line
            (CHR(10)||CHR(9)||'executing temp_aiur - insert');
	    dbms_output.put_line
            (CHR(9)||'executando temp_aiur - al insertar insert'||CHR(10));
    WHEN updating THEN
        dbms_output.put_line
            (CHR(10)||CHR(9)||'executing temp_aiur - al actualizar update');
		dbms_output.put_line
            (CHR(9)||'executando temp_aiur - al insertar insert'||CHR(10));
    END CASE;
END;

INSERT INTO TEMPORAL (M) VALUES (30);
INSERT INTO TEMPORAL (M) VALUES (40);
INSERT INTO TEMPORAL (M) VALUES (50);
INSERT INTO TEMPORAL (M) VALUES (60);
INSERT INTO TEMPORAL (M) VALUES (70);
-- ---------------------------------------------------
REM 
REM REM [Owens,2003,section 6.4]
REM 6.4 Trigger Body
REM 
DROP TABLE TEMPORAL2;
CREATE TABLE TEMPORAL2 (N NUMBER, M NUMBER DEFAULT 5);
CREATE OR REPLACE TRIGGER temp_bur
BEFORE UPDATE ON TEMPORAL2
FOR EACH ROW
BEGIN
    dbms_output.put_line(CHR(10)||CHR(9)||'BUR old N:'||:old.n|| ' M:'||:old.M);
    dbms_output.put_line(CHR(10)||CHR(9)||'BUR new N:'||:new.n|| ' M:'||:new.M);
END;
.
/
CREATE OR REPLACE TRIGGER temp_aur
AFTER UPDATE ON TEMPORAL2
FOR EACH ROW
BEGIN
    dbms_output.put_line(CHR(10)||CHR(9)||'AUR old N:'||:old.n|| ' M:'||:old.M);
    dbms_output.put_line(CHR(10)||CHR(9)||'AUR new N:'||:new.n|| ' M:'||:new.M);
END;
.
/
REM
INSERT INTO TEMPORAL2 VALUES (100);
INSERT INTO TEMPORAL2 VALUES (200);
INSERT INTO TEMPORAL2 (n) VALUES (300);
INSERT INTO TEMPORAL2 (n) VALUES (400);
INSERT INTO TEMPORAL2 (n) VALUES (500);

REM

UPDATE TEMPORAL2 SET n=n+1 WHERE n>=1;
UPDATE TEMPORAL2 SET n=n+1 WHERE n>=1;



REM BORRAR TRIGGERS
rem 
DROP TRIGGER temp_air;
DROP TRIGGER temp_aur;
DROP TRIGGER temp_bur;
DROP TRIGGER temp_aiur;
DROP TRIGGER temp_air2;

spool off 




