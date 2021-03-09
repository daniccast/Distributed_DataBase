SPOOL C:\Users\ORA_bases\2021_02_24_clase_2\salida\PL_SQL_BY_EX_CAP_1.TXT
rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson.
rem ejercicios cap PL/SQL CONCEPTS
set pagesize 99
set linesize 130
set colsep '|=|'
set underline =
set null s/Datos
set feedback on 


rem [ROSENZWEIG &  RAKHIMOV,2009,7]
-- código ejecutable 
SET SERVEROUTPUT ON
DECLARE
v_first_name VARCHAR2(35);
v_last_name VARCHAR2(35);
BEGIN
SELECT first_name, last_name
INTO v_first_name, v_last_name
FROM student
WHERE student_id = 123;
DBMS_OUTPUT.PUT_LINE (chr(10)||chr(10)||chr(10)||chr(9)||chr(7)||
					  'Student name: '||v_first_name||' -->  '||v_last_name
					  ||chr(10)||
					  chr(10)||
					  chr(10));
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE ('There is no student with '||
'student id 123');
END;

------------------------------------------
rem consultas previas 

select student_id, last_name, first_name
	from student
	where rownum <= 25
	order by 1 ;
	
----------
rem consultar un una matricula que no existe
SET SERVEROUTPUT ON
DECLARE
v_first_name VARCHAR2(35);
v_last_name VARCHAR2(35);
BEGIN
SELECT first_name, last_name
INTO v_first_name, v_last_name
FROM student
WHERE student_id = 115;
DBMS_OUTPUT.PUT_LINE (chr(10)||chr(10)||chr(10)||chr(9)||chr(7)||
					  'Student name: '||v_first_name||' -->  '||v_last_name
					  ||chr(10)||
					  chr(10)||
					  chr(10));
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE ('No  hay estudiante con el número : ---> '||
'student id -->   115');
END;
/
------------------------------------------
rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson.
rem [ROSENZWEIG, 2009, p 8] 
---
DECLARE
v_name VARCHAR2(50);
v_total NUMBER;
BEGIN
SELECT i.first_name||' '||i.last_name, COUNT(*)
INTO v_name, v_total
FROM instructor i, section s
WHERE i.instructor_id = s.instructor_id
AND i.instructor_id = 102
GROUP BY i.first_name||' '||i.last_name;
DBMS_OUTPUT.PUT_LINE
('Instructor : --> '||v_name||' imparte --> :  '||v_total||' cursos');
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE ('El instructor no existe  --> :');
END;
/
----
DECLARE
v_name VARCHAR2(50);
v_total NUMBER;
BEGIN
SELECT i.first_name||' '||i.last_name, COUNT(*)
INTO v_name, v_total
FROM instructor i, section s
WHERE i.instructor_id = s.instructor_id
AND i.instructor_id = 113
GROUP BY i.first_name||' '||i.last_name;
DBMS_OUTPUT.PUT_LINE
('Instructor : --> '||v_name||' imparte --> :  '||v_total||' cursos');
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE ('El instructor no existe  --> :');
END;
/


rem consultas previas 

select instructor_id, first_name,last_name
	from instructor;
------------------------------------
rem [ROSENZWEIG &  RAKHIMOV,2009,13]
DECLARE
v_student_id NUMBER := &sv_student_id;
v_first_name VARCHAR2(35);
v_last_name VARCHAR2(35);
BEGIN
SELECT first_name, last_name
INTO v_first_name, v_last_name
FROM student
WHERE student_id = v_student_id;
DBMS_OUTPUT.PUT_LINE (chr(10)||chr(10)||chr(10)||chr(9)||
						'Student name: '||v_first_name||' '||
v_last_name);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE (chr(10)||chr(10)||chr(10)||chr(9)||
						'There is no such student');
END;
/
rem probar con el alumno 110
rem probar con 121
rem probar con 125
rem probar  con 134





rem [ROSENZWEIG &  RAKHIMOV,2009,16]
-- ch01_1a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
v_num NUMBER := &&sv_num;
v_result NUMBER;
BEGIN
v_result := POWER(v_num, 2);
DBMS_OUTPUT.PUT_LINE ('The value of v_result is: '||
v_result);
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,17]
-- ch01_2a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
v_day VARCHAR2(20);
BEGIN
v_day := TO_CHAR(SYSDATE, 'Day');
DBMS_OUTPUT.PUT_LINE ('Today is '||v_day);
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,18]
-- ch01_2b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
v_day VARCHAR2(20);
BEGIN
v_day := TO_CHAR(SYSDATE, 'Day, HH24:MI');
DBMS_OUTPUT.PUT_LINE ('Today is '|| v_day);
END;
/
-- ch01_2b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
v_day VARCHAR2(20);
BEGIN
v_day := TO_CHAR(SYSDATE, 'DY, HH24:MI');
DBMS_OUTPUT.PUT_LINE ('Today is '|| v_day);
END;
/
DECLARE
v_day VARCHAR2(20);
BEGIN
v_day := TO_CHAR(SYSDATE, 'DY, HH24:MI');
DBMS_OUTPUT.PUT_LINE ('Today is '|| v_day);
END;
/
DECLARE
v_day VARCHAR2(20);
BEGIN
v_day := TO_CHAR(SYSDATE, 'SSSSS, HH24:MI');
DBMS_OUTPUT.PUT_LINE ('Today is '|| v_day);
END;
/
DECLARE
v_day VARCHAR2(20);
BEGIN
v_day := TO_CHAR(SYSDATE, 'W, HH24:MI');
DBMS_OUTPUT.PUT_LINE ('Today is '|| v_day);
END;
/

DECLARE
v_day VARCHAR2(20);
BEGIN
v_day := TO_CHAR(SYSDATE, 'WW, HH24:MI');
DBMS_OUTPUT.PUT_LINE ('Today is '|| v_day);
END;
/
DECLARE
v_day VARCHAR2(20);
BEGIN
v_day := TO_CHAR(SYSDATE, 'TS, HH24:MI');
DBMS_OUTPUT.PUT_LINE ('Today is '|| v_day);
END;
/
DECLARE
v_day VARCHAR2(20);
BEGIN
v_day := TO_CHAR(SYSDATE, 'DDD, HH24:MI');
DBMS_OUTPUT.PUT_LINE ('Today is '|| v_day);
END;
/

DECLARE
v_day VARCHAR2(60);
BEGIN
v_day := TO_CHAR(SYSDATE, 'DL');
DBMS_OUTPUT.PUT_LINE ('Today is '|| v_day);
END;
/
SPOOL OFF 