spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter20\salida\ejercicio4chapter20.txt
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


-- Write a stored function called new_student_id that takes in no parameters and returns a
--student.student_id%TYPE. The value returned will be used when inserting a new
--student into the CTA application. It will be derived by using the formula
--student_id_seq.NEXTVAL.
-- (ROSENZWEIG y RAKHIMOV, 2009, 455).

CREATE OR REPLACE FUNCTION new_student_id
RETURN student.student_id%TYPE
AS
	v_new_studentid student.student_id%TYPE;
BEGIN
	SELECT student_id_seq.NEXTVAL
		INTO v_new_studentid
		FROM dual;
	RETURN v_new_studentid;
EXCEPTION
	WHEN OTHERS THEN
	DECLARE
		v_sqlerrm VARCHAR2(250) := SUBSTR(SQLERRM,1,250);
	BEGIN
		RAISE_APPLICATION_ERROR(-20003, 'Error in instructor_id: '||v_sqlerrm);
	END;
END new_student_id;
.
/

insert into student (student_id, last_name, zip, registration_date, created_by, created_date,modified_by, modified_date) 
values (new_student_id(),'Castillo', '50071', SYSDATE,'Daneila', SYSDATE,  'Daniela', SYSDATE);

select student_id, last_name, zip from student where zip='50071';

spool OFF;
