spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter14\salida\ejercicio1chapter14.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 2 de mayo  de 2021                        *
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

/*
In this exercise, you modify a trigger that causes a mutating table error when an INSERT statement is issued against the ENROLLMENT table.
(ROSENZWEIG &  RAKHIMOV, 2009, 296)
*/

-- Create the following trigger

-- ch14_1a.sql, version 1.0
CREATE OR REPLACE TRIGGER enrollment_biu
	BEFORE INSERT OR UPDATE ON enrollment
	FOR EACH ROW
DECLARE
	v_total NUMBER;
	v_name VARCHAR2(30);
BEGIN
	SELECT COUNT(*)
		INTO v_total
		FROM enrollment
		WHERE student_id = :NEW.student_id;
-- check if the current student is enrolled in too
-- many courses
	IF v_total >= 3 THEN
		SELECT first_name||' '||last_name
		INTO v_name
		FROM student
		WHERE student_id = :NEW.STUDENT_ID;
		RAISE_APPLICATION_ERROR (-20000, 'Student, '||v_name||', is registered for 3 courses already');
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RAISE_APPLICATION_ERROR (-20001, 'This is not a valid student');
END;

--Issue the following INSERT and UPDATE statements

INSERT INTO ENROLLMENT
	(student_id, section_id, enroll_date, created_by, created_date,
	modified_by, modified_date)
VALUES (184, 98, SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO ENROLLMENT
	(student_id, section_id, enroll_date, created_by, created_date,
	modified_by, modified_date)
VALUES (399, 98, SYSDATE, USER, SYSDATE, USER, SYSDATE);

UPDATE ENROLLMENT
SET student_id = 399
WHERE student_id = 283;


-- Modify the trigger so that it does not cause a mutating table error when an UPDATE statement is issued against the ENROLLMENT table.

CREATE OR REPLACE PACKAGE student_adm AS
	v_student_id student.student_id%TYPE;
	v_student_name varchar2(50);
END;

CREATE OR REPLACE TRIGGER enrollment_biu
	BEFORE INSERT OR UPDATE ON enrollment
	FOR EACH ROW
BEGIN
	IF :NEW.STUDENT_ID IS NOT NULL THEN
		BEGIN
			student_adm.v_student_id := :NEW.student_id;
			SELECT first_name||' '||last_name
				INTO student_adm.v_student_name
				FROM student
				WHERE student_id = student_adm.v_student_id;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
				RAISE_APPLICATION_ERROR(-20001, 'This is not a valid student');
		END;
	END IF;
END;

CREATE OR REPLACE TRIGGER enrollment_aiu
	AFTER INSERT OR UPDATE ON enrollment
DECLARE
	v_total INTEGER;
BEGIN
	SELECT COUNT(*)
		INTO v_total
		FROM enrollment
		WHERE student_id = student_adm.v_student_id;

	-- check if the current student is enrolled in too
	-- many courses
	IF v_total >= 3 THEN
		RAISE_APPLICATION_ERROR (-20000, 'Student, '|| student_adm.v_student_name|| ', is registered for 3 courses already ');
	END IF;
END;

UPDATE enrollment
SET student_id = 399
WHERE student_id = 283;


spool OFF;
