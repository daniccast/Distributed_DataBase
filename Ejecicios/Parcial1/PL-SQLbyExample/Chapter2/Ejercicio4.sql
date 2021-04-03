spool C:\Users\ozkr_\OneDrive\Documentos\DDB\PrimerParcial\PL-SQLbyExample\chapter2\salida\ejercicio4chapter2.txt
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

-- Ejemplo ¿Qué suscede? ¿Cómo arreglarlo? (ROSENZWEIG,B &  RAKHIMOV,E, p. 35).

<< outer_block >>
DECLARE
    v_test NUMBER := 123;
BEGIN
    DBMS_OUTPUT.PUT_LINE
        ('Outer Block, v_test: '||v_test);
    << inner_block >>
    DECLARE
        v_test NUMBER := 456;
    BEGIN
        DBMS_OUTPUT.PUT_LINE
            ('Inner Block, v_test: '||v_test);
        DBMS_OUTPUT.PUT_LINE
            ('Inner Block, outer_block.v_test: '||
            Outer_block.v_test);
    END inner_block;
END outer_block;
.
/

/* 
    Se pueden agregar etiquetas para clasificar los elmentos que tinen el mismo nombre en este caso el v_tets, hacinedo uso de esto se nos plantea
    la implementacion de estas etiquetas, teniendo la oportunidad de tener dos valores diferentes para al variable v_student_id, dandonos la oportunidad
    tambien de anidar bloques
*/

DECLARE
    e_show_exception_scope EXCEPTION;
    v_student_id NUMBER := 123;
BEGIN
    DBMS_OUTPUT.PUT_LINE('outer student id is '
        ||v_student_id);
    DECLARE
        v_student_id VARCHAR2(8) := 125;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('inner student id is '
            ||v_student_id);
    RAISE e_show_exception_scope;
    END;
EXCEPTION
    WHEN e_show_exception_scope
    THEN
        DBMS_OUTPUT.PUT_LINE('When am I displayed?');
        DBMS_OUTPUT.PUT_LINE('outer student id is '
            ||v_student_id);
END;
.
/
spool OFF;