spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter9\salida\ejercicio2chapter9.txt
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


/*
Create the following script: For a course section provided at runtime, 
determine the number of students registered. 
	->If this number is equal to or greater than 10, raise the user-defined exception 
	e_too_many_students and display an error message. Otherwise, display how many students are in a section.
*/

/*SELECT count(student_id), section_id
FROM enrollment
group by section_id;
*/

SELECT count(student_id), section_id
FROM enrollment
WHERE section_id = 89
group by section_id;

SELECT count(student_id), section_id
FROM enrollment
WHERE section_id = 99
group by section_id;

SELECT count(student_id), section_id
FROM enrollment
WHERE section_id = 100
group by section_id;

DECLARE
	v_section NUMBER := '&sv_section';
	v_total NUMBER(2);
	e_mayor10 EXCEPTION;
-- outer block
BEGIN
	
	SELECT count(student_id)
		INTO v_total
		FROM enrollment
		WHERE section_id = v_section
		group by section_id;
	
	IF v_total>10 THEN
		RAISE e_mayor10;
	ELSE 
		DBMS_OUTPUT.PUT_LINE ('Done...');
	END IF;
EXCEPTION
	WHEN e_mayor10 THEN
		DBMS_OUTPUT.PUT_LINE ('Más de diez...');
END;
.
/
/
/
spool OFF;
