spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter13\salida\ejercicio1chapter13.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 16 de mayo  de 2021                       *
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

/*
If an INSERT statement issued against the INSTRUCTOR table is missing a value for the column ZIP,
does the trigger raise an exception? Explain your answer.
Cuando no hy valor para el zipcode
(ROSENZWEIG &  RAKHIMOV, 2009, 275)
*/


CREATE OR REPLACE TRIGGER instructor_bi
	BEFORE INSERT ON INSTRUCTOR
	FOR EACH ROW
DECLARE
	v_work_zip CHAR(1);
BEGIN
	:NEW.CREATED_BY := USER;
	:NEW.CREATED_DATE := SYSDATE;
	:NEW.MODIFIED_BY := USER;
	:NEW.MODIFIED_DATE := SYSDATE;
	SELECT 'Y'
	INTO v_work_zip
	FROM zipcode
	WHERE zip = :NEW.ZIP;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RAISE_APPLICATION_ERROR (-20001, 'Zip code is not valid!');
END;
/

select instructor_id from instructor;

select * from instructor
	where instructor_id=111;

insert into Instructor (instructor_id, salutation, first_name, last_name, street_address,
	zip, phone) VALUES (111,'ms', 'Daniela', 'Cortes','Mexico','10019','58284521');

insert into Instructor (instructor_id, salutation, first_name, last_name, street_address,
	zip, phone) VALUES (112,'ms', 'Daniela', 'Cortes','Mexico','25019','58284521');



-- ch13_1b.sql, version 2.0
CREATE OR REPLACE TRIGGER instructor_bi
	BEFORE INSERT ON INSTRUCTOR
	FOR EACH ROW
DECLARE
	v_work_zip CHAR(1);
BEGIN
	:NEW.CREATED_BY := USER;
	:NEW.CREATED_DATE := SYSDATE;
	:NEW.MODIFIED_BY := USER;
	:NEW.MODIFIED_DATE := SYSDATE;
	IF :NEW.ZIP IS NULL THEN
		RAISE_APPLICATION_ERROR (-20002, 'Zip code is missing!');
	ELSE
		SELECT 'Y'
		INTO v_work_zip
		FROM zipcode
		WHERE zip = :NEW.ZIP;
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RAISE_APPLICATION_ERROR (-20001, 'Zip code is not valid!');
END;
spool OFF;
