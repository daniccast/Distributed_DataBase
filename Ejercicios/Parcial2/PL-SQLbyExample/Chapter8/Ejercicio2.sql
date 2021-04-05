spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter8\salida\ejercicio2chapter8.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 4 de Abril  de 2021                       *
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





-- Create the following PL/SQL script. (ROSENZWEIG y RAKHIMOV, 2009, 174).

-- ch08_2a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
	v_exists         NUMBER(1);
	v_total_students NUMBER(1);
	v_zip            CHAR(5):= '&sv_zip';
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
	DBMS_OUTPUT.PUT_LINE('There are '||v_total_students||' students');
	ELSE
		DBMS_OUTPUT.PUT_LINE (v_zip||' is not a valid zip');
	END IF;
EXCEPTION
	WHEN VALUE_ERROR OR INVALID_NUMBER THEN
		DBMS_OUTPUT.PUT_LINE ('An error has occurred');
END;
.
/
/
/
--Probar con valores 07024 00914 12345

--Insertar este estudiante
INSERT INTO student (student_id, salutation, first_name,
	last_name, zip, registration_date, created_by, created_date,
	modified_by, modified_date)
VALUES (STUDENT_ID_SEQ.NEXTVAL, 'Mr.', 'John', 'Smith', '07024',
SYSDATE, 'STUDENT', SYSDATE, 'STUDENT', SYSDATE);

COMMIT;


/

--¿Por qué hay error?

/*
Porque en las declaraciones la variable total students es de tipo NUMBER con longitud de 1. Al
agregar un estudiante más ya no puede ser almacenada en esa variable.
*/

SET SERVEROUTPUT ON
DECLARE
	v_exists         NUMBER(1);
	v_total_students NUMBER(1);
	v_zip            CHAR(5):= '&sv_zip';
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
	DBMS_OUTPUT.PUT_LINE('There are '||v_total_students||' students');
	ELSE
		DBMS_OUTPUT.PUT_LINE (v_zip||' is not a valid zip');
	END IF;
EXCEPTION
	WHEN VALUE_ERROR OR INVALID_NUMBER THEN
		DBMS_OUTPUT.PUT_LINE ('An error has occurred');
END;
.
/

SET SERVEROUTPUT ON
DECLARE
	v_exists         NUMBER(1);
	v_total_students NUMBER(2);
	v_zip            CHAR(5):= '&sv_zip';
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
	DBMS_OUTPUT.PUT_LINE('There are '||v_total_students||' students');
	ELSE
		DBMS_OUTPUT.PUT_LINE (v_zip||' is not a valid zip');
	END IF;
EXCEPTION
	WHEN VALUE_ERROR OR INVALID_NUMBER THEN
		DBMS_OUTPUT.PUT_LINE ('An error has occurred');
END;
.
/


-----------------------------------------------------
-- How would you change the script to display a student’s first name and last name instead of displaying the total number of students for any given value of a zip?


DECLARE
	v_exists       NUMBER(1);
	v_student_name VARCHAR2(30);
	v_zip          CHAR(5):= '&sv_zip';
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
		DBMS_OUTPUT.PUT_LINE('There are no students for this value of zip code');
END;
.
/

spool OFF;
