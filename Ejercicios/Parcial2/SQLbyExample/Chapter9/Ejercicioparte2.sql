spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial2\SQLbyExample\Chapter9\salida\ejercicios2chapter9.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Realizado el 1 de Abril de 2021                   *
rem * Rischert,A (2004)."Chapter 9. Complex Joins". 	  *
rem *Ramagnano,L, Oracle® SQL™by Example(446-477). 	  *
rem *Pearson.  					  *
rem *****************************************************

rem Establecer formato para las tablas

set colsep '|=|'
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150

alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE= 'ENGLISH';
rem para estos ejercicios necesitamos este tipo de formato


rem ----------------------------- EJERCICIO A. LAB 9.1.1--------------------------------------------------------------------------------
rem S Explain why Oracle returns an error message when you execute the following SELECT
statement. (Rischert, 2004, 453). 

SELECT c.course_no, s.course_no, s.section_id,
	c.description, s.start_date_time
	FROM course c, section s
WHERE c.course_no(+) = s.course_no(+);

rem No podemos usar el símbolo de outer join en ambos lados. Tenemos que usar la sintaxis ANSI

SELECT c.course_no, s.course_no, s.section_id,
c.description, s.start_date_time
FROM course c FULL OUTER JOIN section s
ON c.course_no = s.course_no;


rem ----------------------------- EJERCICIO A. LAB 9.1.2--------------------------------------------------------------
rem  Display the course number, description, cost, class location, and instructors last name for all the courses. Also include courses where no sections or instructors have been assigned.  
rem (Rischert, 2004, 454). 

SELECT course_no cou, description, cost, location, last_name
	FROM course LEFT OUTER JOIN section
	USING (course_no)
	LEFT OUTER JOIN instructor
	USING (instructor_id)
	ORDER BY course_no;

SELECT c.course_no cou, c.description, c.cost, s.location, i.last_name
	FROM course c, section s, instructor i
	WHERE c.course_no = s.course_no(+)
	AND s.instructor_id = i.instructor_id(+)
	ORDER BY c.course_no


rem ----------------------------- EJERCICIO A. LAB 9.2.1--------------------------------------------------------------
rem For SECTION_ID 86, determine which students received a lower grade on their final than on their midterm. In your result, list the STUDENT_ID and the grade for the midterm and final.
rem (Rischert, 2004, 469)


SELECT fi.student_id, mt.numeric_grade "Midterm Grade", fi.numeric_grade "Final Grade"
	FROM grade fi JOIN grade mt
	ON (fi.section_id = mt.section_id
	AND fi.student_id = mt.student_id)
	WHERE fi.grade_type_code = 'FI'
	AND fi.section_id = 86
	AND mt.grade_type_code = 'MT'
	AND fi.numeric_grade < mt.numeric_grade


spool OFF;
