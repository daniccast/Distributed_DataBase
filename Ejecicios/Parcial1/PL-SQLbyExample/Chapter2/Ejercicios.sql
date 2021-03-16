spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\SQLbyExample\Chapter3\salida\ejercicioschapter3.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *                 
rem * Realizado el 13 de Marzo de 2021                  *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                *
rem *Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson.  *
rem *****************************************************

rem Establecer formato para las tablas

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150

rem alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
rem para estos ejercicios necesitamos este tipo de formato

rem ----------------------------- LAB 2.1 --------------------------------------------------------------------------------

-- ch02_1a.sql
rem ejemplo mal ¿Qué suscede? ¿Cómo arreglarlo? (ROSENZWEIG,B &  RAKHIMOV,E, p. 26).

SET SERVEROUTPUT ON

DECLARE
v_name 	VARCHAR2(30);
v_dob  	DATE;
v_us_citizen 	BOOLEAN;
BEGIN
DBMS_OUTPUT.PUT_LINE(v_name||'born on'||v_dob);
END;


rem ejemplo mal ¿Qué suscede? ¿Cómo arreglarlo? (ROSENZWEIG,B &  RAKHIMOV,E, p. 28).

SET SERVEROUTPUT ON;
	<< label >>
DECLARE
	v_var1 NUMBER(2) := 123;
	v_var2 NUMBER(3) := 123;
	v_var3 NUMBER(5,3) := 123456.123;
BEGIN
	DBMS_OUTPUT.PUT_LINE('v_var1: '||v_var1);
	DBMS_OUTPUT.PUT_LINE('v_var2: '||v_var2);
	DBMS_OUTPUT.PUT_LINE('v_var3: '||v_var3);
END;


rem ejemplo mal ¿Qué suscede? (ROSENZWEIG,B &  RAKHIMOV,E, p. 36).
-- ch02_5a.sql
SET SERVEROUTPUT ON
DECLARE
	e_show_exception_scope EXCEPTION;
	v_student_id NUMBER := 123;
	BEGIN
		DBMS_OUTPUT.PUT_LINE('outer student id is '||v_student_id);
		DECLARE
			v_student_id VARCHAR2(8) := 125;
		BEGIN
			DBMS_OUTPUT.PUT_LINE('inner student id is '||v_student_id);
			RAISE e_show_exception_scope;
	END;
EXCEPTION
	WHEN e_show_exception_scope
	THEN
	DBMS_OUTPUT.PUT_LINE('When am I displayed?');
	DBMS_OUTPUT.PUT_LINE('outer student id is '||v_student_id);
END;


spool OFF;
