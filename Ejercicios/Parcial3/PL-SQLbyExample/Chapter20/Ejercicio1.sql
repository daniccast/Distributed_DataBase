spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter20\salida\ejercicio1chapter20.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 9 de Junio  de 2021                       *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                     *
rem *Oracle® PL/SQLby Example,Boston,MA,USA:Perarson.      *
rem **********************************************************
*/

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';
SET SERVEROUTPUT ON;


-- Crear el script (ROSENZWEIG y RAKHIMOV, 2009, 45).

-- ch20_01a.sql ver 1.0
CREATE OR REPLACE FUNCTION show_description
	(i_course_no course.course_no%TYPE)
RETURN varchar2
AS
	v_description varchar2(50);
BEGIN
	SELECT description
		INTO v_description
		FROM course
		WHERE course_no = i_course_no;
	RETURN v_description;
	
EXCEPTION
	WHEN NO_DATA_FOUND
	THEN
		RETURN(‘The Course is not in the database');
	WHEN OTHERS
	THEN
		RETURN(‘Error in running show_description');
END;

SET SERVEROUTPUT ON
DECLARE
	v_description VARCHAR2(50);
BEGIN
	v_description := show_description(&sv_cnumber);
	DBMS_OUTPUT.PUT_LINE(v_description);
END;

-- Crear la sentencia select con function (ROSENZWEIG y RAKHIMOV, 2009, 453).

SELECT course_no, show_description(course_no)
FROM course;





spool OFF;
