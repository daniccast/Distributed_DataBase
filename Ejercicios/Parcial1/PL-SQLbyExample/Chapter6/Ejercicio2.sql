spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter6\salida\ejercicio2chapter6.txt
/*
rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *                 
rem * Realizado el 13 de Marzo de 2021                  *
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

/*
Factorial
(ROSENZWEIG,B &  RAKHIMOV,E, p. 166).
*/

-- ch06_4a.sql, version 1.0
DECLARE
v_factorial NUMBER := 1;
BEGIN
FOR v_counter IN 1..10 LOOP --No se puede cambiar dentro
v_factorial := v_factorial * v_counter;
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE
('Factorial of ten is: '||v_factorial);
END;
.
/

/*
Rewrite script ch06_4a.sql using a simple loop instead of a numeric FOR loop. Make sure that the
output produced by this script does not differ from the output produced by the script
ch06_4a.sql.
*/

DECLARE
v_factorial NUMBER := 1;
v_counter NUMBER := 1;

BEGIN

LOOP

v_factorial := v_factorial * v_counter;
EXIT WHEN v_counter=10;
v_counter:= v_counter + 1;
END LOOP;

-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Factorial of ten is: '||v_factorial);
END;
.
/

spool OFF;
