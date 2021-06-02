spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter20\salida\ejercicio2chapter20.txt

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


-- Ejemplo. Correr el script (ROSENZWEIG y RAKHIMOV, 2009, 452).

-- ch20_01b.sql, version 1.0
CREATE OR REPLACE FUNCTION id_is_good
	(i_student_id IN NUMBER)
RETURN BOOLEAN
AS
	v_id_cnt NUMBER;
BEGIN
	SELECT COUNT(*)
	INTO v_id_cnt
	FROM student
	WHERE student_id = i_student_id;
	RETURN 1 = v_id_cnt;
EXCEPTION
	WHEN OTHERS
	THEN
		RETURN FALSE;
END id_is_good;
.
/
DECLARE
	v_id number;
BEGIN
	v_id := &id;
	IF id_is_good(v_id)
	THEN
		DBMS_OUTPUT.PUT_LINE
		('Student ID: '||v_id||' is a valid.');
	ELSE
		DBMS_OUTPUT.PUT_LINE
		('Student ID: '||v_id||' is not valid.');
	END IF;
END;
.
/


spool OFF;
