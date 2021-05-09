spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter12\salida\ejercicio1chapter12.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 2 de mayo  de 2021                        *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                     *
rem *Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson.      *
rem **********************************************************
*/

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';
SET SERVEROUTPUT ON;

/*
Complete the code for the parameter cursor that was begun in the preceding example. Include a DBMS_OUTPUT line that displays the zip code, city, and state. 
This is identical to the process you have already used in a CURSOR FOR loop, only now, when you open the cursor, you pass a parameter.
(ROSENZWEIG &  RAKHIMOV, 2009, 255)
*/

-- ch12_17a.sql
DECLARE
CURSOR c_zip (p_state IN zipcode.state%TYPE) IS
	SELECT zip, city, state
	FROM zipcode
	WHERE state = p_state
BEGIN
	FOR r_zip IN c_zip('NJ')
		LOOP
		DBMS_OUTPUT.PUT_LINE(r_zip.city||
		' '||r_zip.zip');
	END LOOP;
END;

.
/

spool OFF;
