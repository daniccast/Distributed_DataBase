spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter15\salida\ejercicio1chapter19.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 9 de Junio  de 2021                       *
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


-- In this exercise, you run a script that creates a procedure.  (ROSENZWEIG y RAKHIMOV, 2009, 442).

-- ch19_01a.sql
CREATE OR REPLACE PROCEDURE Discount
AS
	CURSOR c_group_discount
	IS
		SELECT distinct s.course_no, c.description
			FROM section s, enrollment e, course c
			WHERE s.section_id = e.section_id
			AND c.course_no = s.course_no
			GROUP BY s.course_no, c.description,
			e.section_id, s.section_id
			HAVING COUNT(*) >=8;
BEGIN
	FOR r_group_discount IN c_group_discount
	LOOP
		UPDATE course
		SET cost = cost * .95
		WHERE course_no = r_group_discount.course_no;
		
		DBMS_OUTPUT.PUT_LINE ('A 5% discount has been given to '||
		r_group_discount.course_no||' '||
		r_group_discount.description );
	END LOOP;
END;


COLUMN object_name FORMAT A25
COLUMN object_type FORMAT A25
COLUMN status FORMAT A25

SELECT object_name, object_type, status
FROM user_objects
WHERE object_name = 'DISCOUNT';


column text format a70
SELECT TO_CHAR(line, 99)||'>', text
FROM user_source
WHERE name = 'DISCOUNT';


spool OFF;
