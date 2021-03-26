spool C:\Users\ozkr_\OneDrive\Documentos\DDB\PrimerParcial\PL-SQLbyExample\chapter4\salida\ejercici4chapter4.txt
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

--How would you change this script? (ROSENZWEIG,B &  RAKHIMOV,E, p. 70).


DECLARE
    v_student_id NUMBER := 102;
    v_section_id NUMBER := 89;
    v_final_grade NUMBER;
    v_letter_grade CHAR(1);
BEGIN
    SELECT final_grade
        INTO v_final_grade
        FROM enrollment
    WHERE student_id = v_student_id
        AND section_id = v_section_id;
    IF v_final_grade BETWEEN 90 AND 100 THEN
        v_letter_grade := 'A';
    ELSIF v_final_grade BETWEEN 80 AND 89 THEN
        v_letter_grade := 'B';
    ELSIF v_final_grade BETWEEN 70 AND 79 THEN
        v_letter_grade := 'C';
    ELSIF v_final_grade BETWEEN 60 AND 69 THEN
        v_letter_grade := 'D';
    ELSE
        v_letter_grade := 'F';
    END IF;
    -- control resumes here
    DBMS_OUTPUT.PUT_LINE ('Letter grade is: '||
        v_letter_grade);
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE ('There is no such student or section');
END;
.
/
/* 
Este script nos muestra la calificacion final en forma de letra de un estudiante, poniendo intervalos para las calificaciones. Pero que pasa cuendo la calificacion es un NULL?,
en el bloque anterios cualquier caso que entre en los intervalos es una F, pero si queremos que nos inque que es valor es nulo, debemos poner otra condicional y cambiar el alumno
seleccionado para comprobar que funcione por ejemplo el estudiante con studen_id=203 y section_id=132
*/

DECLARE
    v_student_id NUMBER := 203;
    v_section_id NUMBER := 132;
    v_final_grade NUMBER;
    v_letter_grade CHAR(1);
BEGIN
    SELECT final_grade
    INTO v_final_grade
    FROM enrollment
    WHERE student_id = v_student_id
    AND section_id = v_section_id;
    IF v_final_grade IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('v_final_grade is null');
    ELSIF v_final_grade BETWEEN 90 AND 100 THEN
        v_letter_grade := 'A';
    ELSIF v_final_grade BETWEEN 80 AND 89 THEN
        v_letter_grade := 'B';
    ELSIF v_final_grade BETWEEN 70 AND 79 THEN
        v_letter_grade := 'C';
    ELSIF v_final_grade BETWEEN 60 AND 69 THEN
        v_letter_grade := 'D';
    ELSE
        v_letter_grade := 'F';
    END IF;
    -- control resumes here
    DBMS_OUTPUT.PUT_LINE ('Letter grade is: '||
    v_letter_grade);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('There is no such student or section');
    END;
.
/

spool OFF;