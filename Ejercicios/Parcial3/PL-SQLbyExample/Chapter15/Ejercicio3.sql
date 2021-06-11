spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter15\salida\ejercicio3chapter15.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 9 de Junio  de 2021                       *
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


-- Modify script ch15_1a.sql, used in Exercise 15.1.1. Instead of using an associative array, use a nested table. (ROSENZWEIG y RAKHIMOV, 2009, 331).



DECLARE
	CURSOR course_cur IS
		SELECT description
			FROM course;
	TYPE course_type IS TABLE OF course.description%TYPE;
	course_tab course_type := course_type();
	v_counter INTEGER := 0;
BEGIN
	FOR course_rec IN course_cur LOOP
		v_counter := v_counter + 1;
		course_tab.EXTEND;
		course_tab(v_counter) := course_rec.description;
		DBMS_OUTPUT.PUT_LINE('course_tab('|| v_counter || ')=' || course_tab(v_counter));
	END LOOP;
		
END;



spool OFF;
