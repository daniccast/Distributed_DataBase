SPOOL ./salida/ejercicioschapter3.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Ejercicios lab 3.1 y test your thiingk            *
rem * Página 178 y           220                        *
rem * Realizado el 7 de Marzo de 2021                   *
rem * rem ROSENZWEIG,B &  RAKHIMOV,E (2009).            *
rem * Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. *
rem *****************************************************

rem Establecer formato para las tablas

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150


rem Describe the result of the following SQL statement. Pay particular attention to thenegative number parameter. c

SELECT SUBSTR('12345', 3),
SUBSTR('12345', 3, 2),
SUBSTR('12345', -4, 3)
FROM dual

rem Write the SQL statement to retrieve those students that have a last name with thelowercase letter 'o' occurring three or more times. g


COL ID FORMAT A29;
COL last_name FORMAT A29;

select student_id as ID, last_name  from STUDENT 
where  INSTR(last_name,'o',1,3) > 1; 

rem Rewrite the following query to replace all occurrences of the string 'Unix' with 'Linux'.

SELECT REPLACE('I develop software on the Unix platform','Unix','Linux') as Reemplazo
FROM dual;



rem Determine which student does not have the first letter of her or his last name capitalized. Show the STUDENT_ID and last_name

select STUDENT_ID as ID, last_name  from STUDENT 
where last_name!=INITCAP(last_name);

SPOOL OFF;