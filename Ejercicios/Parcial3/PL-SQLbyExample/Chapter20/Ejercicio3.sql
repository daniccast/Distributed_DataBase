spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter20\salida\ejercicio3chapter20.txt
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


-- Crear la función compleja (ROSENZWEIG y RAKHIMOV, 2009, 454).

CREATE OR REPLACE FUNCTION new_instructor_id
RETURN instructor.instructor_id%TYPE
AS
	v_new_instid instructor.instructor_id%TYPE;
BEGIN
	SELECT INSTRUCTOR_ID_SEQ.NEXTVAL
		INTO v_new_instid
		FROM dual;
	RETURN v_new_instid;
EXCEPTION
	WHEN OTHERS THEN
	DECLARE
		v_sqlerrm VARCHAR2(250) := SUBSTR(SQLERRM,1,250);
	BEGIN
		RAISE_APPLICATION_ERROR(-20003, 'Error in instructor_id: '||v_sqlerrm);
	END;
END new_instructor_id;

--Genera el nuevo ID del instructor

insert into instructor(instructor_id, created_by, created_date, modified_by, modified_date)values (new_instructor_id(), 'Daniela', SYSDATE, 'Daniela',SYSDATE);
spool OFF;
