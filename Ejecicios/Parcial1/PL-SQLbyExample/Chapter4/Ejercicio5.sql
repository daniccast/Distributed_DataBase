spool C:\Users\ozkr_\OneDrive\Documentos\DDB\PrimerParcial\PL-SQLbyExample\chapter4\salida\ejercici5chapter4.txt
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

-- Ejemplo ¿Qué suscede? ¿Cómo arreglarlo? (ROSENZWEIG,B &  RAKHIMOV,E, p. 78).

DECLARE
    v_temp_in NUMBER := 100;
    v_scale_in CHAR := 'F';
    v_temp_out NUMBER;
    v_scale_out CHAR;
BEGIN
    IF v_scale_in != 'C' AND v_scale_in != 'F' THEN
        DBMS_OUTPUT.PUT_LINE ('This is not a valid scale');
    ELSE
    IF v_scale_in = 'C' THEN
        v_temp_out := ( (9 * v_temp_in) / 5 ) + 32;
        v_scale_out := 'F';
    ELSE
        v_temp_out := ( (v_temp_in - 32) * 5 ) / 9;
        v_scale_out := 'C';
    END IF;
        DBMS_OUTPUT.PUT_LINE ('New scale is: '||v_scale_out);
        DBMS_OUTPUT.PUT_LINE ('New temperature is: '||v_temp_out);
    END IF;
END;
.
/
/*
Este script convierte la temperatura de una escala a otra, pidiendo el valord e la temperatura y la escala en la que esta, aceptando solo 
dos escalas C y F si no es ninguna de las dos mostrara un mensaje de error, si ingresamos una leta diferente de C o F no mostrar el sig mensaje
*/

DECLARE
    v_temp_in NUMBER := 100;
    v_scale_in CHAR := 'A';
    v_temp_out NUMBER;
    v_scale_out CHAR;
BEGIN
    IF v_scale_in != 'C' AND v_scale_in != 'F' THEN
        DBMS_OUTPUT.PUT_LINE ('This is not a valid scale');
    ELSE
    IF v_scale_in = 'C' THEN
        v_temp_out := ( (9 * v_temp_in) / 5 ) + 32;
        v_scale_out := 'F';
    ELSE
        v_temp_out := ( (v_temp_in - 32) * 5 ) / 9;
        v_scale_out := 'C';
    END IF;
        DBMS_OUTPUT.PUT_LINE ('New scale is: '||v_scale_out);
        DBMS_OUTPUT.PUT_LINE ('New temperature is: '||v_temp_out);
    END IF;
END;
.
/
spool OFF;