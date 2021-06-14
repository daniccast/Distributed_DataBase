spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter21\salida\ejercicio2chapter21.txt

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


-- Create a package specification for a package named school_api. The package contains the
-- procedure discount from Chapter 19 and the function new_instructor_id from
-- Chapter 20.
-- (ROSENZWEIG y RAKHIMOV, 2009, 461).

CREATE OR REPLACE PACKAGE school_api as
	PROCEDURE discount;
	FUNCTION new_instructor_id
	RETURN instructor.instructor_id%TYPE;
END school_api;


--Create a package body for the package named school_api that you created in the previous
--exercise. This will contain the procedure discount from Chapter 19 and the function
--new_instructor_id from Chapter 20.
--  (ROSENZWEIG y RAKHIMOV, 2009, 463).
-- ch21_5a.sql
CREATE OR REPLACE PACKAGE BODY school_api AS
	PROCEDURE discount
	IS
		
	 CURSOR c_group_discount
	 IS
		SELECT distinct s.course_no, c.description
			FROM section s, enrollment e, course c
			WHERE s.section_id = e.section_id
			GROUP BY s.course_no, c.description,
			e.section_id, s.section_id
			HAVING COUNT(*) >=8;

	BEGIN
		FOR r_group_discount IN c_group_discount LOOP
			UPDATE course
				SET cost = cost * .95
				WHERE course_no = r_group_discount.course_no;
			DBMS_OUTPUT.PUT_LINE ('A 5% discount has been given to' ||r_group_discount.course_no||' '||r_group_discount.description);
		END LOOP;
	END discount_cost;


 	FUNCTION new_instructor_id
		RETURN instructor.instructor_id%TYPE
	IS
		v_new_instid instructor.instructor_id%TYPE;
	BEGIN
		 SELECT INSTRUCTOR_ID_SEQ.NEXTVAL
			 INTO v_new_instid
			FROM dual;
		RETURN v_new_instid;
	EXCEPTION
		 WHEN OTHERS THEN
			DECLARE
				v_sqlerrm VARCHAR2(250) := SUBSTR (SQLERRM,1,250);
			BEGIN
				RAISE_APPLICATION_ERROR(-20003,'Error in instructor_id: '||v_sqlerrm);
			END;
	END new_instructor_id;
	
END school_api;

-- ch21_7a.sql (ROSENZWEIG y RAKHIMOV, 2009, 465).

DECLARE
	V_instructor_id instructor.instructor_id%TYPE;
BEGIN
	School_api.Discount_Cost;
	v_instructor_id := school_api.new_instructor_id;
	DBMS_OUTPUT.PUT_LINE('The new id is: '||v_instructor_id);
END;



spool OFF;
