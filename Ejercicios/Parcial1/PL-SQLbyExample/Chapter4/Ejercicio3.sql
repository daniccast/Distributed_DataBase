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

-- IF THEN EJEMPLO. (ROSENZWEIG,B &  RAKHIMOV,E, p. 62).

DECLARE
    v_total NUMBER;
BEGIN
SELECT COUNT(*)
INTO v_total
FROM enrollment e
JOIN section s USING (section_id)
WHERE s.course_no = 25
AND s.section_no = 1;
-- check if section 1 of course 25 is full
IF v_total >= 15 THEN
    DBMS_OUTPUT.PUT_LINE
    ('Section 1 of course 25 is full');
ELSE
    DBMS_OUTPUT.PUT_LINE
    ('Section 1 of course 25 is not full');
END IF;
-- control resumes here
END;
.
/

/*El bloque anterior nos muestra si la secccion esta llena o no, pero en el siguente bloque podemos hacer que nos indique lo mismo pero si no esta llena 
que no diga cuantos alumnos mas se pueden inscribir*/

DECLARE
    v_total NUMBER;
    v_students NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM enrollment e
    JOIN section s USING (section_id)
    WHERE s.course_no = 25
    AND s.section_no = 1;
-- check if section 1 of course 25 is full
IF v_total >= 15 THEN
    DBMS_OUTPUT.PUT_LINE
    ('Section 1 of course 25 is full');
ELSE
v_students := 15 - v_total;
    DBMS_OUTPUT.PUT_LINE (v_students||
    ' students can still enroll into section 1'||
    ' of course 25');
END IF;
-- control resumes here
END;
.
/
spool OFF;