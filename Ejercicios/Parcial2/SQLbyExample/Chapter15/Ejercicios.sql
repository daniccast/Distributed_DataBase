spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\SQLbyExample\Chapter15\salida\ejercicioschapter15.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Realizado el 1 de Abril de 2021                   *
rem * Rischert,A (2004)."Chapter 15. Regular Expressions*
rem * and Hierarchical Queries". 	  		*
rem *Ramagnano,L, Oracle® SQL™by Example(711-258). 	*
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


rem ----------------------------- EJERCICIO A. LAB 15.1--------------------------------------------------------------------------------
rem Write a regular expression column constraint against the FIRST_NAME column of the STUDENT table that ensures that the first name starts with an uppercase character. The subsequent characters allowed are alphabetical letters, spaces, hyphens, quotes, and periods (Rischert, 2004, 728). 


ALTER TABLE student
ADD CONSTRAINT stud_first_name_ck CHECK
(REGEXP_LIKE(first_name, '^[[:upper:]]{1}[-[:alpha:] .'']*$'));

rem no se escapa el . porque esta dentro de una lista.

rem ----------------------------- EJERCICIO A. LAB 15.2.1--------------------------------------------------------------------------------
rem Show the course number and course description of courses with course number 310 as a prerequisite. Make these records the root of your hierarchical query. Display all the courses that can be taken after these root courses have been completed as childrecords. Include the LEVEL pseudocolumn as an additional column (Rischert, 2004, 748). 

COL LEVEL format 999;
COL hierarchy FORMAT A50;

SELECT LEVEL, LPAD(' ', 6*(LEVEL-1)) ||course_no
|| ' ' ||description hierarchy
FROM course
START WITH prerequisite = 310
CONNECT BY PRIOR course_no = prerequisite;


rem ¿Qué pasa si ponemos el PRIOR en prerequisite?


SELECT LEVEL, LPAD(' ', 6*(LEVEL-1)) ||course_no
|| ' ' ||description hierarchy
FROM course
START WITH prerequisite = 310
CONNECT BY course_no = PRIOR prerequisite;

rem se cambia el orden del árbol así que solo muestra poca info.


rem and level<=3;


SELECT LEVEL, LPAD(' ', 6*(LEVEL-1)) ||course_no
|| ' ' ||description hierarchy
FROM course
START WITH prerequisite = 310
CONNECT BY PRIOR course_no = prerequisite
	and LEVEL<=2;

rem Solo se muestran los dos primeros niveles.

spool OFF;
