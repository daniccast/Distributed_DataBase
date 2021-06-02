spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter15\salida\ejercicio1chapter15.txt
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


-- Ejemplos (ROSENZWEIG y RAKHIMOV, 2009, 317).
-- Asociatie arrays

DECLARE
	CURSOR name_cur IS	
		SELECT last_name
		FROM student
		WHERE rownum <= 10;
	TYPE last_name_type IS TABLE OF student.last_name%TYPE
	INDEX BY BINARY_INTEGER;
	last_name_tab last_name_type;
	v_counter INTEGER := 0;
BEGIN
	FOR name_rec IN name_cur LOOP
		v_counter := v_counter + 1;
		last_name_tab(v_counter) := name_rec.last_name;
		DBMS_OUTPUT.PUT_LINE ('last_name('||v_counter||'): '||
		last_name_tab(v_counter));
	END LOOP;
END;
.
/

-- Nested table

DECLARE
	CURSOR name_cur IS
		SELECT last_name
		FROM student
		WHERE rownum <= 10;
	TYPE last_name_type IS TABLE OF student.last_name%TYPE;
	last_name_tab last_name_type := last_name_type();
	v_counter INTEGER := 0;
BEGIN
	FOR name_rec IN name_cur LOOP
		v_counter := v_counter + 1;
		last_name_tab.EXTEND;
		last_name_tab(v_counter) := name_rec.last_name;
		DBMS_OUTPUT.PUT_LINE ('last_name('||v_counter||'): '||
		last_name_tab(v_counter));
	END LOOP;
END;

.
/


-- ch15_1c.sql, version 3.0 (ROSENZWEIG y RAKHIMOV, 2009, 327). MOdificado

DECLARE
	CURSOR course_cur IS
		SELECT description
		FROM course;
	TYPE course_type IS TABLE OF course.description%TYPE
	INDEX BY BINARY_INTEGER;
	course_tab course_type;
	v_counter INTEGER := 0;
BEGIN
	FOR course_rec IN course_cur LOOP
		v_counter := v_counter + 1;
		course_tab(v_counter):= course_rec.description;
	END LOOP;
	FOR i IN 1..v_counter LOOP
		DBMS_OUTPUT.PUT_LINE('course('||i||'): '||course_tab(i));
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('course('||course_tab.FIRST||'): '|| course_tab(course_tab.FIRST));
	DBMS_OUTPUT.PUT_LINE('course('||course_tab.LAST||'): '|| course_tab(course_tab.LAST));
	
	DBMS_OUTPUT.PUT_LINE ('Total number of elements: '|| course_tab.COUNT);

END;
.
/

--¡Que pasa si consultamos el ìndice 0?

DECLARE
	TYPE course_type IS TABLE OF INTEGER
	INDEX BY BINARY_INTEGER;
	course_tab course_type;
	v_counter INTEGER := 0;
BEGIN
	course_tab(0):= 4;
	course_tab(-1):= 5;
	DBMS_OUTPUT.PUT_LINE('course(0): '|| course_tab(0));
	DBMS_OUTPUT.PUT_LINE('course(-1): '|| course_tab(-1));
	DBMS_OUTPUT.PUT_LINE('course('||course_tab.FIRST||'): '|| course_tab(course_tab.FIRST));
	DBMS_OUTPUT.PUT_LINE('course('||course_tab.LAST||'): '|| course_tab(course_tab.LAST));
	DBMS_OUTPUT.PUT_LINE ('Total number of elements: '|| course_tab.COUNT);
END;
.
/
-- SI SE PUEDE INICIAR EN 0 incluso en negativos


spool OFF;
