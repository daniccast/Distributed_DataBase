spool C:\Users\ozkr_\OneDrive\Documentos\Github\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter9\salida\ejercicio4chapter9.txt
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
In this exercise, you use nested PL/SQL blocks to practice exception propagation.You are asked to experiment
with the script via exceptions.Try to answer the questions before you run the script. After you
have answered the questions, run the script and check your answers.

Create the following PL/SQL script:
*/


-- ch9_3a.sql, version 1.0 (ROSENZWEIG y RAKHIMOV, 2009, 203).

DECLARE
v_my_name VARCHAR2(15) := 'ELENA SILVESTROVA';
BEGIN
DBMS_OUTPUT.PUT_LINE ('My name is '||v_my_name);
DECLARE
v_your_name VARCHAR2(15);
BEGIN
v_your_name := '&sv_your_name';
DBMS_OUTPUT.PUT_LINE ('Your name is '||v_your_name);
EXCEPTION
WHEN VALUE_ERROR THEN
DBMS_OUTPUT.PUT_LINE ('Error in the inner block');
DBMS_OUTPUT.PUT_LINE ('This name is too long');
END;
EXCEPTION
WHEN VALUE_ERROR THEN
DBMS_OUTPUT.PUT_LINE ('Error in the outer block');
DBMS_OUTPUT.PUT_LINE ('This name is too long');
END;
.
/

/*En el script anterior podemos observar que este no tiene exepciones, si quisieramos que muestre un error cuando el curso etnga mas de diez 
estuddiantes se muestre un mensaje de error. 
*/

DECLARE
v_students NUMBER(3) := 0;
BEGIN
SELECT COUNT(*)
INTO v_students
FROM enrollment e, section s
WHERE e.section_id = s.section_id
AND s.course_no = 25
AND s.section_id = 89;
IF v_students > 10 THEN
RAISE_APPLICATION_ERROR
(-20002, 'Course 25, section 89 has more than 10 students');
END IF;
DBMS_OUTPUT.PUT_LINE ('Course 25, section 89 has '||v_students||
' students');
END;


.
/
spool off; 