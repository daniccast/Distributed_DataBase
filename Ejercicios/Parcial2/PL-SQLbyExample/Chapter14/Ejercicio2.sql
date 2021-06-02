spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter14\salida\ejercicio2chapter14.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 2 de mayo  de 2021                        *
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
In this exercise, you modify the trigger you created in Lab 14.1 that causes a mutating table error when
an INSERT statement is issued against the ENROLLMENT table.

(ROSENZWEIG &  RAKHIMOV, 2009, 306)
*/


DROP TRIGGER enrollment_biu;
DROP TRIGGER enrollment_aiu;
DROP PACKAGE student_adm;
DELETE FROM enrollment
WHERE student_id = 399;
COMMIT;

CREATE OR REPLACE TRIGGER enrollment_compound
	FOR INSERT OR UPDATE ON enrollment
	COMPOUND TRIGGER
	v_student_id STUDENT.STUDENT_ID%TYPE;
	v_student_name VARCHAR2(50);
	v_total INTEGER;
BEFORE EACH ROW IS
	BEGIN
		IF :NEW.student_id IS NOT NULL THEN
			BEGIN
				v_student_id := :NEW.student_id;
				SELECT first_name||' '||last_name
					INTO v_student_name
					FROM student
					WHERE student_id = v_student_id;
				EXCEPTION
					WHEN NO_DATA_FOUND THEN
						RAISE_APPLICATION_ERROR
						(-20001, 'This is not a valid student');
			END;
		END IF;
	END BEFORE EACH ROW;
AFTER STATEMENT IS
	BEGIN
		SELECT COUNT(*)
			INTO v_total
			FROM enrollment
			WHERE student_id = v_student_id;
		-- check if the current student is enrolled in too
		-- many courses
		IF v_total >= 3 THEN
			RAISE_APPLICATION_ERROR (-20000, 'Student, '||v_student_name|| ', is registered for 3 courses already ');
		END IF;
	END AFTER STATEMENT;
END enrollment_compound;

/*
Modify the compound trigger so that the trigger populates the values for the CREATED_BY,
CREATED_DATE, MODIFIED_BY, and MODIFIED_DATE columns.
*/

CREATE OR REPLACE TRIGGER enrollment_compound
	FOR INSERT OR UPDATE ON enrollment
	COMPOUND TRIGGER
	v_student_id 	STUDENT.STUDENT_ID%TYPE;
	v_student_name VARCHAR2(50);
	v_total 	INTEGER;
	v_date 	DATE;
	v_user 	STUDENT.CREATED_BY%TYPE;
BEFORE STATEMENT IS
	BEGIN
		v_date := SYSDATE;
		v_user := USER;
	END BEFORE STATEMENT;
BEFORE EACH ROW IS
	BEGIN
	IF INSERTING THEN
		:NEW.created_date 	:= v_date;
		:NEW.created_by 	:= v_user;
	ELSIF UPDATING THEN
		:NEW.created_date	:= :OLD.created_date;
		:NEW.created_by 	:= :OLD.created_by;
	END IF;
	
	:NEW.MODIFIED_DATE 	:= v_date;
	:NEW.MODIFIED_BY 	:= v_user;
	
	IF :NEW.STUDENT_ID IS NOT NULL THEN
		BEGIN
			v_student_id := :NEW.STUDENT_ID;
			SELECT first_name||' '||last_name
				INTO v_student_name
				FROM student
				WHERE student_id = v_student_id;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					RAISE_APPLICATION_ERROR
						(-20001, 'This is not a valid student');
		END;
	END IF;
	END BEFORE EACH ROW;
AFTER STATEMENT IS
	BEGIN
		SELECT COUNT(*)
			INTO v_total
			FROM enrollment
			WHERE student_id = v_student_id;
		-- check if the current student is enrolled in too
		-- many courses
		IF v_total >= 3 THEN
			RAISE_APPLICATION_ERROR (-20000, 'Student, '||v_student_name||
			', is registered for 3 courses already ');
		END IF;
	END AFTER STATEMENT;
END enrollment_compound;

INSERT INTO enrollment
	(student_id, section_id, enroll_date, final_grade)
VALUES (102, 155, sysdate, null);

INSERT INTO enrollment
	(student_id, section_id, enroll_date, final_grade)
VALUES (103, 155, sysdate, null);

UPDATE ENROLLMENT
SET final_grade = 85
WHERE student_id = 105
AND section_id = 155;

spool OFF;
