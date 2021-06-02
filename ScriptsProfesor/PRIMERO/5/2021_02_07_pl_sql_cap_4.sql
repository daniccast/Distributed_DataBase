spool C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\PRIMERO\5\PL_SQL_cap_4.txt
-- ch04_1a.sql, version 1.0
SET SERVEROUTPUT ON
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

REM
rem [ROSENZWEIG &  RAKHIMOV,2009,62]	
-- ch04_2a.sql, version 1.0
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
		('El grupo 1 del curso 25 esta lleno');
		ELSE
		DBMS_OUTPUT.PUT_LINE
			('El grupo 1 del curso 25 no esta lleno');
		END IF;
-- control resumes here
END;
rem
rem [ROSENZWEIG &  RAKHIMOV,2009,44]	

DECLARE
	v_total NUMBER;
	v_students NUMBER;
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
		('Grupo 1 del curso 25 esta lleno');
	ELSE
		v_students := 15 - v_total;
		DBMS_OUTPUT.PUT_LINE (v_students||
		' estudiantes pueden inscribirse en el grupo 1'||
		' del curso 25');
	END IF;
-- control resumes here
END;
rem [ROSENZWEIG &  RAKHIMOV,2009,69]
-- ch04_3a.sql, version 1.0
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
		DBMS_OUTPUT.PUT_LINE ('Letter grade is: '||'La calificación es: '||
		v_letter_grade);
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE ('There is no such student or section');
		DBMS_OUTPUT.PUT_LINE ('No existe el estudiante o la seccion');
END;
rem 
rem [ROSENZWEIG &  RAKHIMOV,2009,72]


-- ch04_3c.sql, version 3.0
SET SERVEROUTPUT ON
DECLARE
	v_student_id NUMBER := &sv_student_id;
	v_section_id NUMBER := &sv_section_id;
	v_final_grade NUMBER;
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
		DBMS_OUTPUT.PUT_LINE ('Letter grade is: '||'La calificación es:'||
				v_letter_grade);
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE ('There is no such student or section');
		DBMS_OUTPUT.PUT_LINE ('No existe tal estudiante o seccion ');
END;


rem
rem
rem [ROSENZWEIG &  RAKHIMOV,2009,77]
-- ch04_4a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
	v_temp_in NUMBER := &sv_temp_in;
	v_scale_in CHAR := '&sv_scale_in';
	v_temp_out NUMBER;
	v_scale_out CHAR;
BEGIN
	IF v_scale_in != 'C' AND v_scale_in != 'F' THEN
		DBMS_OUTPUT.PUT_LINE ('This is not a valid scale');
	ELSE
		IF v_scale_in = 'C' THEN
			v_temp_out := ( (9 * v_temp_in) / 5 ) + 32;
			v_scale_out := 'F';
		ELSE
			v_temp_out := ( (v_temp_in - 32) * 5 ) / 9;
			v_scale_out := 'C';
		END IF;
	DBMS_OUTPUT.PUT_LINE ('New scale is: '||v_scale_out);
	DBMS_OUTPUT.PUT_LINE ('New temperature is: '||v_temp_out);
	END IF;
END;
SPOOL OFF
