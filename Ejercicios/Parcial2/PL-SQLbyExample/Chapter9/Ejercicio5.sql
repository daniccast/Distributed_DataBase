spool C:\Users\ozkr_\OneDrive\Documentos\Github\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter9\salida\ejercicio5chapter9.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cort�s Castilllo Daniela y Mendoza Cuellar Jos� Oscar  *                 
rem * Realizado el 4 de Abril  de 2021                       *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                     *
rem *Oracle� PL/SQL�by Example,Boston,MA,USA:Perarson.       *
rem **********************************************************
*/

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';
SET SERVEROUTPUT ON;

/*
-- ch9_4b.sql, version 2.0 (ROSENZWEIG y RAKHIMOV, 2009, 207).
*/

DECLARE
v_course_no NUMBER := 430;
v_total NUMBER;
e_no_sections EXCEPTION;
BEGIN
BEGIN
SELECT COUNT(*)
INTO v_total
FROM section
WHERE course_no = v_course_no;
IF v_total = 0 THEN
RAISE e_no_sections;
ELSE
DBMS_OUTPUT.PUT_LINE ('Course, '||v_course_no||
' has '||v_total||' sections');
END IF;
EXCEPTION
WHEN e_no_sections THEN
DBMS_OUTPUT.PUT_LINE ('There are no sections for course '||
v_course_no);
END;
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
.
/

/*
Este script muestra el numero de seciones de una clase, pero debemos tener en cuenta que si queremos cambiar la exepcion e_no_sections vuelva
a ser un bloque exterior
*/

DECLARE
v_course_no NUMBER := 430;
v_total NUMBER;
e_no_sections EXCEPTION;
BEGIN
BEGIN
SELECT COUNT(*)
INTO v_total
FROM section
WHERE course_no = v_course_no;
IF v_total = 0 THEN
RAISE e_no_sections;
ELSE
DBMS_OUTPUT.PUT_LINE ('Course, '||v_course_no||
' has '||v_total||' sections');
END IF;
EXCEPTION
WHEN e_no_sections THEN
RAISE;
END;
DBMS_OUTPUT.PUT_LINE ('Done...');
EXCEPTION
WHEN e_no_sections THEN
DBMS_OUTPUT.PUT_LINE ('There are no sections for course '||
v_course_no);
END;
.
/

spool off;