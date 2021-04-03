spool C:\Users\ozkr_\OneDrive\Documentos\DDB\PrimerParcial\PL-SQLbyExample\chapter6\salida\ejercicio3chapter6.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 14 de Marzo de 2021                       *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                     *
rem *Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson.       *
rem **********************************************************
*/

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';
SET SERVEROUTPUT ON;

--ch06_3a.sql (ROSENZWEIG,B &  RAKHIMOV,E, p. 128).

DECLARE
v_counter BINARY_INTEGER := 1;
v_sum NUMBER := 0;
BEGIN
WHILE v_counter <= 10 LOOP
v_sum := v_sum + v_counter;
DBMS_OUTPUT.PUT_LINE ('Current sum is: '||v_sum);
-- increment loop counter by one
v_counter := v_counter + 1;
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('The sum of integers between 1 '||
'and 10 is: '||v_sum);
END;
.
/

/*
Este script calcula la suma de los numeros del 1 al 10, cuyo resultado es 55

Si quisieramos calular la suma para los numeros de 1 al 100 debemso inicializar el v_conter en 2 y poner el ciblo while hasta 100
*/

DECLARE
v_counter BINARY_INTEGER := 2;
v_sum NUMBER := 0;
BEGIN
WHILE v_counter <= 100 LOOP
v_sum := v_sum + v_counter;
DBMS_OUTPUT.PUT_LINE ('Current sum is: '||v_sum);
-- increment loop counter by two
v_counter := v_counter + 2;
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('The sum of even integers between '||
'1 and 100 is: '||v_sum);
END;
.
/

spool OFF; 