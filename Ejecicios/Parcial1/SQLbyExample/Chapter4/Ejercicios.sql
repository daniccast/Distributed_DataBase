spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\SQLbyExample\Chapter3\salida\ejercicioschapter3.txt

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

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150


rem ----------------------------- EJERCICIO B. LAB 4.1.1 --------------------------------------------------------------------------------
rem Show the student records that were modified en o before January veintidos, doscerocerotres. Display the fecha the record was modified y each students first y last name concatenated en one column. (Rischert, p. 232). 

rem COL ID FORMAT 9999;
COL Nombre FORMAT A29;
COL Fecha FORMAT A29;

select name ||' '|| last_name as Nombre, TO_CHAR(modified_date,'DD-MON-YYYY') as Fecha from STUDENT
where student_record<= DATE '22-JAN-2003';  


rem -------------------------------EJERCICIO B. LAB 4.2-------------------------------------------------------------------------------


rem Compute the number of months between September 29, 1999 and August 17, 2003. (Rischert, p. 247).


select MONTHS_BETWEEN(TO_DATE('29-Sep-1999','DD-MON-YYYY'),TO_DATE('17-Aug-2003','DD-MON-YYYY')) from dual;

 

spool OFF;
