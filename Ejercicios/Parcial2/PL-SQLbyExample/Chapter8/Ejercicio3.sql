spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter8\salida\ejercicio3chapter8.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cort�s Castilllo Daniela y Mendoza Cuellar Jos� Oscar  *                 
rem * Realizado el 4 de Abril  de 2021                       *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                     *
rem *Oracle� PL/SQL�by Example,Boston,MA,USA:Perarson.       *
rem **********************************************************
*/

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';
SET SERVEROUTPUT ON;


-- Create the following script: Check to see whether there is a record in the STUDENT table for a given student ID. If there is not, insert a record into the STUDENT table for the given student ID.. (ROSENZWEIG y RAKHIMOV, 2009, 178).


DECLARE 
	v_student_id NUMBER := &sv_student_id;
	v_name_student      VARCHAR(15);
BEGIN
	select first_name
		into v_name_student
		from student
		where student_id=v_student_id;
	DBMS_OUTPUT.PUT_LINE ('Ya existe, se llama:' || v_name_student);
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		INSERT INTO student (student_id, salutation, first_name,
	last_name, zip, registration_date, created_by, created_date, modified_by, modified_date)
		VALUES (v_student_id, 'Ms.', 'Daniela', 'Smith', '07024', SYSDATE, 'STUDENT', SYSDATE, 'STUDENT', SYSDATE);

END;

.
/
/

select student_id, first_name from student
where student_id in (500,501);

spool OFF;