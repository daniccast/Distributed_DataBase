spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter21\salida\ejercicio1chapter21.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 9 de Junio  de 2021                       *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                     *
rem *Oracle® PL/SQLby Example,Boston,MA,USA:Perarson.      *
rem **********************************************************
*/

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';
SET SERVEROUTPUT ON;


-- Crear el script(ROSENZWEIG y RAKHIMOV, 2009, 460).


 CREATE OR REPLACE PACKAGE manage_students
AS
PROCEDURE find_sname
	(i_student_id IN student.student_id%TYPE,
	 o_first_name OUT student.first_name%TYPE,
	 o_last_name OUT student.last_name%TYPE
	);
FUNCTION id_is_good
 (i_student_id IN student.student_id%TYPE)
 RETURN BOOLEAN;
END manage_students;

.
/

-- ch21_2a.sql
DECLARE
	v_first_name student.first_name%TYPE;
	v_last_name student.last_name%TYPE;
BEGIN
	manage_students.find_sname (125, v_first_name, v_last_name);
	DBMS_OUTPUT.PUT_LINE(v_first_name||' '||v_last_name);
END;
.
/

-- No están las esecificaciones del package en el body. 

CREATE OR REPLACE PACKAGE BODY manage_students
AS
	PROCEDURE find_sname
		 (i_student_id IN student.student_id%TYPE,
		 o_first_name OUT student.first_name%TYPE,
		 o_last_name OUT student.last_name%TYPE
		 )
	IS
		v_student_id student.student_id%TYPE;
	 	BEGIN

	 	SELECT first_name, last_name
	 		INTO o_first_name, o_last_name
			 FROM student
			 WHERE student_id = i_student_id;
 	EXCEPTION
		 WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE ('Error in finding student_id: '||v_student_id);
	END find_sname;
	
	FUNCTION id_is_good
		(i_student_id IN student.student_id%TYPE)
		RETURN BOOLEAN
	 IS
		 v_id_cnt number;
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


END manage_students;
.
/

-- ch21_6a.sql

DECLARE
	v_first_name student.first_name%TYPE;
	v_last_name student.last_name%TYPE;
BEGIN
	IF manage_students.id_is_good(&&v_id) THEN
		manage_students.find_sname(&&v_id, v_first_name, v_last_name);
		DBMS_OUTPUT.PUT_LINE('Student No. '||&&v_id||' is ' ||v_last_name||', '||v_first_name);
	ELSE
		DBMS_OUTPUT.PUT_LINE('Student ID: '||&&v_id||' is not in the database.');
	END IF;
END;
.
/

-- Probar para 145


DECLARE
	v_first_name student.first_name%TYPE;
	v_last_name student.last_name%TYPE;
BEGIN
	IF manage_students.id_is_good(120) THEN
		manage_students.find_sname(120, v_first_name, v_last_name);
		DBMS_OUTPUT.PUT_LINE('Student No. '||120||' is ' ||v_last_name||', '||v_first_name);
	ELSE
		DBMS_OUTPUT.PUT_LINE('Student ID: '||120||' is not in the database.');
	END IF;
END;
.
/



spool OFF;
