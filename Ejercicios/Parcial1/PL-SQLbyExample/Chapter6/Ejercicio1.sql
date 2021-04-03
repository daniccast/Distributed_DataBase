spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter6\salida\ejercicio1chapter6.txt
/*
rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *                 
rem * Realizado el 21 de Marzo de 2021                  *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                *
rem *Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. *
rem *****************************************************
*/

set colsep '|=|'
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';

SET SERVEROUTPUT ON

-- ch06_1a.sql, version 1.0

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
.
/

/*
Rewrite script ch06_1a.sql using a WHILE loop instead of a simple loop. Make sure that the output
produced by this script does not differ from the output produced by the script ch06_1a.sql (ROSENZWEIG,B &  RAKHIMOV,E, p. 171).
*/

DECLARE
v_counter BINARY_INTEGER := 0;
BEGIN
WHILE v_counter<5 LOOP
-- increment loop counter by one
v_counter := v_counter + 1;
DBMS_OUTPUT.PUT_LINE ('v_counter = '||v_counter);
-- if EXIT condition yields TRUE exit the loop
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
.
/

spool OFF;
