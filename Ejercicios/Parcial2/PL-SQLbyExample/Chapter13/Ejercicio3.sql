spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter13\salida\ejercicio3chapter13.txt
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
Crear la vista
Crear trigger
(ROSENZWEIG &  RAKHIMOV, 2009, 288)*/

CREATE VIEW student_address AS
	SELECT s.student_id, s.first_name, s.last_name,
	s.street_address, z.city, z.state, z.zip
	FROM student s
	JOIN zipcode z
	ON (s.zip = z.zip);


-- ch13_3a.sql, version 1.0
CREATE OR REPLACE TRIGGER student_address_ins
	INSTEAD OF INSERT ON student_address
	FOR EACH ROW
BEGIN
	INSERT INTO STUDENT
	(student_id, first_name, last_name, street_address, zip,
	registration_date, created_by, created_date, modified_by,
	modified_date)
	VALUES
	(:NEW.student_id, :NEW.first_name, :NEW.last_name,
	:NEW.street_address, :NEW.zip, SYSDATE, USER, SYSDATE, USER,
	SYSDATE);
END;

INSERT INTO student_address
VALUES (STUDENT_ID_SEQ.NEXTVAL, 'John', 'Smith', '123 Main Street',
'New York', 'NY', '10019');

INSERT INTO student_address
VALUES (STUDENT_ID_SEQ.NEXTVAL, 'John', 'Smith', '123 Main Street',
'New York', 'NY', '12345');


/*
Modify the trigger so that it checks the value of the zip code provided by the INSERT statement
against the ZIPCODE table. If the ZIPCODE table has no corresponding record, the trigger should
create a new record for the given value of zip before adding a new record to the STUDENT table.
(ROSENZWEIG &  RAKHIMOV, 2009, 289)
*/

CREATE OR REPLACE TRIGGER student_address_ins
	INSTEAD OF INSERT ON student_address
	FOR EACH ROW
DECLARE
	v_zip VARCHAR2(5);
BEGIN
	BEGIN
		SELECT zip
			INTO v_zip
			FROM zipcode
			WHERE zip = :NEW.zip;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			INSERT INTO ZIPCODE
			(zip, city, state, created_by, created_date, modified_by, modified_date)
			VALUES
			(:NEW.zip, :NEW.city, :NEW.state, USER, SYSDATE, USER, SYSDATE);
	END;
	INSERT INTO STUDENT
	(student_id, first_name, last_name, street_address, zip,
	registration_date, created_by, created_date, modified_by,
	modified_date)
	VALUES
	(:NEW.student_id, :NEW.first_name, :NEW.last_name,
	:NEW.street_address, :NEW.zip, SYSDATE, USER, SYSDATE, USER,
	SYSDATE);
END;


INSERT INTO student_address
VALUES (STUDENT_ID_SEQ.NEXTVAL, 'John', 'Smith', '123 Main Street',
'New York', 'NY', '12345');


spool OFF;
