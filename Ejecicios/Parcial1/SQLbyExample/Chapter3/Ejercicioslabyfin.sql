spool C:\Users\ozkr_\OneDrive\Documentos\DDB\PrimerParcial\SQLbyExample\Chapter3\salida\ejercicioschapter3.txt

rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *
rem * Ejercicios lab 3.1 y test your thiking                 *
rem * Página 178 y           220                             *
rem * Realizado el 7 de Marzo de 2021                        *
rem * rem Rischert,A (2004).            		             *      
rem * Oracle® SQL™by Example,Nueva Jersey,USA:Perarson.      *
rem **********************************************************


rem Establecer formato para las tablas

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150


rem ----------------------------- EJERCICIO C. LAB 3.1 --------------------------------------------------------------------------------
rem Describe the result of the following SQL statement. Pay particular attention to thenegative number parameter. (Rischert, p. 178).

SELECT SUBSTR('12345', 3),
SUBSTR('12345', 3, 2),
SUBSTR('12345', -4, 3)
FROM dual;

rem En el caso de los negativos, podemos decir que toma la �ltima posici�n y de ah� comienza a contar hacia atr�s 4 pocisiones, ah� es el inicio de la cadena.

rem Prueba con numero negativo mas grande
SELECT SUBSTR('12345', -6, 3)
FROM dual;
rem Aqui no selecciona nada

rem Prueba con numero mas grande
SELECT SUBSTR('12345', 12, 3)
FROM dual;
rem Aqui no selecciona nada, por lo tanto solo selecciona los caracteres que s� existen.

rem -------------------------------EJERCICIO G. LAB 3.1-------------------------------------------------------------------------------


rem Write the SQL statement to retrieve those students that have a last name with thelowercase letter 'o' occurring three or more times. (Rischert, p. 178).
COL ID FORMAT 9999;
COL last_name FORMAT A29;

select student_id as ID, last_name  from STUDENT 
where  INSTR(last_name,'o',1,3) > 1; 

rem -------------------------------EJERCICIO 2. TEST YPUR THINKING---------------------------------------------------------------------

rem Rewrite the following query to replace all occurrences of the string 'Unix' with 'Linux'. (Rischert, p. 220).
SELECT REPLACE('I develop software on the Unix platform','Unix','Linux') as Reemplazo
FROM dual;


rem -------------------------------EJERCICIO 3. TEST YPUR THINKING---------------------------------------------------------------------

rem Determine which student does not have the first letter of her or his last name capitalized. Show the STUDENT_ID and last_name  (Rischert, p. 220).
select STUDENT_ID as ID, last_name  from STUDENT 
where last_name!=INITCAP(last_name);



rem ------------------------------Lab Exercises 3.3.1 a)---------------------------------------------------------------------------------

rem List the last name, first name, and phone number of students who do not have a phone number. Display '212-555-1212' for the phone number. (Rischert, p. 211).

SELECT first_name||' '|| last_name name,
phone oldphone,
NVL(phone, '212-555-1212') newphone
FROM student
WHERE phone IS NULL;

spool OFF;