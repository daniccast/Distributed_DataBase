spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter19\salida\ejercicio2chapter19.txt

/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 9 de Junio  de 2021                       *
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


-- Ejemplo. (ROSENZWEIG y RAKHIMOV, 2009, 325).

CREATE OR REPLACE PROCEDURE find_sname
	(i_student_id IN NUMBER,
	o_first_name OUT VARCHAR2,
	o_last_name OUT VARCHAR2
	)
AS
BEGIN
	SELECT first_name, last_name
		INTO o_first_name, o_last_name
		FROM student
		WHERE student_id = i_student_id;
EXCEPTION
	WHEN OTHERS
	THEN
	DBMS_OUTPUT.PUT_LINE('Error in finding student_id: '||i_student_id);
END find_sname;

-- ch19_03a.sql
DECLARE
	v_local_first_name student.first_name%TYPE;
	v_local_last_name student.last_name%TYPE;
BEGIN
	find_sname
		(145, v_local_first_name, v_local_last_name);
	DBMS_OUTPUT.PUT_LINE
	('Student 145 is: '||v_local_first_name||
	' '|| v_local_last_name||'.'
	);
END;


spool OFF;
