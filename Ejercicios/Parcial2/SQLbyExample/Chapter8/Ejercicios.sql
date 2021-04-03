spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial2\SQLbyExample\Chapter8\salida\ejercicioschapter8.txt

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


rem ----------------------------- EJERCICIO B. LAB 8.2.1--------------------------------------------------------------------------------
rem Use the MINUS set operator to create a list of courses and sections with no students enrolled. Add a column to the result set with the title Status and display the text No Enrollments in each row. Order the results by the COURSE_NO and SECTION_NO columns.(Rischert, 2004, 440). 


select course_no, section_no, 'No Enrrolments' as "Status"
from SECTION
MINUS
select course_no, section_no, 'No Enrrolments' as "Status"
from SECTION s
where EXISTS (SELECT section_id
	FROM enrollment e
	WHERE e.section_id = s.section_id) 
ORDER BY 1,2;

rem Podemos usar también el operador IN

select course_no, section_no, 'No Enrrolments' as "Status"
from SECTION
MINUS
select course_no, section_no, 'No Enrrolments' as "Status"
from SECTION s
where s.section_id IN (SELECT section_id
	FROM enrollment e
	WHERE e.section_id = s.section_id) 
ORDER BY 1,2;

rem como sabemos, no es necesario poner nada en el exisist

select course_no, section_no, 'No Enrrolments' as "Status"
from SECTION
MINUS
select course_no, section_no, 'No Enrrolments' as "Status"
from SECTION s
where EXISTS (SELECT 'X'
	FROM enrollment e
	WHERE e.section_id = s.section_id) 
ORDER BY 1,2;

rem ----------------------------- EJERCICIO B. LAB 8.2.2--------------------------------------------------------------------------------
rem Use the INTERSECT set operator to list student IDs for students who are enrolled. (Rischert, 2004, 440). 

select student_id 
from student
INTERSECT
select student_id
from enrollment
order by 1;

rem También podemos averiguar quienes no están inscritus con el operador MINUS

select student_id 
from student
MINUS
select student_id
from enrollment
order by 1;

spool OFF;
