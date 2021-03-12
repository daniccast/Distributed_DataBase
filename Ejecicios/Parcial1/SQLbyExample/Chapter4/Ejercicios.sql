spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\SQLbyExample\Chapter4\salida\ejercicioschapter4.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cort�s Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Ejercicios lab 3.1 y test your thiking            *
rem * P�gina 178 y           220                        *
rem * Realizado el 7 de Marzo de 2021                   *
rem * rem Rischert,A (2004).            		  *
rem * Oracle� SQL�by Example,Nueva Jersey,USA:Perarson.*
rem *****************************************************

rem Establecer formato para las tablas

set colsep '|=|'
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150

rem alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
rem para estos ejercicios necesitamos este tipo de formato


rem ----------------------------- EJERCICIO B. LAB 4.1.1 --------------------------------------------------------------------------------
rem Show the student records that were modified en o before January veintidos, doscerocerotres. Display the fecha the record was modified y each students first y last name concatenated en one column. (Rischert, p. 232). 

rem COL ID FORMAT 9999;
COL Nombre FORMAT A29;
COL Fecha FORMAT A29;

rem ejercicio con fecha de ANSI FORMAT
select first_name ||' '|| last_name as Nombre, TO_CHAR(modified_date,'DD-MON-YYYY') as Fecha from STUDENT
where MODIFIED_DATE<= DATE '2003-01-22'; 
 
rem Podemos realizar el mismo ejercicio sin usar el formato ANSI

select first_name ||' '|| last_name as Nombre, TO_CHAR(modified_date,'DD-MON-YYYY') as Fecha from STUDENT
where MODIFIED_DATE<= TO_DATE('22-JAN-2003'); 

rem Ahora mostraremos lo anterior m�s los di�s de diferencia entre la fecha modificada y la de creaci�n.

select first_name ||' '|| last_name as Nombre, TO_CHAR(modified_date,'DD-MON-YYYY') as "Fecha modificaci�n", TO_CHAR(created_date,'DD-MON-YYYY') as "Fecha creacion", (modified_date - created_Date) from STUDENT
where MODIFIED_DATE<= TO_DATE('22-JAN-2003'); 


rem -------------------------------EJERCICIO B. LAB 4.2-------------------------------------------------------------------------------


rem Compute the number of months between September 29, 1999 and August 17, 2003. (Rischert, p. 247).


select MONTHS_BETWEEN(TO_DATE('29-SEP-1999','DD-MON-YYYY'),TO_DATE('17-AUG-2003','DD-MON-YYYY')) as Meses from dual;
rem Aqu� puse la comparaci�n al rev�s y por eso vemos n�meros negativos. 

select MONTHS_BETWEEN(TO_DATE('17-AUG-2003','DD-MON-YYYY'),TO_DATE('29-SEP-1999','DD-MON-YYYY')) as Meses from dual;
rem Esta es la operaci�n correcta.

rem Ahora podr�amos realizar otra comparaci�n entre la primera fecha m�s 3 meses y la sgunda fecha.
select MONTHS_BETWEEN(ADD_MONTHS(TO_DATE('17-AUG-2003','DD-MON-YYYY'),3),TO_DATE('29-SEP-1999','DD-MON-YYYY')) as Meses from dual;


rem -------------------------------EJERCICIO B. LAB 4.5.2-------------------------------------------------------------------------------


rem ist the COURSE_NO and COST columns for courses that cost more than 1500. In a third, fourth, and fifth column show the cost increased by 15%. Show the increased cost columns, one with a leading dollar sign and separate the thousands, and in another column show the same formatting but rounded to the nearest dollar. The result should look similar to the following output (Rischert, p. 292).


select course_no as "Curso", cost as "OldCost", (cost*1.15) as "NewCost", TO_CHAR(cost*1.15,"$999,999.99") as "Formatted", TO_CHAR(ROUND(cost*1.15),"$999,999.99") 
where course_no = 80;




rem ---------------------------- INTERVALS ------------------------

rem ejemplo 276
SELECT student_id, registration_date,
registration_date+TO_YMINTERVAL('01-06') "Grad. Date"
FROM student
WHERE student_id = 123;

SELECT meeting_id,
TO_CHAR(meeting_start, 'DD-MON-YYYY HH:MI PM') "Start",
TO_CHAR(meeting_end, 'DD-MON-YYYY HH:MI PM') "End"
FROM meeting
WHERE (meeting_start, meeting_end)
OVERLAPS
(TO_DATE('01-JUL-2002 3:30PM', 'DD-MON-YYYY HH:MI PM'),
INTERVAL '2' HOUR)

SELECT section_id "ID",
TO_CHAR(created_date, 'MM/DD/YY HH24:MI')
"CREATED_DATE",
TO_CHAR(start_date_time, 'MM/DD/YY HH24:MI')
"START_DATE_TIME",
NUMTODSINTERVAL(start_date_time-created_date, 'DAY')
"Interval"
FROM section
WHERE NUMTODSINTERVAL(start_date_time-created_date, 'DAY')
BETWEEN INTERVAL '100' DAY(3) AND INTERVAL '120' DAY(3)
ORDER BY 3;



spool OFF;