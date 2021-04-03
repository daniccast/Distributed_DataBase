spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter7\salida\ejercicio2chapter7.txt
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
Rewrite script ch07_3a.sql using a simple loop instead of the outer FOR loop, and a WHILE loop for
the inner FOR loop. Make sure that the output produced by this script does not differ from the
output produced by the original script.

(ROSENZWEIG,B &  RAKHIMOV,E, p. 190).
*/
-- ch07_3a.sql, version 1.0

DECLARE
v_test NUMBER := 0;
BEGIN
	<<outer_loop>>
	FOR i IN 1..3 LOOP
		DBMS_OUTPUT.PUT_LINE('Outer Loop');
		DBMS_OUTPUT.PUT_LINE('i = '||i);
		DBMS_OUTPUT.PUT_LINE('v_test = '||v_test);
		v_test := v_test + 1;
		<<inner_loop>>
		FOR j IN 1..2 LOOP
			DBMS_OUTPUT.PUT_LINE('Inner Loop');
			DBMS_OUTPUT.PUT_LINE('j = '||j);
			DBMS_OUTPUT.PUT_LINE('i = '||i);
			DBMS_OUTPUT.PUT_LINE('v_test = '||v_test);
		END LOOP inner_loop;
	END LOOP outer_loop;
END;
.
/
---------Cambios

SET SERVEROUTPUT ON
DECLARE
v_test NUMBER := 0;
i NUMBER:= 0;
j NUMBER:= 0;
BEGIN
	<<outer_loop>>
	LOOP
	i:= i+1;
		DBMS_OUTPUT.PUT_LINE('Outer Loop');
		DBMS_OUTPUT.PUT_LINE('i = '||i);
		DBMS_OUTPUT.PUT_LINE('v_test = '||v_test);
		v_test := v_test + 1;
		j:=0;
		<<inner_loop>>
		WHILE j<3 LOOP
			
			DBMS_OUTPUT.PUT_LINE('Inner Loop');
			DBMS_OUTPUT.PUT_LINE('j = '||j);
			DBMS_OUTPUT.PUT_LINE('i = '||i);
			DBMS_OUTPUT.PUT_LINE('v_test = '||v_test);
			j:= j+1;
		END LOOP inner_loop;
	
	
	EXIT WHEN i=3;
	END LOOP outer_loop;
END;
.
/

spool OFF;
