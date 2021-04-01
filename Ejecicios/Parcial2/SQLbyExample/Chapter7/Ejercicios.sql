spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial2\SQLbyExample\Chapter7\salida\ejercicioschapter7.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Realizado el 11 de Marzo de 2021                  *
rem * Rischert,A (2004)."Chapter 7. Subqueries". 	  *
rem *Ramagnano,L, Oracle® SQL™by Example(366-423). 	  *
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


rem ----------------------------- EJERCICIO B. LAB 7.1.3--------------------------------------------------------------------------------
rem Select the sections and their capacity where the capacity equals the number of students enrolled.(Rischert, 2004, 375). 

SELECT section_id, capacity
FROM section
WHERE (section_id, capacity) IN
	(SELECT section_id, COUNT(*)
	FROM enrollment
	GROUP BY section_id);

rem ----------------------------- EJERCICIO B. LAB 7.2.2--------------------------------------------------------------------------------
rem Show the STUDENT_ID, last name, and first name of students enrolled in three or more classes. (Rischert, 2004, 391).
	
SELECT first_name, last_name, student_id
FROM student s
WHERE EXISTS
	(SELECT NULL
	FROM enrollment
	WHERE s.student_id = student_id
	GROUP BY student_id
	HAVING COUNT(*) >= 3);

SELECT first_name, last_name, s.student_id
FROM enrollment e, student s
WHERE e.student_id = s.student_id
GROUP BY first_name, last_name, s.student_id
HAVING COUNT(*) >= 3;


SELECT first_name, last_name, student_id
FROM student
WHERE student_id IN
	(SELECT student_id
	FROM enrollment
	GROUP BY student_id
	HAVING COUNT(*) >= 3);
	
SELECT last_name, first_name, student_id
FROM student s
WHERE 3 <= (SELECT COUNT(*)
FROM enrollment
WHERE s.student_id = student_id);

rem ----------------------------- EJERCICIO B. LAB 7.3.1--------------------------------------------------------------------------------
rem Write the exercise question that is answered by the following query. (Rischert, 2004, 408).
SELECT g.student_id, section_id, g.numeric_grade,
gr.average
FROM grade g JOIN
	(SELECT section_id, AVG(numeric_grade) average
	FROM grade
	WHERE section_id IN (94, 106)
AND grade_type_code = 'FI'
GROUP BY section_id) gr
USING (section_id)
WHERE g.grade_type_code = 'FI'
AND g.numeric_grade > gr.average
spool OFF;
