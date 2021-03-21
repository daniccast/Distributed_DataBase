spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter4\salida\ejercicio1chapter4.txt
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

-- IFTHEN EJEMPLO. (ROSENZWEIG,B &  RAKHIMOV,E, p. 88).

-- ch04_1a.sql, version 1.0

DECLARE
v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');
v_day VARCHAR2(15);
BEGIN
v_day := RTRIM(TO_CHAR(v_date, 'DAY'));
IF v_day IN ('SATURDAY', 'SUNDAY') THEN
DBMS_OUTPUT.PUT_LINE (v_date||' falls on weekend');
END IF;
--- control resumes here
DBMS_OUTPUT.PUT_LINE ('Done...');
END;

/* Rewrite ch04_1a.sql. Instead of getting information from the user for the variable v_date , define
its value with the help of the function SYSDATE. After it has been determined that a certain day
falls on the weekend, check to see if the time is before or after noon. Display the time of day
together with the day. (ROSENZWEIG,B &  RAKHIMOV,E, p. 109)
*/







-- IF THEN ELSE EJEMPLO. (ROSENZWEIG,B &  RAKHIMOV,E, p. 91).

SET SERVEROUTPUT ON
DECLARE
v_total NUMBER;
BEGIN
SELECT COUNT(*)
INTO v_total
FROM enrollment e
JOIN section s USING (section_id)
WHERE s.course_no = 25
AND s.section_no = 1;
-- check if section 1 of course 25 is full
IF v_total >= 15 THEN
DBMS_OUTPUT.PUT_LINE
('Section 1 of course 25 is full');
ELSE
DBMS_OUTPUT.PUT_LINE
('Section 1 of course 25 is not full');
END IF;
-- control resumes here
END;

--IF ELSIF ELSE EJEMPLO (ROSENZWEIG,B &  RAKHIMOV,E, p. 98).
-- ch04_3a.sql, version 1.0

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

IF v_final_grade BETWEEN 90 AND 100 THEN
	v_letter_grade := 'A';
ELSIF v_final_grade BETWEEN 80 AND 89 THEN
	v_letter_grade := 'B';
ELSIF v_final_grade BETWEEN 70 AND 79 THEN
	v_letter_grade := 'C';
ELSIF v_final_grade BETWEEN 60 AND 69 THEN
	v_letter_grade := 'D';
ELSE
	v_letter_grade := 'F';
END IF;

-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Letter grade is: '|| v_letter_grade);

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE ('There is no such student or section');
END;



spool OFF;
