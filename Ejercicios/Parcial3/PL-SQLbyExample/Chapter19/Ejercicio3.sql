spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter19\salida\ejercicio3chapter19.txt
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


-- Write a procedure with no parameters. The procedure should say whether the current day is a
--weekend or weekday. Additionally, it should tell you the user’s name and the current time. It also
--should specify how many valid and invalid procedures are in the database.
--(ROSENZWEIG y RAKHIMOV, 2009, 447).

CREATE OR REPLACE PROCEDURE dia
AS
	CURSOR dia_hoy
	IS
		SELECT EXTRACT(DAY FROM sysdate) FROM dual;
	
BEGIN
	IF dia_hoy like "S%" then
	DBMS_OUTPUT.PUT_LINE ('WEEKEND');
	ELSE
	DBMS_OUTPUT.PUT_LINE ('WEEKDAY');
	END IF;
	Select * from all_users;
END;


SELECT object_name, object_type, status
FROM user_objects
WHERE object_name = 'DISCOUNT';


column text format a70
SELECT TO_CHAR(line, 99)||'>', text
FROM user_source
WHERE name = 'DISCOUNT'



spool OFF;
