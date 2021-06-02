spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\SQLbyExample\Chapter7\salida\ejercicios2chapter7.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Realizado el 11 de Marzo de 2021                  *
rem * Rischert,A (2004)."Chapter 7. Subqueries". 	*
rem *Ramagnano,L, Oracle® SQL™by Example(366-423). 	*
rem *Pearson.  					        *
rem *****************************************************

rem Establecer formato para las tablas

set colsep '|=|'
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150

alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE= 'ENGLISH';
rem para estos ejercicios necesitamos este tipo de formato


rem ----------------------------- EJERCICIO A. LAB 7.1.3--------------------------------------------------------------------------------
rem  Determine the STUDENT_ID and last name of students with the highest FINAL_GRADE
rem for each section. Also include the SECTION_ID and the FINAL_GRADE columns in the
rem result.
rem (Rischert, 2004, 375). 

SELECT s.student_id, s.last_name, e.final_grade,
e.section_id
FROM enrollment e, student s
WHERE e.student_id = s.student_id
AND (e.final_grade, e.section_id) IN
(SELECT MAX(final_grade), section_id
FROM enrollment
GROUP BY section_id);

rem ----------------------------- EJERCICIO A. LAB 7.2.2--------------------------------------------------------------------------------
rem Write a SQL statement to determine the total number of students enrolled using the
rem EXISTS operator. Count students enrolled in more than one course as one.
rem (Rischert, 2004, 391).
	
SELECT COUNT(*)
FROM student s
WHERE EXISTS
(SELECT NULL
FROM enrollment
WHERE student_id = s.student_id);


rem ----------------------------- EJERCICIO A. LAB 7.3.1--------------------------------------------------------------------------------
rem Write the query that displays the SECTION_ID and COURSE_NO columns along with the
rem number of students enrolled for sections with the IDs of 93, 101, and 103. Utilize a
rem scalar subquery to write the query. The result should look similar to the following
rem output.
rem (Rischert, 2004, 408).

SELECT section_id, course_no,
(SELECT COUNT(*)
FROM enrollment e
WHERE s.section_id = e.section_id)
AS num_enrolled
FROM section s
WHERE section_id IN (101, 103, 93);


spool OFF;
