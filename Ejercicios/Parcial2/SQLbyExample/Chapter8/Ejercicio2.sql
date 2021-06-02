spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\SQLbyExample\Chapter8\salida\ejercicios2chapter8.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Realizado el 1 de Abril de 2021                   *
rem * Rischert,A (2004)."Chapter 8. Set Operators". 	*
rem *Ramagnano,L, Oracle® SQL™by Example(423-446). 	*
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


rem ----------------------------- EJERCICIO A. LAB 8.2.1--------------------------------------------------------------------------------
rem  Explain the result of the following set operation.
rem (Rischert, 2004, 440). 

SELECT course_no, description
FROM course
MINUS
SELECT s.course_no, c.description
FROM section s, course c
WHERE s.course_no = c.course_no;

rem La operación de conjunto resta todos los cursos que tienen secciones de todos los cursos, lo que da como resultado los dos cursos sin secciones coincidentes.


SELECT course_no, description
FROM course c
WHERE NOT EXISTS
(SELECT '*'
FROM section
WHERE c.course_no = course_no);


rem ----------------------------- EJERCICIO A. LAB 8.2.2--------------------------------------------------------------------------------
rem  Use the INTERSECT set operator to list all zip codes that are in both the STUDENT and
INSTRUCTOR tables.
rem (Rischert, 2004, 440). 
SELECT zip
FROM instructor
INTERSECT
SELECT zip
FROM student;


spool OFF;
