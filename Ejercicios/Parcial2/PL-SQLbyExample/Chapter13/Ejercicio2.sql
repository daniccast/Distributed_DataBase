spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter13\salida\ejercicio2chapter13.txt
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
Crear el trigger
Modify this trigger so that if a prerequisite course is supplied at the time of the insert, its value is
checked against the existing courses in the COURSE table.
(ROSENZWEIG &  RAKHIMOV, 2009, 283)
*/

CREATE OR REPLACE TRIGGER course_bi
	BEFORE INSERT ON COURSE
	FOR EACH ROW
BEGIN
	:NEW.COURSE_NO:= COURSE_NO_SEQ.NEXTVAL;
	:NEW.CREATED_BY:= USER;
	:NEW.CREATED_DATE := SYSDATE;
	:NEW.MODIFIED_BY:= USER;
	:NEW.MODIFIED_DATE := SYSDATE;
END;

-- Modificado


CREATE OR REPLACE TRIGGER course_bi
	BEFORE INSERT ON COURSE
	FOR EACH ROW
DECLARE
	v_prerequisite COURSE.COURSE_NO%TYPE;
BEGIN
	IF :NEW.PREREQUISITE IS NOT NULL THEN
		SELECT course_no
		INTO v_prerequisite
		FROM course
		WHERE course_no = :NEW.PREREQUISITE;
	END IF;
	:NEW.COURSE_NO:= COURSE_NO_SEQ.NEXTVAL;
	:NEW.CREATED_BY:= USER;
	:NEW.CREATED_DATE := SYSDATE;
	:NEW.MODIFIED_BY:= USER;
	:NEW.MODIFIED_DATE := SYSDATE;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
END;

INSERT INTO COURSE (description, cost, prerequisite)
VALUES ('Test Course', 0, 999);


spool OFF;
