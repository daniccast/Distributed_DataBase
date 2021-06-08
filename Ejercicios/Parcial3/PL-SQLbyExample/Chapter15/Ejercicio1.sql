spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter8\salida\ejercicio1chapter8.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cort�s Castilllo Daniela y Mendoza Cuellar Jos� Oscar  *                 
rem * Realizado el 4 de Abril  de 2021                       *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                     *
rem *Oracle� PL/SQL�by Example,Boston,MA,USA:Perarson.       *
rem **********************************************************
*/

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';
SET SERVEROUTPUT ON;


-- In this exercise, you calculate the value of the square root of a number and display it on the screen. (ROSENZWEIG y RAKHIMOV, 2009, 167).

-- ch08_1a.sql, version 1.0

DECLARE
	v_num NUMBER := &sv_num;
BEGIN
	DBMS_OUTPUT.PUT_LINE ('Square root of '||v_num||' is '||SQRT(v_num));
EXCEPTION
	WHEN VALUE_ERROR THEN
	DBMS_OUTPUT.PUT_LINE ('An error has occurred');
END;
.
/
/

--Esta excepci�n se puede manejar inclusive sin el bloque manejador. 


DECLARE
	v_num NUMBER := &sv_num;
BEGIN
	IF v_num >= 0 THEN
		DBMS_OUTPUT.PUT_LINE ('Square root of '||v_num|| ' is '||SQRT(v_num));
	ELSE
		DBMS_OUTPUT.PUT_LINE ('A number cannot be negative');
	END IF;
END;
.
/
/
spool OFF;
