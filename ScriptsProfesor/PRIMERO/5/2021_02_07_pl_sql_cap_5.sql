spool C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\PRIMERO\5\PL_SQL_cap_5.txt
rem [ROSENZWEIG &  RAKHIMOV,2009,84]
rem  uso de   IF  THEN   ELSE 
set pagesize 99
set linesize 130
set colsep '|=|'
set underline =
set null s/Datos
set feedback on 
SET SERVEROUTPUT ON
DECLARE
	v_num NUMBER := &sv_user_num;
	v_num_flag NUMBER;
BEGIN
	v_num_flag := MOD(v_num,2);
-- test if the number provided by the user is even
	CASE v_num_flag
		WHEN 0 THEN
			DBMS_OUTPUT.PUT_LINE ( chr(10)||chr(9)||
			v_num||’ is even number’||'ES UN NUMERO PAR');
		ELSE
			DBMS_OUTPUT.PUT_LINE ( chr(10)||chr(9)||
			v_num||’ is odd number’||'ES UN NUMERO IMPAR');						
		END CASE;
	DBMS_OUTPUT.PUT_LINE ('Done');
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,89]
rem    uso de la sentencia CASE
-- ch05_1a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
v_date DATE := TO_DATE('&sv_user_date', 'DD/MM/YYYY');
v_day VARCHAR2(1);
BEGIN
v_day := TO_CHAR(v_date, 'D');
DBMS_OUTPUT.PUT_LINE (chr(10)||chr(9)||'Hola ESCOM');
CASE v_day
WHEN '1' THEN
DBMS_OUTPUT.PUT_LINE (chr(9)||'Today is Sunday');
WHEN '2' THEN
DBMS_OUTPUT.PUT_LINE (chr(9)||'Today is Monday');
WHEN '3' THEN
DBMS_OUTPUT.PUT_LINE (chr(9)||'Today is Tuesday');
WHEN '4' THEN
DBMS_OUTPUT.PUT_LINE (chr(9)||'Today is Wednesday');
WHEN '5' THEN
DBMS_OUTPUT.PUT_LINE (chr(9)||'Today is Thursday');
WHEN '6' THEN
DBMS_OUTPUT.PUT_LINE (chr(9)||'Today is Friday');
WHEN '7' THEN
DBMS_OUTPUT.PUT_LINE (chr(9)||'Today is Saturday');
END CASE;
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,89]
rem    uso de la sentencia CASE sin declarar variable 

SET SERVEROUTPUT ON
DECLARE
v_date DATE := TO_DATE('&sv_user_date', 'DD-MON-YYYY');
BEGIN
DBMS_OUTPUT.PUT_LINE (chr(10)||chr(9)||'Hola ESCOM'||chr(10)||chr(10));
CASE
WHEN TO_CHAR(v_date, 'D') = '1' THEN
DBMS_OUTPUT.PUT_LINE (CHR(9)||'Today is Sunday');
WHEN TO_CHAR(v_date, 'D') = '2' THEN
DBMS_OUTPUT.PUT_LINE (CHR(9)||'Today is Monday');
WHEN TO_CHAR(v_date, 'D') = '3' THEN
DBMS_OUTPUT.PUT_LINE (CHR(9)||'Today is Tuesday');
WHEN TO_CHAR(v_date, 'D') = '4' THEN
DBMS_OUTPUT.PUT_LINE (CHR(9)||'Today is Wednesday');
WHEN TO_CHAR(v_date, 'D') = '5' THEN
DBMS_OUTPUT.PUT_LINE (CHR(9)||'Today is Thursday');
WHEN TO_CHAR(v_date, 'D') = '6' THEN
DBMS_OUTPUT.PUT_LINE (CHR(9)||'Today is Friday');
WHEN TO_CHAR(v_date, 'D') = '7' THEN
DBMS_OUTPUT.PUT_LINE (CHR(9)||'Today is Saturday');
END CASE;
END;
/



