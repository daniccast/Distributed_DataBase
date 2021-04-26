spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter9\salida\ejercicio1chapter9.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar *                 
rem * Realizado el 4 de Abril  de 2021                       *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                     *
rem *Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson.      *
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
In this exercise, you display the number of students for a given zip code. You use nested PL/SQL blocks to achieve the desired results. The original PL/SQL script does not contain any exception handlers. Therefore, you are asked to identify possible errors that may occur and define exception handlers for them.
(ROSENZWEIG &  RAKHIMOV, 2009, 183)
*/


-- ch9_1a.sql, version 1.0

DECLARE
	v_zip VARCHAR2(5) := '&sv_zip';
	v_total NUMBER(1);
-- outer block
BEGIN
	DBMS_OUTPUT.PUT_LINE ('Check if provided zipcode is valid');
	SELECT zip
		INTO v_zip
		FROM zipcode
		WHERE zip = v_zip;
	-- inner block
	BEGIN
		SELECT count(*)
			INTO v_total
			FROM student
			WHERE zip = v_zip;
		DBMS_OUTPUT.PUT_LINE ('There are '||v_total||' students for zipcode '||v_zip);
	END;
	DBMS_OUTPUT.PUT_LINE ('Done...');
END;
.
/

--Correr con 07024
-- Con este valor arroja un error, que indica que el nùmero es demasiado grande.

SELECT count(*)
FROM student
WHERE zip = 07024;

SELECT count(*)
FROM student
WHERE zip = 30342;

--Son 10 estudiantes, por lo tanto v_total debe ser number(2)

-- Agregar exception

DECLARE
	v_zip VARCHAR2(5) := '&sv_zip';
	v_total NUMBER(1);
-- outer block
BEGIN
	DBMS_OUTPUT.PUT_LINE ('Check if provided zipcode is valid');
	SELECT zip
		INTO v_zip
		FROM zipcode
		WHERE zip = v_zip;
	-- inner block
	BEGIN
		SELECT count(*)
			INTO v_total
			FROM student
			WHERE zip = v_zip;
		DBMS_OUTPUT.PUT_LINE ('There are '||v_total||' students for zipcode '||v_zip);
	EXCEPTION
		WHEN VALUE_ERROR OR INVALID_NUMBER THEN
			DBMS_OUTPUT.PUT_LINE ('An error has occurred');
	END;
	DBMS_OUTPUT.PUT_LINE ('Done...');
END;
.
/



DECLARE
	v_zip VARCHAR2(5) := '&sv_zip';
	v_total NUMBER(1);
-- outer block
BEGIN
	DBMS_OUTPUT.PUT_LINE ('Check if provided zipcode is valid');
	SELECT zip
		INTO v_zip
		FROM zipcode
		WHERE zip = v_zip;
	-- inner block
	BEGIN
		SELECT count(*)
			INTO v_total
			FROM student
			WHERE zip = v_zip;
		DBMS_OUTPUT.PUT_LINE ('There are '||v_total||' students for zipcode '||v_zip);
	END;
	DBMS_OUTPUT.PUT_LINE ('Done...');
EXCEPTION
	WHEN VALUE_ERROR OR INVALID_NUMBER THEN
		DBMS_OUTPUT.PUT_LINE ('An error has occurred');
END;
.
/

--Esta es una excepción global
spool OFF;
