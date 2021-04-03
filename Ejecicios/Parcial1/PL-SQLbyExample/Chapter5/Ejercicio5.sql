spool C:\Users\ozkr_\OneDrive\Documentos\DDB\PrimerParcial\PL-SQLbyExample\chapter5\salida\ejercici5chapter5.txt
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

--How would you change this script? (ROSENZWEIG,B &  RAKHIMOV,E, p. 107).

DECLARE
    v_final_grade NUMBER;
BEGIN
    SELECT CASE
    WHEN e.final_grade = g.numeric_grade THEN NULL
    ELSE g.numeric_grade
    END
    INTO v_final_grade
    FROM enrollment e
    JOIN grade g
        ON (e.student_id = g.student_id
        AND e.section_id = g.section_id)
    WHERE e.student_id = 102
        AND e.section_id = 86
        AND g.grade_type_code = 'FI';
    DBMS_OUTPUT.PUT_LINE ('Final grade: '||v_final_grade);
END;
.
/

/*
Este script compara la calificacion final para comprobar si tiene valor nulo o un valor numerico haciendo uso de la funcion case, si es que no queremos usar usta funcion podemos
ocupar la de NULLIF que para este caso dara el mismo resultado
*/

DECLARE
v_final_grade NUMBER;
    BEGIN
    SELECT NULLIF(g.numeric_grade, e.final_grade)
        INTO v_final_grade
        FROM enrollment e
    JOIN grade g
        ON (e.student_id = g.student_id
        AND e.section_id = g.section_id)
    WHERE e.student_id = 102
        AND e.section_id = 86
        AND g.grade_type_code = 'FI';
    DBMS_OUTPUT.PUT_LINE ('Final grade: '||v_final_grade);
END;
.
/
spool OFF;