rem [ROSENZWEIG &  RAKHIMOV,2009,91]
REM USO DE LA SENTENCIA CASE
-- ch05_2a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
	v_student_id NUMBER := 102;
	v_section_id NUMBER := 89;
	v_final_grade NUMBER;
	v_letter_grade CHAR(1);
BEGIN
	SELECT final_grade
		INTO v_final_grade
	FROM enrollment
	WHERE student_id = v_student_id
		AND section_id = v_section_id;
CASE
	WHEN v_final_grade >= 90 THEN v_letter_grade := 'A';
	WHEN v_final_grade >= 80 THEN v_letter_grade := 'B';
	WHEN v_final_grade >= 70 THEN v_letter_grade := 'C';
	WHEN v_final_grade >= 60 THEN v_letter_grade := 'D';
	ELSE v_letter_grade := 'F';
	END CASE;
-- control resumes here
	DBMS_OUTPUT.PUT_LINE ('Letter grade is: '||v_letter_grade);
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,93]
REM USO DE LA SENTENCIA CASE
REM SE INCLUYE EL CODIGO PARA EL NULL VALUE 
-- ch05_2b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
v_student_id NUMBER := &sv_student_id;
v_section_id NUMBER := 89;
v_final_grade NUMBER;
v_letter_grade CHAR(1);
BEGIN
	SELECT final_grade
		INTO v_final_grade
		FROM enrollment
		WHERE student_id = v_student_id
		AND section_id = v_section_id;
	CASE -- outer CASE
		WHEN v_final_grade IS NULL THEN
			DBMS_OUTPUT.PUT_LINE ('There is no final grade.');
			DBMS_OUTPUT.PUT_LINE ('NO HAY CALIFICACION DSIPONIBLE');
			ELSE
		CASE -- inner CASE
			WHEN v_final_grade >= 90 THEN v_letter_grade := 'A';
			WHEN v_final_grade >= 80 THEN v_letter_grade := 'B';
			WHEN v_final_grade >= 70 THEN v_letter_grade := 'C';
			WHEN v_final_grade >= 60 THEN v_letter_grade := 'D';
			ELSE v_letter_grade := 'F';
		END CASE;
-- control resumes here after inner CASE terminates
--DBMS_OUTPUT.PUT_LINE ('Letter grade is: '||v_letter_grade);
-- control resumes here after OUTER CASE terminates
END CASE;
END;
/

rem [ROSENZWEIG &  RAKHIMOV,2009,94]

-- ch05_2c.sql, version 3.0
SET SERVEROUTPUT ON
DECLARE
v_student_id NUMBER := 102;
v_section_id NUMBER := 89;
v_final_grade NUMBER;
v_letter_grade CHAR(1);
BEGIN
SELECT final_grade
INTO v_final_grade
FROM enrollment
WHERE student_id = v_student_id
AND section_id = v_section_id;
CASE
WHEN v_final_grade >= 60 THEN v_letter_grade := 'D';
WHEN v_final_grade >= 70 THEN v_letter_grade := 'C';
WHEN v_final_grade >= 80 THEN v_letter_grade := 'B';
WHEN v_final_grade >= 90 THEN v_letter_grade := 'A';
ELSE v_letter_grade := 'F';
END CASE;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Letter grade is: '||v_letter_grade);
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,97]
DECLARE
v_course_no NUMBER;
v_description VARCHAR2(50);
v_prereq VARCHAR2(35);
BEGIN
	SELECT course_no, description,
	CASE
		WHEN prerequisite IS NULL THEN
			'No prerequisite course required'
		ELSE TO_CHAR(prerequisite)
	END prerequisite
		INTO v_course_no, v_description, v_prereq
	FROM course
	WHERE course_no = 20;
			DBMS_OUTPUT.PUT_LINE ('Course: '||v_course_no);
			DBMS_OUTPUT.PUT_LINE ('Description: '||v_description);
		DBMS_OUTPUT.PUT_LINE ('Prerequisite: '||v_prereq);
	END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,100]
