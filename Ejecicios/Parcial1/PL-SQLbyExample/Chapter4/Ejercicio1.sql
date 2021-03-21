spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter4\salida\ejercicio1chapter4.txt
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

-- IF THEN EJEMPLO. (ROSENZWEIG,B &  RAKHIMOV,E, p. 88).

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

/* Rewrite ch04_1a.sql. Instead of getting information from the user for the variable v_date , define
its value with the help of the function SYSDATE. After it has been determined that a certain day
falls on the weekend, check to see if the time is before or after noon. Display the time of day
together with the day. (ROSENZWEIG,B &  RAKHIMOV,E, p. 109)
*/

DECLARE
v_date  DATE;
v_day varchar(15);

BEGIN

select SYSDATE 
into v_date
from dual;

v_day := RTRIM(TO_CHAR(v_date, 'DAY'));

IF v_day IN ('SATURDAY', 'SUNDAY') THEN
	DBMS_OUTPUT.PUT_LINE (v_date||' falls on weekend');
ELSE
	DBMS_OUTPUT.PUT_LINE (v_date||' doesnt fall on weekend');
END IF;

v_day := RTRIM(TO_CHAR(v_date, 'am'));

IF v_day like 'am' THEN
	DBMS_OUTPUT.PUT_LINE ('Before noon');
ELSE
	DBMS_OUTPUT.PUT_LINE ('After noon');
END IF;
END;

.
/

spool OFF;
