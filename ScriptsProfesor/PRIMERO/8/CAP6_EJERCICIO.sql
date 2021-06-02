spool C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\PRIMERO\8\Cap6_bySQL.txt

rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson.
rem ejercicios cap PL/SQL CONCEPTS
set pagesize 99
set linesize 130
set colsep '|=|'
set underline =
set null s/Datos
set feedback on 


rem [ROSENZWEIG &  RAKHIMOV,2009,118]

rem PARTES DE UN PROCESO ITERATIVO O LOOP, ESQUEMA1:
rem valor inicial
rem incremento
rem proceso
rem limite

rem PARTES DE UN PROCESO ITERATIVO O LOOP, ESQUEMA2:
rem valor inicial
rem limite
rem proceso
rem incremento

-- ch06_1a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
v_counter BINARY_INTEGER := 0;
BEGIN
LOOP
-- increment loop counter by one
v_counter := v_counter + 1;
DBMS_OUTPUT.PUT_LINE ('v_counter = '||v_counter);
-- if EXIT condition yields TRUE exit the loop
IF v_counter = 5 THEN
EXIT;
END IF;
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
/


spool off