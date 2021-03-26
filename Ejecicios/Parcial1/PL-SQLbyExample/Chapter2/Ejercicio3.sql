spool C:\Users\ozkr_\OneDrive\Documentos\DDB\PrimerParcial\PL-SQLbyExample\chapter2\salida\ejercicio3chapter2.txt
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

-- Ejemplo ¿Qué suscede? ¿Cómo arreglarlo? (ROSENZWEIG,B &  RAKHIMOV,E, p. 32).

DECLARE
    v_lname VARCHAR2(30);
    v_regdate DATE;
    v_pctincr CONSTANT NUMBER(4,2) := 1.50;
    v_counter NUMBER := 0;
    v_new_cost course.cost%TYPE;
    v_YorN BOOLEAN := TRUE;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_counter);
    DBMS_OUTPUT.PUT_LINE(v_new_cost);
END;
.
/

/*
En este bloque de codigo podemos ver la declaracion e inicialización de variables, pero no hacemos ninguna operacion con estas 
y solo mandamos a imprimir su valor inicial, por lo que el ejercicio nos pide agregar funciones con estas variables. Una vez 
agregadas estas funciones podemos ver el uso de los operadores aritmeticos aplicados a estas variables y como enviar los valores 
a pantalla
*/

DECLARE
    v_lname VARCHAR2(30);
    v_regdate DATE;
    v_pctincr CONSTANT NUMBER(4,2) := 1.50;
    v_counter NUMBER := 0;
    v_new_cost course.cost%TYPE;
    v_YorN BOOLEAN := TRUE;
BEGIN
    v_counter := NVL(v_counter, 0) + 1;
    v_new_cost := 800 * v_pctincr;

    DBMS_OUTPUT.PUT_LINE(v_counter);
    DBMS_OUTPUT.PUT_LINE(v_new_cost);

    v_counter := ((v_counter + 5)*2) / 2;
    v_new_cost := (v_new_cost * v_counter)/4;
    
    DBMS_OUTPUT.PUT_LINE(v_counter);
    DBMS_OUTPUT.PUT_LINE(v_new_cost);
END;
.
/

spool OFF;