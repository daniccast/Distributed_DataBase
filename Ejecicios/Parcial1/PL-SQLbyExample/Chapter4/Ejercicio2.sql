spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter4\salida\ejercicio2chapter4.txt
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

-- EJEMPLO NESTED IF (ROSENZWEIG,B &  RAKHIMOV,E, 2009, p.105) 

-- ch04_4a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
v_temp_in NUMBER := &sv_temp_in;
v_scale_in CHAR := '&sv_scale_in';
v_temp_out NUMBER;
v_scale_out CHAR;
BEGIN
IF v_scale_in != 'C' AND v_scale_in != 'F' THEN
DBMS_OUTPUT.PUT_LINE ('This is not a valid scale');
ELSE
IF v_scale_in = 'C' THEN
v_temp_out := ( (9 * v_temp_in) / 5 ) + 32;
v_scale_out := 'F';
ELSE
v_temp_out := ( (v_temp_in - 32) * 5 ) / 9;
v_scale_out := 'C';
END IF;
DBMS_OUTPUT.PUT_LINE ('New scale is: '||v_scale_out);
DBMS_OUTPUT.PUT_LINE ('New temperature is: '||v_temp_out);
END IF;
END;




/*Execute the following two PL/SQL blocks, and explain why they produce different output for the
same value of the variable v_num . Remember to issue the SET SERVEROUTPUT ON command
before running this script.
(ROSENZWEIG,B &  RAKHIMOV,E, 2009, p.109) 

*/
-- Block 1
DECLARE
v_num NUMBER := NULL;
BEGIN
IF v_num > 0 THEN
DBMS_OUTPUT.PUT_LINE ('v_num is greater than 0');
ELSE
DBMS_OUTPUT.PUT_LINE ('v_num is not greater than 0');
END IF;
END;
-- Block 2
DECLARE
v_num NUMBER := NULL;
BEGIN
IF v_num > 0 THEN
DBMS_OUTPUT.PUT_LINE ('v_num is greater than 0');
END IF;
IF NOT (v_num > 0) THEN
DBMS_OUTPUT.PUT_LINE ('v_num is not greater than 0');
END IF;
END;

spool OFF;

