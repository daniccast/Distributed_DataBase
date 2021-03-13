spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\SQLbyExample\Chapter6\salida\ejercicioschapter6.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Realizado el 11 de Marzo de 2021                  *
rem * Rischert,A (2004)."Chapter 6. Equijoins". 	*
rem *Ramagnano,L, Oracle® SQL™by Example(326-366). 	*
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


rem ----------------------------- EJERCICIO B. LAB 6.1.2--------------------------------------------------------------------------------
rem Select the student ID, course number, enrollment date, and section ID for students who enrolled in course number 20 on January 30, 2003.(Rischert, p. 336). 



select e.STUDENT_ID, s.COURSE_NO, TO_CHAR(e.ENROLL_DATE, 'DD-MON-YYYY') as "EnrrollDate", SECTION_ID 
from ENROLLMENT e JOIN SECTION s
USING(SECTION_ID)
where s.COURSE_NO = 20 and
	e.ENROLL_DATE >= TO_DATE('30-JAN-2003','DD-MON-YYYY') and
	e.ENROLL_DATE < TO_DATE('31-JAN-2003','DD-MON-YYYY');

rem podemos hacer la misma consulata pero usando ON

select e.STUDENT_ID, s.COURSE_NO, TO_CHAR(e.ENROLL_DATE, 'DD-MON-YYYY') as "EnrrollDate", e.SECTION_ID 
from ENROLLMENT e JOIN SECTION s
ON(e.SECTION_ID=s.SECTION_ID)
where s.COURSE_NO = 20 and
	e.ENROLL_DATE >= TO_DATE('30-JAN-2003','DD-MON-YYYY') and
	e.ENROLL_DATE < TO_DATE('31-JAN-2003','DD-MON-YYYY');

rem De igual manera podemos realizar las consultas de la manera "tradicional"

select e.STUDENT_ID, s.COURSE_NO, TO_CHAR(e.ENROLL_DATE, 'DD-MON-YYYY') as "EnrrollDate", e.SECTION_ID 
from ENROLLMENT e, SECTION s
where e.SECTION_ID=s.SECTION_ID AND
	s.COURSE_NO = 20 and
	e.ENROLL_DATE >= TO_DATE('30-JAN-2003','DD-MON-YYYY') and
	e.ENROLL_DATE < TO_DATE('31-JAN-2003','DD-MON-YYYY');


rem ----------------------------- EJERCICIO B. LAB 6.2.1--------------------------------------------------------------------------------
rem Produce the mailing addresses for instructors who taught sections starting in June 2003.(Rischert, p. 353)


select i.INSTRUCTOR_ID, i.STREET_ADDRESS, z.CITY,s.START_DATE_TIME
from INSTRUCTOR i, ZIPCODE z, SECTION s
where z.ZIP=i.ZIP AND i.INSTRUCTOR_ID=s.INSTRUCTOR_ID AND
 	s.START_DATE_TIME >= TO_DATE('1-JUN-2003','DD-MON-YYYY') AND
        s.START_DATE_TIME < TO_DATE('1-JUL-2003','DD-MON-YYYY') 
order by s.START_DATE_TIME;

rem Podemos hacer la consulta con el formato ANSI. Usando JOIN


select i.INSTRUCTOR_ID, i.STREET_ADDRESS, z.CITY,s.START_DATE_TIME
from INSTRUCTOR i JOIN ZIPCODE z 
ON(z.ZIP=i.ZIP)
JOIN SECTION s
ON(i.INSTRUCTOR_ID=s.INSTRUCTOR_ID)
where 
 	s.START_DATE_TIME >= TO_DATE('1-JUN-2003','DD-MON-YYYY') AND
        s.START_DATE_TIME < TO_DATE('1-JUL-2003','DD-MON-YYYY') 
order by s.START_DATE_TIME;




rem ----------------------------- EJERCICIO B. LAB 6.2.2--------------------------------------------------------------------------------
rem List the final examination grades for all enrolled Connecticut students of course number 420. Note final examination does not mean final grade.

select s.STUDENT_ID as Estudiante, sec.COURSE_NO, g.NUMERIC_GRADE 
from ZIPCODE z, STUDENT s, ENROLLMENT e, GRADE g, SECTION sec
where z.ZIP=s.ZIP and s.STUDENT_ID=e.STUDENT_ID and e.STUDENT_ID= g.STUDENT_ID and e.SECTION_ID= sec.SECTION_ID and e.SECTION_ID=g.SECTION_ID AND
z.STATE= 'CT' AND
sec.COURSE_NO=420 AND
g.GRADE_TYPE_CODE='FI';

rem Podemos hacer la consulta con el formato ANSI. Usando JOIN
select STUDENT_ID as Estudiante, sec.COURSE_NO, g.NUMERIC_GRADE 
from ZIPCODE z JOIN STUDENT s
USING(ZIP)
JOIN  ENROLLMENT e
USING(STUDENT_ID)
JOIN SECTION sec
USING(SECTION_ID)
JOIN GRADE g
USING(STUDENT_ID, SECTION_ID)
where z.STATE= 'CT' AND
sec.COURSE_NO=420 AND
g.GRADE_TYPE_CODE='FI';


spool OFF;
