spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter21\salida\ejercicio3chapter21.txt
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


-- Replace the last lines of the manage_students package specification in ch21_1a.sql with the
-- following, and recompile the package specification (ROSENZWEIG y RAKHIMOV, 2009, 465).

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
	 
	 PROCEDURE display_student_count;
	 
END manage_students;
.
/

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
	
	
	FUNCTION student_count_priv
		RETURN NUMBER
	IS
		v_count NUMBER;
	BEGIN
		select count(*)
			into v_count
			from student;
		return v_count;
	EXCEPTION
		WHEN OTHERS THEN
			return(0);
	END student_count_priv;
	
	
	PROCEDURE display_student_count
	IS 
		v_count NUMBER;
	BEGIN
		v_count := student_count_priv;
	 DBMS_OUTPUT.PUT_LINE ('There are '||v_count||' students.');
	
	END display_student_count;

END manage_students;
.
/

DECLARE
	V_count NUMBER;
BEGIN
	V_count := Manage_students.student_count_priv;
	DBMS_OUTPUT.PUT_LINE(v_count);
END;
.
/

-- No se puede porque es privado.

SET SERVEROUTPUT ON
Execute manage_students.display_student_count;


spool off;
