spool C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\PRIMERO\8\Cap8_bySQL.txt
--spool C:\Users\ORA_bases\2021_02_24_clase_2\salida\PL_SQL_cap_7.txt
rem [ROSENZWEIG &  RAKHIMOV,2009,84]
rem  uso de   IF  THEN   ELSE 
set pagesize 99
set linesize 130
set colsep '|=|'
set underline =
set null s/Datos
set feedback on 
SET SERVEROUTPUT ON

rem ERRORES

rem [ROSENZWEIG &  RAKHIMOV,2009,147]
DECLARE
	v_num1 INTEGER := &sv_num1;
	v_num2 INTEGER := &sv_num2;
	v_result NUMBER;
BEGIN
	v_result := v_num1 / v_num2;
	DBMS_OUTPUT.PUT_LINE ('v_result: '||v_result);
EXCEPTION
	WHEN ZERO_DIVIDE THEN
		DBMS_OUTPUT.PUT_LINE ('A number cannot be divided by zero.');
END;
/
-- ------------------------------------
/*

REM WARNING.!!! NO EJECUTARLO DE ESTA FORMA 
REM POR QUE PRODUCE UN ERROR EN EL MICROPROCESADOR
DECLARE
	v_num1 INTEGER := &sv_num1;
	v_num2 INTEGER := &sv_num2;
	v_result NUMBER;
BEGIN
	v_result := v_num1 / v_num2;
	DBMS_OUTPUT.PUT_LINE ('v_result: '||v_result);
END;
/
*/

-- ch08_1a.sql, version 1.0
SET SERVEROUTPUT ON;
DECLARE
	v_num NUMBER := &sv_num;
BEGIN
	DBMS_OUTPUT.PUT_LINE ('Square root of '||v_num||
		' is '||SQRT(v_num));
	EXCEPTION
		WHEN VALUE_ERROR THEN
			DBMS_OUTPUT.PUT_LINE ('An error has occurred');
END;
/
-- ch08_1b.sql, version 2.0
SET SERVEROUTPUT ON;
DECLARE
v_num NUMBER := &sv_num;
BEGIN
IF v_num >= 0 THEN
DBMS_OUTPUT.PUT_LINE ('Square root of '||v_num||
' is '||SQRT(v_num));
ELSE
DBMS_OUTPUT.PUT_LINE ('A number cannot be negative');
END IF;
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,171]
DECLARE
	v_student_id NUMBER := &sv_student_id;
	v_enrolled VARCHAR2(3) := 'NO';
BEGIN
	DBMS_OUTPUT.PUT_LINE ('Check if the student is enrolled');
	SELECT 'YES'
		INTO v_enrolled
		FROM enrollment
	WHERE student_id = v_student_id;
	DBMS_OUTPUT.PUT_LINE ('The student is enrolled into one course');
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE ('The student is not enrolled');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE
			('The student is enrolled in too many courses');
END;
/
DECLARE
	v_instructor_id NUMBER := &sv_instructor_id;
	v_instructor_name VARCHAR2(50);
BEGIN
	SELECT first_name||' '||last_name
		INTO v_instructor_name
		FROM instructor
		WHERE instructor_id = v_instructor_id;
		DBMS_OUTPUT.PUT_LINE ('Instructor name is '||v_instructor_name);
	EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE ('An error has occurred');
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,175]
-- ch08_2a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
	v_exists NUMBER(1);
	v_total_students NUMBER(1);
	v_zip CHAR(5):= '&sv_zip';
BEGIN
	SELECT count(*)
		INTO v_exists
		FROM zipcode
		WHERE zip = v_zip;
	IF v_exists != 0 THEN
		SELECT COUNT(*)
			INTO v_total_students
			FROM student
		WHERE zip = v_zip;
		DBMS_OUTPUT.PUT_LINE
			('There are '||v_total_students||' students');
	ELSE
		DBMS_OUTPUT.PUT_LINE (v_zip||' is not a valid zip');
	END IF;
EXCEPTION
	WHEN VALUE_ERROR OR INVALID_NUMBER THEN
		DBMS_OUTPUT.PUT_LINE ('An error has occurred');
END;
/

-- ch08_2b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
	v_exists NUMBER(1);
	v_student_name VARCHAR2(30);
	v_zip CHAR(5):= '&sv_zip';
BEGIN
	SELECT count(*)
		INTO v_exists
		FROM zipcode
		WHERE zip = v_zip;
	IF v_exists != 0 THEN
		SELECT first_name||' '||last_name
		INTO v_student_name
		FROM student
		WHERE zip = v_zip
			AND rownum = 1;
		DBMS_OUTPUT.PUT_LINE ('Student name is '||v_student_name);
	ELSE
		DBMS_OUTPUT.PUT_LINE (v_zip||' is not a valid zip');
	END IF;
EXCEPTION
	WHEN VALUE_ERROR OR INVALID_NUMBER THEN
		DBMS_OUTPUT.PUT_LINE ('An error has occurred');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE
			('There are no students for this value of zip code');
END;
/
SPOOL OFF