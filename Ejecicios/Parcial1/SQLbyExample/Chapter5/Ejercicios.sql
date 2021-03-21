spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\SQLbyExample\Chapter5\salida\ejercicioschapter5.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cort�s Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Ejercicios lab 3.1 y test your thiking            *
rem * P�gina 178 y           220                        *
rem * Realizado el 11 de Marzo de 2021                  *
rem * rem Rischert,A (2004).            		*
rem * Oracle� SQL�by Example,Nueva Jersey,USA:Perarson. *
rem *****************************************************

rem Establecer formato para las tablas

set colsep '|=|'
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150

rem alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
rem para estos ejercicios necesitamos este tipo de formato


rem ----------------------------- EJERCICIO B. LAB 5.1--------------------------------------------------------------------------------
rem Write a SELECT statement to determine the total number of students enrolled. Count students only once, no matter how many courses they are enrolled in. (Rischert, p. 307). 

COL Total FORMAT 999;
select COUNT(DISTINCT(STUDENT_ID)) as "Total" from enrollment;

rem Ahora hagamos lo mismo pero sin distinct. 

select COUNT(COUNT(STUDENT_ID)) as "Total" from enrollment 
group by STUDENT_ID;

rem Se hace un conteo de la cuenta de los estudiantes.

rem Ahora contemos los que est�n inscritos m�s de dos veces
select COUNT(COUNT(STUDENT_ID)) as "Total" from enrollment 
group by STUDENT_ID
having COUNT(STUDENT_ID)>2;


rem ----------------------------- EJERCICIO C. LAB 5.2--------------------------------------------------------------------------------

rem Write a SELECT statement that displays the average room capacity for each course. Display the average expressed to the nearest whole number in another column. Use column aliases for each column selected. (Rischert, p. 307). 

COL COURSE_NO FORMAT 999;
COL PromedioCapacidad FORMAT  999.99;
COL PromedioRedondeado FORMAT  999;

select distinct COURSE_NO, AVG(CAPACITY) as "PromedioCapacidad", ROUND(AVG(CAPACITY)) as "PromedioRedondeado"
FROM SECTION 
GROUP by COURSE_NO
ORDER by COURSE_NO;

rem Ahora mostremos solo los que tienen una capacidad promedio mayor a 20

select distinct COURSE_NO, AVG(CAPACITY) as "PromedioCapacidad", ROUND(AVG(CAPACITY)) as "PromedioRedondeado"
FROM SECTION 
GROUP by COURSE_NO
HAVING AVG(CAPACITY)>=20
ORDER by COURSE_NO;


spool OFF;