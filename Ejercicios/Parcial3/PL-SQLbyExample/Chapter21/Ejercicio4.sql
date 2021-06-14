spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter21\salida\ejercicio4chapter21.txt
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

-- Cusor varible, ejemplo. (ROSENZWEIG y RAKHIMOV, 2009, 473).
-- ch21_9a.sql
CREATE OR REPLACE PACKAGE course_pkg AS
	TYPE course_rec_typ IS RECORD
		(first_name 	student.first_name%TYPE,
		 last_name 	student.last_name%TYPE,
		 course_no 	course.course_no%TYPE,
		 description	course.description%TYPE,
		 section_no	section.section_no%TYPE
		);
	TYPE course_cur IS REF CURSOR RETURN course_rec_typ;
	PROCEDURE get_course_list
		(p_student_id NUMBER ,
		 p_instructor_id NUMBER ,
		 course_list_cv IN OUT course_cur);
	END course_pkg;
/

CREATE OR REPLACE PACKAGE BODY course_pkg AS

	PROCEDURE get_course_list
		(p_student_id NUMBER ,
		p_instructor_id NUMBER ,
		course_list_cv IN OUT course_cur)
	IS
	 BEGIN
		IF p_student_id IS NULL AND p_instructor_id
		IS NULL THEN
			OPEN course_list_cv FOR
			SELECT 'Please choose a student-' 	First_name, 
			'instructor combination'		Last_name,
			NULL					course_no,
			NULL					description,
			NULL					section_no
				FROM dual;
		ELSIF p_student_id IS NULL THEN
			OPEN course_list_cv FOR
			SELECT s.first_name	first_name,
			s.last_name		last_name,
			c.course_no		course_no,
			c.description		description,
			se.section_no		section_no
				FROM instructor i, student s, section se, course c, enrollment e
				WHERE i.instructor_id = p_instructor_id
				AND i.instructor_id 	= se.instructor_id
				AND se.course_no 	= c.course_no
				AND e.student_id	= s.student_id
				AND e.section_id	= se.section_id
				ORDER BY c.course_no, se.section_no;
		
		ELSIF p_instructor_id IS NULL THEN
			OPEN course_list_cv FOR
			SELECT i.first_name 	first_name,
				i.last_name	last_name,
				c.course_no	course_no,
				c.description	description,
				se.section_no	section_no
				FROM instructor i, student s, section se, course c, enrollment e
				WHERE s.student_id = p_student_id
				AND i.instructor_id = se.instructor_id
				AND se.course_no = c.course_no
				AND e.student_id = s.student_id
				AND e.section_id = se.section_id
				ORDER BY c.course_no, se.section_no;
		END IF;
	END get_course_list;
	
END course_pkg;









-- Siguiendo ejemplo del libro

--  (ROSENZWEIG y RAKHIMOV, 2009, 475).


VARIABLE course_cv REFCURSOR
exec course_pkg.get_course_list(102, NULL, :course_cv);
print course_cv

exec course_pkg.get_course_list(NULL, 102, :course_cv);
print course_cv

exec course_pkg.get_course_list(NULL, NULL, :course_cv);
print course_cv


spool OFF;
