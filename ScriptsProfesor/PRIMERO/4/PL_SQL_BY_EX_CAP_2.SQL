SPOOL C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\PRIMERO\4\PL_SQL_BY_EX_CAP_2.TXT
rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson.
rem ejercicios cap PL/SQL CONCEPTS
set pagesize 99
set linesize 130
set colsep '|=|'
set underline =
set null s/Datos
set feedback on 


rem [ROSENZWEIG &  RAKHIMOV,2009,27]
SET SERVEROUTPUT ON;
DECLARE
v_var1 VARCHAR2(20);
v_var2 VARCHAR2(6);
v_var3 NUMBER(5,3);
BEGIN
v_var1 := 'string literal';
v_var2 := '12.345';
v_var3 := 12.345;
DBMS_OUTPUT.PUT_LINE('v_var1: '||v_var1);
DBMS_OUTPUT.PUT_LINE('v_var2: '||v_var2);
DBMS_OUTPUT.PUT_LINE('v_var3: '||v_var3);
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,28]
SET SERVEROUTPUT ON;
DECLARE
v_var1 NUMBER(2) := 123;
v_var2 NUMBER(3) := 123;
v_var3 NUMBER(5,3) := 123456.123;
BEGIN
DBMS_OUTPUT.PUT_LINE('v_var1: '||v_var1);
DBMS_OUTPUT.PUT_LINE('v_var2: '||v_var2);
DBMS_OUTPUT.PUT_LINE('v_var3: '||v_var3);
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,31]
-- ch02_3a.sql
SET SERVEROUTPUT ON
DECLARE
v_cookies_amt NUMBER := 2;
v_calories_per_cookie CONSTANT NUMBER := 300;
BEGIN
DBMS_OUTPUT.PUT_LINE('I ate ' || v_cookies_amt ||
' cookies with ' || v_cookies_amt *
v_calories_per_cookie || ' calories.');
v_cookies_amt := 3;
DBMS_OUTPUT.PUT_LINE('I really ate ' ||
v_cookies_amt
|| ' cookies with ' || v_cookies_amt *
v_calories_per_cookie || ' calories.');
v_cookies_amt := v_cookies_amt + 5;
DBMS_OUTPUT.PUT_LINE('The truth is, I actually ate '
|| v_cookies_amt || ' cookies with ' ||
v_cookies_amt * v_calories_per_cookie
|| ' calories.');
END;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,33]
SET SERVEROUTPUT ON
DECLARE
v_lname VARCHAR2(30);
v_regdate DATE;
v_pctincr CONSTANT NUMBER(4,2) := 1.50;
v_counter NUMBER := 0;
v_new_cost course.cost%TYPE;
v_YorN BOOLEAN := TRUE;
BEGIN
v_counter := NVL(v_counter, 0) + 1;
v_new_cost := 800 * v_pctincr;
DBMS_OUTPUT.PUT_LINE(v_counter);
DBMS_OUTPUT.PUT_LINE(v_new_cost);
v_counter := ((v_counter + 5)*2) / 2;
v_new_cost := (v_new_cost * v_counter)/4;
DBMS_OUTPUT.PUT_LINE(v_counter);
DBMS_OUTPUT.PUT_LINE(v_new_cost);
END;
/

rem [ROSENZWEIG &  RAKHIMOV,2009,35]
-- ch02_4b.sql
SET SERVEROUTPUT ON
<< outer_block >>
DECLARE
v_test NUMBER := 123;
BEGIN
DBMS_OUTPUT.PUT_LINE
('Outer Block, v_test: '||v_test);
<< inner_block >>
DECLARE
v_test NUMBER := 456;
BEGIN
DBMS_OUTPUT.PUT_LINE
('Inner Block, v_test: '||v_test);
DBMS_OUTPUT.PUT_LINE
('Inner Block, outer_block.v_test: '||
Outer_block.v_test);
END inner_block;
END outer_block;
/
rem [ROSENZWEIG &  RAKHIMOV,2009,36]
-- ch02_5a.sql
SET SERVEROUTPUT ON
DECLARE
e_show_exception_scope EXCEPTION;
v_student_id NUMBER := 123;
BEGIN
DBMS_OUTPUT.PUT_LINE('outer student id is '
||v_student_id);
DECLARE
v_student_id VARCHAR2(8) := 125;
BEGIN
DBMS_OUTPUT.PUT_LINE('inner student id is '
||v_student_id);
RAISE e_show_exception_scope;
END;
EXCEPTION
WHEN e_show_exception_scope
THEN
DBMS_OUTPUT.PUT_LINE('When am I displayed?');
DBMS_OUTPUT.PUT_LINE('outer student id is '
||v_student_id);
END;
/
SPOOL OFF