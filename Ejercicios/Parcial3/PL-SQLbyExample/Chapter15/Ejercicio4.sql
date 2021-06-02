spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter15\salida\ejercicio4chapter15.txt
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


-- Ejemplo, uso de varray, modificado(ROSENZWEIG y RAKHIMOV, 2009, 336).

DECLARE
	CURSOR name_cur IS
		SELECT last_name
			FROM student
			WHERE rownum <= 12;
	TYPE last_name_type IS VARRAY(12) OF student.last_name%TYPE;
	last_name_varray last_name_type := last_name_type();
	v_counter INTEGER := 0;
BEGIN
	FOR name_rec IN name_cur LOOP
		v_counter := v_counter + 1;
		last_name_varray.EXTEND;
		last_name_varray(v_counter) := name_rec.last_name;
		DBMS_OUTPUT.PUT_LINE ('last_name('||v_counter||'): '|| last_name_varray(v_counter));
	END LOOP;
	DBMS_OUTPUT.PUT_LINE ('varray.LIMIT = '|| last_name_varray.LIMIT);
	DBMS_OUTPUT.PUT_LINE ('varray.FIRST = '|| last_name_varray.FIRST);
END;
.
/
-- ¿Podemos usar desde posición 0?

DECLARE
	CURSOR name_cur IS
		SELECT last_name
			FROM student
			WHERE rownum <= 12;
	TYPE last_name_type IS VARRAY(13) OF student.last_name%TYPE;
	last_name_varray last_name_type := last_name_type();
	v_counter INTEGER := 0;
BEGIN
	last_name_varray.EXTEND;
		last_name_varray(0) := 'CORTES';

	FOR name_rec IN name_cur LOOP
		v_counter := v_counter + 1;
		last_name_varray.EXTEND;
		last_name_varray(v_counter) := name_rec.last_name;
		DBMS_OUTPUT.PUT_LINE ('last_name('||v_counter||'): '|| last_name_varray(v_counter));
	END LOOP;
	DBMS_OUTPUT.PUT_LINE ('varray.LIMIT = '|| last_name_varray.LIMIT);
	DBMS_OUTPUT.PUT_LINE ('varray.FIRST = '|| last_name_varray.FIRST);
END;
.
/
--NOPE


spool OFF;
