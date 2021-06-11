spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter15\salida\ejercicio2chapter15.txt

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


-- Ejemplo. (ROSENZWEIG y RAKHIMOV, 2009, 325).

DECLARE
	TYPE index_by_type IS TABLE OF NUMBER
		INDEX BY BINARY_INTEGER;
	index_by_table index_by_type;
	TYPE nested_type IS TABLE OF NUMBER;
	nested_table nested_type := nested_type(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
BEGIN

	FOR i IN 1..10 LOOP
		index_by_table(i) := i;
	END LOOP;
	IF index_by_table.EXISTS(3) THEN
		DBMS_OUTPUT.PUT_LINE ('index_by_table(3) = '||index_by_table(3));
	END IF;
	-- delete 10th element from a collection
	nested_table.DELETE(10);
	-- delete elements 1 through 3 from a collection
	nested_table.DELETE(1,3);
	index_by_table.DELETE(10);
	DBMS_OUTPUT.PUT_LINE ('nested_table.COUNT = '||nested_table.COUNT);
	DBMS_OUTPUT.PUT_LINE ('index_by_table.COUNT = '|| index_by_table.COUNT);
	DBMS_OUTPUT.PUT_LINE ('nested_table.FIRST = '||nested_table.FIRST);
	DBMS_OUTPUT.PUT_LINE ('nested_table.LAST = '||nested_table.LAST);
	DBMS_OUTPUT.PUT_LINE ('index_by_table.FIRST = '|| index_by_table.FIRST);
	DBMS_OUTPUT.PUT_LINE ('index_by_table.LAST ='||index_by_table.LAST);
	DBMS_OUTPUT.PUT_LINE ('nested_table.PRIOR(2) = '||nested_table. PRIOR(2));
	DBMS_OUTPUT.PUT_LINE ('nested_table.NEXT(2) = '||nested_table.NEXT(2));
	DBMS_OUTPUT.PUT_LINE ('index_by_table.PRIOR(2) = '||index_by_table.PRIOR(2));
	DBMS_OUTPUT.PUT_LINE ('index_by_table.NEXT(2) = '||index_by_table.NEXT(2));
	-- Trim last two elements
	nested_table.TRIM(2);
	-- Trim last element
	nested_table.TRIM;
	DBMS_OUTPUT.PUT_LINE('nested_table.LAST = '||nested_table.LAST);
END;

spool OFF;
