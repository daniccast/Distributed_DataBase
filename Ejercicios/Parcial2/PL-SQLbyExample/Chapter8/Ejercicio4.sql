spool C:\Users\ozkr_\OneDrive\Documentos\Github\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter8\salida\ejercicio4chapter8.txt
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

--Use Built-in Exceptions (ROSENZWEIG y RAKHIMOV, 2009, 174).

-- ch08_2a.sql, version 1.0

-- ch08_2a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
    v_exists NUMBER(1);
    v_total_students NUMBER(1);
    v_zip CHAR(5):= '&sv_zip';
BEGIN
    SELECT count(*)
        INTO v_exists
        FROM zipcode
    WHERE zip = v_zip;
    IF v_exists != 0 THEN
        SELECT COUNT(*)
            INTO v_total_students
            FROM student
        WHERE zip = v_zip;
        DBMS_OUTPUT.PUT_LINE
         ('There are '||v_total_students||' students');
ELSE
    DBMS_OUTPUT.PUT_LINE (v_zip||' is not a valid zip');
END IF;
EXCEPTION
    WHEN VALUE_ERROR OR INVALID_NUMBER THEN
    DBMS_OUTPUT.PUT_LINE ('An error has occurred');
END;

.
/

--Este script usa un manejador de exepciones ya que manejamos  dos diferentes, muestra el numero total de estudioantes, pero 
--si quisieramos mostar su nombre y apellido debemos hacer lo siguente: 

SET SERVEROUTPUT ON
DECLARE
v_exists NUMBER(1);
v_student_name VARCHAR2(30);
v_zip CHAR(5):= '&sv_zip';
BEGIN
SELECT count(*)
INTO v_exists
FROM zipcode
WHERE zip = v_zip;
IF v_exists != 0 THEN
SELECT first_name||' '||last_name
INTO v_student_name
FROM student
WHERE zip = v_zip
AND rownum = 1;
DBMS_OUTPUT.PUT_LINE ('Student name is '||v_student_name);
ELSE
DBMS_OUTPUT.PUT_LINE (v_zip||' is not a valid zip');
END IF;
EXCEPTION
WHEN VALUE_ERROR OR INVALID_NUMBER THEN
DBMS_OUTPUT.PUT_LINE ('An error has occurred');
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE
('There are no students for this value of zip code');
END;

.
/
spool OFF;