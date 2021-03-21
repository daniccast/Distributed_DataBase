spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter3\salida\ejercicio3chapter5.txt
/*
rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *                 
rem * Realizado el 13 de Marzo de 2021                  *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                *
rem *Oracle® PL/SQLby Example,Boston,MA,USA:Perarson. *
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
Create the following script. Modify the script you created in Chapter 4, project 1 of the “Try It
Yourself” section. You can use either the CASE statement or the searched CASE statement. The
output should look similar to the output produced by the example you created in Chapter 4.
 (ROSENZWEIG,B &  RAKHIMOV,E, p. 78)
*/

-- Script a modificar

-- ch04_1a.sql, version 1.0

DECLARE
v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');
v_day VARCHAR2(15);
BEGIN
v_day := RTRIM(TO_CHAR(v_date, 'DAY'));
IF v_day IN ('SATURDAY', 'SUNDAY') THEN
DBMS_OUTPUT.PUT_LINE (v_date||' falls on weekend');
END IF;
--- control resumes here
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
.
/

-- MODIFICACIONES

DECLARE
v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');
v_day VARCHAR2(15);
BEGIN
v_day := RTRIM(TO_CHAR(v_date, 'DAY'));

CASE v_day
	when 'SATURDAY' then 
		DBMS_OUTPUT.PUT_LINE ('Falls on weekend, it\'s SATURDAY');
	when 'SUNDAY' then 
		DBMS_OUTPUT.PUT_LINE ('Falls on weekend, it\'s SUNDAY');
	else 
		DBMS_OUTPUT.PUT_LINE ('Doesn\'t fall on weekend');
END CASE;

.
/

spool OFF;
