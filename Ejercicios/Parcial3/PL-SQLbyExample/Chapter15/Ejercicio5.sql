spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter15\salida\ejercicio5chapter15.txt
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


-- Ejemplo, uso de multilevel collections(ROSENZWEIG y RAKHIMOV, 2009, 343).


DECLARE
	TYPE varray_type1 IS VARRAY(4) OF INTEGER;
	TYPE varray_type2 IS VARRAY(3) OF varray_type1;
	varray1 varray_type1 := varray_type1(2, 4, 6, 8);
	varray2 varray_type2 := varray_type2(varray1);
BEGIN
	DBMS_OUTPUT.PUT_LINE ('Varray of integers');
	FOR i IN 1..4 LOOP
		DBMS_OUTPUT.PUT_LINE ('varray1('||i||'): '||varray1(i));
	END LOOP;
	varray2.EXTEND;
	varray2(2) := varray_type1(1, 3, 5, 7);
	DBMS_OUTPUT.PUT_LINE (chr(10)||'Varray of varrays of integers');
	FOR i IN 1..2 LOOP
		FOR j IN 1..4 LOOP
			DBMS_OUTPUT.PUT_LINE('varray2('||i||')('||j||'): '||varray2(i)(j));
		END LOOP;
	END LOOP;
END;





spool OFF;
