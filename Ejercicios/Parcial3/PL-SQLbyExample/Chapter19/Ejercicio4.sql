spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter15\salida\ejercicio4chapter15.txt
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


-- Write a procedure that takes in a zip code, city, and state and inserts the values into the zip code
--table. It should check to see if the zip code is already in the database. If it is, an exception should
--be raised, and an error message should be displayed. Write an anonymous block that uses the
--procedure and inserts your zip code.
--(ROSENZWEIG y RAKHIMOV, 2009, 447).

CREATE OR REPLACE PROCEDURE zipcode_insert
	(i_zip IN VARCHAR2(5),
	 i_city IN VARCHAR2(25)
	)
AS
BEGIN
	insert into ZIPCODE (zip,city) values (i_zip,i_city);
EXCEPTION
	WHEN OTHERS
	THEN
	DBMS_OUTPUT.PUT_LINE('Ya está registrado ');
END zipcode_insert;

-- ch19_03a.sql

BEGIN
	zipcode_insert
		('50070','Ecatepec');
END;




spool OFF;
