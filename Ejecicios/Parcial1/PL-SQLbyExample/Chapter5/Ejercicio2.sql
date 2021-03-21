spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter5\salida\ejercicio2chapter5.txt
/*
rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *                 
rem * Realizado el 13 de Marzo de 2021                  *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                *
rem *Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. *
rem *****************************************************
*/

set colsep '|=|'
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';

SET SERVEROUTPUT ON


/*
Pasar a case expression la consulta de las letras. Después usar un select
 (ROSENZWEIG,B &  RAKHIMOV,E, p. 129).
*/

-- ch05_3a.sql, version 1.0

DECLARE
v_student_id   NUMBER := 102;
v_section_id   NUMBER := 89;
v_final_grade  NUMBER;
v_letter_grade CHAR(1);
BEGIN
SELECT final_grade
INTO v_final_grade
FROM enrollment
WHERE student_id = v_student_id
AND section_id = v_section_id;
v_letter_grade :=
	CASE
	WHEN v_final_grade >= 90 THEN 'A'
	WHEN v_final_grade >= 80 THEN 'B'
	WHEN v_final_grade >= 70 THEN 'C'
	WHEN v_final_grade >= 60 THEN 'D'
	ELSE 'F'
END;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Letter grade' || v_letter_grade);
END;
.
/


--CAMBIO para ahorrar código

SELECT final_grade, CASE 
	WHEN v_final_grade >= 90 THEN 'A'
	WHEN v_final_grade >= 80 THEN 'B'
	WHEN v_final_grade >= 70 THEN 'C'
	WHEN v_final_grade >= 60 THEN 'D'
	ELSE 'F'
	END as "letter grade"
END
FROM enrollment
WHERE student_id = 102
AND section_id = 89;
.
/



spool OFF;
