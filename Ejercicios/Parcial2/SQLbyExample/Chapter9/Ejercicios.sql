spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial2\SQLbyExample\Chapter9\salida\ejercicioschapter9.txt

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


rem ----------------------------- EJERCICIO B. LAB 9.1.1--------------------------------------------------------------------------------
rem Show the description of all courses with the prerequisite course number 350. Include the location where the sections meet in the result. Return course rows even if no corresponding row in the SECTION table is found(Rischert, 2004, 453). 

rem cursos con prerrequisito 350
SELECT course_no, description
FROM course
WHERE prerequisite = 350;

rem cursos que están en la tabla seccion

SELECT section_id, course_no
FROM section
WHERE course_no IN (430, 450);

rem JOIN

SELECT c.course_no cno, s.course_no sno,
	c.description,
	c.prerequisite prereq,
	s.location loc, s.section_id
FROM course c LEFT OUTER JOIN section s
ON c.course_no = s.course_no
WHERE c.prerequisite = 350;

rem usando USING como el formato ANSI

COL cno format 999;
COL sno format 999;
COL description format A40;
COL prereq format 999;
COL description format A10;
COL section_id format 999;

SELECT course_no cno,
	description,
	prerequisite prereq,
	location loc, section_id
FROM course LEFT OUTER JOIN section
USING (course_no)
WHERE prerequisite = 350;

rem Con el formato de oracle y agregando locacion


SELECT c.course_no cno, s.course_no sno,
	c.description,
	c.prerequisite prereq,
	s.location loc, s.section_id
FROM course c, section s
WHERE c.course_no = s.course_no(+)
AND c.prerequisite = 350
AND s.location(+) = 'L507';

rem ¿Que pasa si no le agregamos el + a la locacion?
rem no aparece el curso que no está en la localidad, debemos agregarlo al outer join
SELECT c.course_no cno, s.course_no sno,
	c.description,
	c.prerequisite prereq,
	s.location loc, s.section_id
FROM course c, section s
WHERE c.course_no = s.course_no(+)
AND c.prerequisite = 350
AND s.location = 'L507';

rem Con el estandar ANSI se agregan parentesis

SELECT c.course_no cno, s.course_no sno,
	c.description,
	c.prerequisite prereq,
	s.location loc, s.section_id
FROM course c LEFT OUTER JOIN section s
ON (c.course_no = s.course_no
AND location = 'L507')
WHERE c.prerequisite = 350;

rem Otra forma de hacerlo

SELECT c.course_no cno, s.course_no sno,
	c.description,
	c.prerequisite prereq,
	s.location loc, s.section_id
	FROM (SELECT *
	FROM course
	WHERE prerequisite = 350) c 
	LEFT OUTER JOIN
	(SELECT * FROM section
	WHERE location = 'L507') s
ON (c.course_no = s.course_no);

rem ----------------------------- EJERCICIO B. LAB 9.1.2--------------------------------------------------------------
rem For students with the student ID of 102 and 301, determine the sections they are enrolled in. Also show the numeric grades and grade types they received, no matter if they are enrolled or received any grades (Rischert, 2004, 454). 

SELECT student_id, section_id, grade_type_code,numeric_grade
FROM student LEFT OUTER JOIN enrollment
USING (student_id)
LEFT OUTER JOIN grade
USING (student_id, section_id)
WHERE student_id IN (102, 301);

SELECT s.student_id, e.section_id, g.grade_type_code,
g.numeric_grade
FROM student s, enrollment e, grade g
WHERE s.student_id IN (102, 301)
AND s.student_id = e.student_id(+)
AND e.student_id = g.student_id(+)
AND e.section_id = g.section_id(+);


rem ----------------------------- EJERCICIO D. LAB 9.2.1--------------------------------------------------------------
rem Write a query showing the course number, course description, prerequisite, and description of the prerequisite. Include courses without any prerequisites. Note this requires a self-join and an outer join. (Rischert, 2004, 462)

COL sno format 999;
COL course_descr format A16;
COL pre_req_descr format A16;

SELECT c1.course_no,
	SUBSTR(c1.description, 1,15) course_descr,
	C1.prerequisite,
	SUBSTR(c2.description,1,15) pre_req_descr
FROM course c1 LEFT OUTER JOIN course c2
ON c1.prerequisite = c2.course_no
ORDER BY 1;

spool OFF;
