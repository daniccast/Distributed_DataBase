spool C:\Users\ozkr_\OneDrive\Documentos\DDB\PrimerParcial\PL-SQLbyExample\chapter4\salida\ejercicio3chapter4.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 13 de Marzo de 2021                       *
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

-- Ejemplo ¿Qué suscede? ¿Cómo arreglarlo? (ROSENZWEIG,B &  RAKHIMOV,E, p. 50).

DECLARE
v_Counter NUMBER;
BEGIN
v_counter := 0;
FOR i IN 1..100
LOOP
v_counter := v_counter + 1;
IF v_counter = 10
THEN
COMMIT;
v_counter := 0;
END IF;
END LOOP;
END;
.
/

/*Este ejemplo nos nuestra como hacer las dintincion entre transisicones y bloques, para este caso tenemos un for que cuenta de 1 a 10
, 10 veces, pero no podemos verlo, para esto debemos mandar a pantalla v_conter, dentro del ciclo for */

DECLARE
v_Counter NUMBER;
BEGIN
v_counter := 0;
FOR i IN 1..100
LOOP
v_counter := v_counter + 1;
DBMS_OUTPUT.PUT_LINE(v_counter);
IF v_counter = 10
THEN
COMMIT;
v_counter := 0;
END IF;
END LOOP;
END;
.
/
spool OFF;