-- ch05_3a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
v_student_id NUMBER := 102;
v_section_id NUMBER := 89;
v_final_grade NUMBER;
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
DBMS_OUTPUT.PUT_LINE ('Letter grade is: '||v_letter_grade);
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,101]
REM REESCRIBIR UTILIZANDO UNA VARIABLE PARA LA CALIFICACION
-- ch05_3b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
v_student_id NUMBER := 102;
v_section_id NUMBER := 89;
v_letter_grade CHAR(1);
BEGIN
SELECT CASE
WHEN final_grade >= 90 THEN 'A'
WHEN final_grade >= 80 THEN 'B'
WHEN final_grade >= 70 THEN 'C'
WHEN final_grade >= 60 THEN 'D'
ELSE 'F'
END
INTO v_letter_grade
FROM enrollment
WHERE student_id = v_student_id
AND section_id = v_section_id;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Letter grade is: '||v_letter_grade);
END;
/


REM    CASE    EXPRESSIONS 

rem [ROSENZWEIG &  RAKHIMOV,2009,107]
-- ch05_4a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
v_final_grade NUMBER;
BEGIN
SELECT CASE
WHEN e.final_grade = g.numeric_grade THEN NULL
ELSE g.numeric_grade
END
INTO v_final_grade
FROM enrollment e
JOIN grade g
ON (e.student_id = g.student_id
AND e.section_id = g.section_id)
WHERE e.student_id = 102
AND e.section_id = 86
AND g.grade_type_code = 'FI';
DBMS_OUTPUT.PUT_LINE ('Final grade: '||v_final_grade);
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,108]

-- ch05_4b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
v_final_grade NUMBER;
BEGIN
SELECT NULLIF(g.numeric_grade, e.final_grade)
INTO v_final_grade
FROM enrollment e
JOIN grade g
ON (e.student_id = g.student_id
AND e.section_id = g.section_id)
WHERE e.student_id = 102
AND e.section_id = 86
AND g.grade_type_code = 'FI';
DBMS_OUTPUT.PUT_LINE ('Final grade: '||v_final_grade);
END;
/



rem [ROSENZWEIG &  RAKHIMOV,2009,109]
-- ch05_5a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
v_num1 NUMBER := &sv_num1;
v_num2 NUMBER := &sv_num2;
v_num3 NUMBER := &sv_num3;
v_result NUMBER;
BEGIN
v_result := CASE
WHEN v_num1 IS NOT NULL THEN v_num1
ELSE
CASE
WHEN v_num2 IS NOT NULL THEN v_num2
ELSE v_num3
END
END;
DBMS_OUTPUT.PUT_LINE ('Result: '||v_result);
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,109]
-- ch05_4b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
v_final_grade NUMBER;
BEGIN
SELECT NULLIF(g.numeric_grade, e.final_grade)
INTO v_final_grade
FROM enrollment e
JOIN grade g
ON (e.student_id = g.student_id
AND e.section_id = g.section_id)
WHERE e.student_id = 102
AND e.section_id = 86
AND g.grade_type_code = 'FI';
DBMS_OUTPUT.PUT_LINE ('Final grade: '||v_final_grade);
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,109]
-- ch05_4c.sql, version 3.0
SET SERVEROUTPUT ON
DECLARE
v_final_grade NUMBER;
BEGIN
SELECT NULLIF(e.final_grade, g.numeric_grade)
INTO v_final_grade
FROM enrollment e
JOIN grade g
ON (e.student_id = g.student_id
AND e.section_id = g.section_id)
WHERE e.student_id = 102
AND e.section_id = 86
AND g.grade_type_code = 'FI';
DBMS_OUTPUT.PUT_LINE ('Final grade: '||v_final_grade);
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,110]
-- ch05_5a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
v_num1 NUMBER := &sv_num1;
v_num2 NUMBER := &sv_num2;
v_num3 NUMBER := &sv_num3;
v_result NUMBER;
BEGIN
v_result := CASE
WHEN v_num1 IS NOT NULL THEN v_num1
ELSE
CASE
WHEN v_num2 IS NOT NULL THEN v_num2
ELSE v_num3
END
END;
DBMS_OUTPUT.PUT_LINE ('Result: '||v_result);
END;
/
SPOOL OFF

