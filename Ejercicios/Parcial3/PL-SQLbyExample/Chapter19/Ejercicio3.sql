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
	dia_hoy  VARCHAR2(10);
	user_v VARCHAR2(10);
	time_v VARCHAR2(50);
	validos_v VARCHAR2(10);
	invalidos_v VARCHAR2(10);
BEGIN
	SELECT TO_CHAR(SYSDATE,'DAY') into dia_hoy FROM dual;
	IF dia_hoy like 'S%' then
	DBMS_OUTPUT.PUT_LINE ('WEEKEND');
	ELSE
	DBMS_OUTPUT.PUT_LINE ('WEEKDAY');
	END IF;

	SELECT user into user_v from dual;
	DBMS_OUTPUT.PUT_LINE (user_v);

	SELECT TO_CHAR(SYSTIMESTAMP) into time_v from dual;
	DBMS_OUTPUT.PUT_LINE (time_v);

	SELECT COUNT(*) into validos_v
		FROM user_objects
		WHERE status like 'VALID';
	DBMS_OUTPUT.PUT_LINE (validos_v);
	SELECT COUNT(*) into invalidos_v
		FROM user_objects
		WHERE status not like 'VALID';
	DBMS_OUTPUT.PUT_LINE (invalidos_v);

END dia;
.
/


SELECT object_name, object_type, status
FROM user_objects;

BEGIN
	dia();
	DBMS_OUTPUT.PUT_LINE ('LISTO');
END;
.
/

spool OFF;
