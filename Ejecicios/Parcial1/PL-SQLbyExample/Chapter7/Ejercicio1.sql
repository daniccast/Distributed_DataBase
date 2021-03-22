spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter7\salida\ejercicio1chapter7.txt
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

-- Implementar (ROSENZWEIG,B &  RAKHIMOV,E, p. 176).
-- ch07_1a.sql, version 1.0

DECLARE
	v_counter BINARY_INTEGER := 0;
BEGIN
	LOOP
		-- increment loop counter by one
		v_counter := v_counter + 1;
		DBMS_OUTPUT.PUT_LINE('before continue condition, v_counter = '||v_counter);
		
		-- if CONTINUE condition yields TRUE pass control to the
		-- first executable statement of the loop
		IF v_counter < 3 THEN
			CONTINUE;
		END IF;
		
		DBMS_OUTPUT.PUT_LINE(' after continue condition, v_counter = '|| v_counter);
		
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

spool OFF;
