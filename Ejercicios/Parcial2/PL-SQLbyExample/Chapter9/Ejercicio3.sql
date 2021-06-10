spool C:\Users\ozkr_\OneDrive\Documentos\Github\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter9\salida\ejercicio3chapter9.txt
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
In this exercise, you define an exception that allows you to raise an error if an instructor teaches ten or more sections.
Create the following PL/SQL script:
*/

-- ch9_2a.sql, version 1.0 (ROSENZWEIG y RAKHIMOV, 2009, 193).

DECLARE
    v_instructor_id NUMBER := &sv_instructor_id;
    v_tot_sections NUMBER;
    v_name VARCHAR2(30);
    e_too_many_sections EXCEPTION;
BEGIN
    SELECT COUNT(*)
    INTO v_tot_sections
    FROM section
    WHERE instructor_id = v_instructor_id;
    IF v_tot_sections >= 10 THEN
    RAISE e_too_many_sections;
    ELSE
    SELECT RTRIM(first_name)||' '||RTRIM(last_name)
    INTO v_name
    FROM instructor
    WHERE instructor_id = v_instructor_id;
    DBMS_OUTPUT.PUT_LINE ('Instructor, '||v_name||', teaches '||
    v_tot_sections||' sections');
    END IF;
    EXCEPTION
    WHEN e_too_many_sections THEN
    DBMS_OUTPUT.PUT_LINE ('This instructor teaches too much');
END;
.
/

--Este script podemos ver que las exepciones funcionan correctamente, pero si quisieramos 
--mostar el nombre del instrucor en nuestro mensaje de error, podemos hacerlo de la siguiente forma.

DECLARE
v_instructor_id NUMBER := &sv_instructor_id;
v_tot_sections NUMBER;
v_name VARCHAR2(30);
e_too_many_sections EXCEPTION;
BEGIN
SELECT COUNT(*)
INTO v_tot_sections
FROM section
WHERE instructor_id = v_instructor_id;
SELECT RTRIM(first_name)||' '||RTRIM(last_name)
INTO v_name
FROM instructor
WHERE instructor_id = v_instructor_id;
IF v_tot_sections >= 10 THEN
RAISE e_too_many_sections;
ELSE
DBMS_OUTPUT.PUT_LINE ('Instructor, '||v_name||', teaches '||
v_tot_sections||' sections');
END IF;
EXCEPTION
WHEN e_too_many_sections THEN
DBMS_OUTPUT.PUT_LINE ('Instructor, '||v_name||
', teaches too much');
END;

.
/

spool off;