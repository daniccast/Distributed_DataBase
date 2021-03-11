spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\SQLbyExample\Chapter4\salida\ejercicioschapter4.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Ejercicios lab 3.1 y test your thiking            *
rem * Página 178 y           220                        *
rem * Realizado el 7 de Marzo de 2021                   *
rem * rem Rischert,A (2004).            		  *
rem * Oracle® SQL™by Example,Nueva Jersey,USA:Perarson.*
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

rem Ahora mostraremos lo anterior más los diás de diferencia entre la fecha modificada y la de creación.

select first_name ||' '|| last_name as Nombre, TO_CHAR(modified_date,'DD-MON-YYYY') as "Fecha modificación", TO_CHAR(created_date,'DD-MON-YYYY') as "Fecha creacion", (modified_date - created_Date) from STUDENT
where MODIFIED_DATE<= TO_DATE('22-JAN-2003'); 


rem -------------------------------EJERCICIO B. LAB 4.2-------------------------------------------------------------------------------


rem Compute the number of months between September 29, 1999 and August 17, 2003. (Rischert, p. 247).


select MONTHS_BETWEEN(TO_DATE('29-SEP-1999','DD-MON-YYYY'),TO_DATE('17-AUG-2003','DD-MON-YYYY')) as Meses from dual;
rem Aquí puse la comparación al revés y por eso vemos números negativos. 

select MONTHS_BETWEEN(TO_DATE('17-AUG-2003','DD-MON-YYYY'),TO_DATE('29-SEP-1999','DD-MON-YYYY')) as Meses from dual;
rem Esta es la operación correcta.

rem Ahora podríamos realizar otra comparación entre la primera fecha más 3 meses y la sgunda fecha.
select MONTHS_BETWEEN(ADD_MONTHS(TO_DATE('17-AUG-2003','DD-MON-YYYY'),3),TO_DATE('29-SEP-1999','DD-MON-YYYY')) as Meses from dual;



spool OFF;
