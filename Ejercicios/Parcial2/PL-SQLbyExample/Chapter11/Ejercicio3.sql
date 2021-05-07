spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter11\salida\ejercicio3chapter11.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 2 de mayo  de 2021                        *
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

/*
Write a PL/SQL block with two cursor for loops. The parent cursor will call the student_id , first_name , and last_name from the student table for students with a student_id less than 110 and output one line with this information.
For each student, the child cursor will loop through all the courses that the student is enrolled in, outputting the course_no and the
description.
(ROSENZWEIG &  RAKHIMOV, 2009, 248)*/

DECLARE
	v_sid student.student_id%TYPE;
	CURSOR c_student IS
		SELECT student_id, first_name, last_name
		FROM student
		WHERE student_id < 110;
	CURSOR c_course IS
		SELECT c.course_no, c.description
		FROM course c, section s, enrollment e
		WHERE c.course_no = s.course_no
		AND s.section_id = e.section_id
		AND e.student_id = v_sid;
BEGIN
	FOR r_student IN c_student
	LOOP
		v_sid := r_student.student_id;
		DBMS_OUTPUT.PUT_LINE(chr(10));
		DBMS_OUTPUT.PUT_LINE(' The Student '||
		r_student.student_id||' '||
		r_student.first_name||' '||
		r_student.last_name);
		DBMS_OUTPUT.PUT_LINE(' is enrolled in the '||
		'following courses: ');
		FOR r_course IN c_course
		LOOP
			DBMS_OUTPUT.PUT_LINE(r_course.course_no||
			'
			'||r_course.description);
		END LOOP;
	END LOOP;
END;
.
/

/*
Claramente, usar un FOR exclusivo para los cursores es más práctico,
ya que no hat que definir el OPEN, FETCH y CLOSE del cursor.
Tampoco nos tenemos que preocupar por si el cursor ha sido cerrado o no.
Sin embargo, ambas maneras son totalmente válidas.
*/



spool OFF;
