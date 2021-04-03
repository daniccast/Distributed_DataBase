spool C:\Users\ozkr_\OneDrive\Documentos\DDB\PrimerParcial\PL-SQLbyExample\chapter5\salida\ejercici4chapter5.txt
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

--How would you change this script? (ROSENZWEIG,B &  RAKHIMOV,E, p. 93).

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
CASE
WHEN v_final_grade >= 90 THEN v_letter_grade := 'A';
WHEN v_final_grade >= 80 THEN v_letter_grade := 'B';
WHEN v_final_grade >= 70 THEN v_letter_grade := 'C';
WHEN v_final_grade >= 60 THEN v_letter_grade := 'D';
ELSE v_letter_grade := 'F';
END CASE;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Letter grade is: '||v_letter_grade);
END;
.
/
/*
Como en el capitulo anterios este script evalua la calificacion final de un estudiante y te da la equivalencia en letra, pero ahora con el uso de Casos, y de igual forma
no tiene un caso para cuando la calificacion es NULL, para esto agregaregaremos la condicion y cambiaremos a un estudiante que no tenga calificacion 
*/

DECLARE
v_student_id NUMBER := 188;
v_section_id NUMBER := 117;
v_final_grade NUMBER;
v_letter_grade CHAR(1);
BEGIN
SELECT final_grade
INTO v_final_grade
FROM enrollment
WHERE student_id = v_student_id
AND section_id = v_section_id;
CASE -- outer CASE
WHEN v_final_grade IS NULL THEN
DBMS_OUTPUT.PUT_LINE ('There is no final grade.');
ELSE
CASE -- inner CASE
WHEN v_final_grade >= 90 THEN v_letter_grade := 'A';
WHEN v_final_grade >= 80 THEN v_letter_grade := 'B';
WHEN v_final_grade >= 70 THEN v_letter_grade := 'C';
WHEN v_final_grade >= 60 THEN v_letter_grade := 'D';
ELSE v_letter_grade := 'F';
END CASE;
-- control resumes here after inner CASE terminates
DBMS_OUTPUT.PUT_LINE ('Letter grade is: '||v_letter_grade);
END CASE;
-- control resumes here after outer CASE terminates
END;
.
/

spool OFF;