spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter7\salida\ejercicio3chapter7.txt
/*
rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *                 
rem * Realizado el 13 de Marzo de 2021                  *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                *
rem *Oracle® PL/SQL?by Example,Boston,MA,USA:Perarson. *
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
Rewrite script ch06_4a.sql to calculate the factorial of even integers only between 1 and 10. The
script should use a CONTINUE or CONTINUE WHEN statement..
 (ROSENZWEIG,B &  RAKHIMOV,E, p. 190)
*/

-- ch06_4a.sql, version 1.0

DECLARE
	v_factorial NUMBER := 1;
BEGIN
	FOR v_counter IN 1..10 LOOP
	CONTINUE WHEN MOD(v_counter)!=0;
	v_factorial := v_factorial * v_counter;
	END LOOP;
	
	-- control resumes here
	DBMS_OUTPUT.PUT_LINE('Factorial of ten is: '||v_factorial);
END;
.
/


spool OFF;
