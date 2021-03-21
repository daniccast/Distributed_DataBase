spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter5\salida\ejercicio1chapter5.txt
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

-- Hacer, pasar a searched, usar else(ROSENZWEIG,B &  RAKHIMOV,E, p. 118).

-- ch05_1a.sql, version 1.0

DECLARE
v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');
v_day VARCHAR2(1);
BEGIN
v_day := TO_CHAR(v_date, 'D');
CASE v_day
WHEN '1' THEN
DBMS_OUTPUT.PUT_LINE ('Today is Sunday');
WHEN '2' THEN
DBMS_OUTPUT.PUT_LINE ('Today is Monday');
WHEN '3' THEN
DBMS_OUTPUT.PUT_LINE ('Today is Tuesday');
WHEN '4' THEN
DBMS_OUTPUT.PUT_LINE ('Today is Wednesday');
WHEN '5' THEN
DBMS_OUTPUT.PUT_LINE ('Today is Thursday');
WHEN '6' THEN
DBMS_OUTPUT.PUT_LINE ('Today is Friday');
WHEN '7' THEN
DBMS_OUTPUT.PUT_LINE ('Today is Saturday');
END CASE;

END;

.
/


-- Usando SEARCH CASE, y agregando else.


DECLARE
v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');

BEGIN
CASE 
	WHEN TO_CHAR(v_date, 'D')='1' THEN
		DBMS_OUTPUT.PUT_LINE ('Today is Sunday');
	WHEN TO_CHAR(v_date, 'D')='2' THEN
		DBMS_OUTPUT.PUT_LINE ('Today is Monday');
	WHEN TO_CHAR(v_date, 'D')='3' THEN
		DBMS_OUTPUT.PUT_LINE ('Today is Tuesday');
	WHEN TO_CHAR(v_date, 'D')='4' THEN
		DBMS_OUTPUT.PUT_LINE ('Today is Wednesday');
	WHEN TO_CHAR(v_date, 'D')='5' THEN
		DBMS_OUTPUT.PUT_LINE ('Today is Thursday');
	WHEN TO_CHAR(v_date, 'D')='6' THEN
		DBMS_OUTPUT.PUT_LINE ('Today is Friday');
	ELSE
		DBMS_OUTPUT.PUT_LINE ('Today is Saturday');
END CASE;

END;

.
/

-- O podriamos usar un CASE EXPRESSION

DECLARE
v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');
v_day varchar(20);
BEGIN
v_day:= CASE 
	WHEN TO_CHAR(v_date, 'D')='1' THEN
		'Today is Sunday'
	WHEN TO_CHAR(v_date, 'D')='2' THEN
		('Today is Monday')
	WHEN TO_CHAR(v_date, 'D')='3' THEN
		'Today is Tuesday'
	WHEN TO_CHAR(v_date, 'D')='4' THEN
		'Today is Wednesday'
	WHEN TO_CHAR(v_date, 'D')='5' THEN
		'Today is Thursday'
	WHEN TO_CHAR(v_date, 'D')='6' THEN
		'Today is Friday'
	ELSE
		'Today is Saturday'
	END CASE;

DBMS_OUTPUT.PUT_LINE ('Today is '|| v_day);
END;
.
/
--De esta forma podemos escribir código más compacto y claro.

spool OFF;
