spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter11\salida\ejercicio1chapter11.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 2 de mayo  de 2021                        *
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
Explain what is declared in the following example. Describe what is happening to the record, and
explain how this results in the output:
(ROSENZWEIG &  RAKHIMOV, 2009, 239)
*/


DECLARE
	TYPE instructor_info IS RECORD
		(first_name instructor.first_name%TYPE,
		last_name instructor.last_name%TYPE,
		sections NUMBER);
	rv_instructor instructor_info;
BEGIN
	SELECT RTRIM(i.first_name), RTRIM(i.last_name), COUNT(*)
		INTO rv_instructor
		FROM instructor i, section s
		WHERE i.instructor_id = s.instructor_id
		AND i.instructor_id = 102
		GROUP BY i.first_name, i.last_name;
	DBMS_OUTPUT.PUT_LINE('Instructor, '||
		rv_instructor.first_name||
		' '||rv_instructor.last_name||
		', teaches '||rv_instructor.sections||
		' section(s)');
EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE
	('There is no such instructor');
END;


spool OFF;
