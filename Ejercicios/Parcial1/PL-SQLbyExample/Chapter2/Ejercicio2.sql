spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter2\salida\ejercicio2chapter2.txt
/*
rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *                 
rem * Realizado el 13 de Marzo de 2021                  *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                *
rem *Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson.  *
rem *****************************************************
*/

set colsep '|=|'
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';
SET SERVEROUTPUT ON;

-- Ejemplo ¿Qué suscede? ¿Cómo arreglarlo? (ROSENZWEIG,B &  RAKHIMOV,E, p. 28).

DECLARE
	v_var1 NUMBER(2) := 123;
	v_var2 NUMBER(3) := 123;
	v_var3 NUMBER(5,3) := 123456.123;
BEGIN
	DBMS_OUTPUT.PUT_LINE('v_var1: '||v_var1);
	DBMS_OUTPUT.PUT_LINE('v_var2: '||v_var2);
	DBMS_OUTPUT.PUT_LINE('v_var3: '||v_var3);
END;
.
/

/*
Clarament este bloque de código nos produce un error. Es porque en la variable uno se
sobrepasa el límete de números que conforman la varable, al igual que en la tres. 
Si cambiamos esto el bloque funcinará correctamente.
*/

DECLARE
	v_var1 NUMBER(3) := 123;
	v_var2 NUMBER(4) := 1234;
	v_var3 NUMBER(8,2) := 1234.123;
BEGIN
	DBMS_OUTPUT.PUT_LINE('v_var1: '||v_var1);
	DBMS_OUTPUT.PUT_LINE('v_var2: '||v_var2);
	DBMS_OUTPUT.PUT_LINE('v_var3: '||v_var3);
END;

.
/
spool OFF;