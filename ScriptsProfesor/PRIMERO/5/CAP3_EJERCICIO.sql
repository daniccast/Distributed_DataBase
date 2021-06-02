spool C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\PRIMERO\5\PL_SQL_caP3_EJERCICIO.txt

rem ROSENZWEIG,B &  RAKHIMOV,E (2009).Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson.
rem ejercicios cap PL/SQL CONCEPTS
set pagesize 99
set linesize 130
set colsep '|=|'
set underline =
set null s/Datos
set feedback on 


rem [ROSENZWEIG &  RAKHIMOV,2009,42]
-- ch03_1a.sql
SET SERVEROUTPUT ON
DECLARE
v_average_cost VARCHAR2(10);
BEGIN
SELECT TO_CHAR(AVG(cost), '$9,999.99')
INTO v_average_cost
FROM course;
DBMS_OUTPUT.PUT_LINE( chr(10)||chr(9)||'The average cost of a '||
'course in the CTA program is '||
v_average_cost);
END;
/

-------
-- ch03_2a.sql
DECLARE
v_city zipcode.city%TYPE;
BEGIN
SELECT 'COLUMBUS'
INTO v_city
FROM dual;
UPDATE zipcode
SET city = v_city
WHERE ZIP = 43224;
END;
/

-- ch03_3a.sql
DECLARE
v_zip zipcode.zip%TYPE;
v_user zipcode.created_by%TYPE;
v_date zipcode.created_date%TYPE;
BEGIN
SELECT 43438, USER, SYSDATE
INTO v_zip, v_user, v_date
FROM dual;
INSERT INTO zipcode
(ZIP, CREATED_BY ,CREATED_DATE, MODIFIED_BY,
MODIFIED_DATE
)
VALUES(v_zip, v_user, v_date, v_user, v_date);
END;
/
------
-- ch03_4a.sql
DECLARE
v_max_id number;
BEGIN
SELECT MAX(student_id)
INTO v_max_id
FROM student;
INSERT into student
(student_id, last_name, zip,
created_by, created_date,
modified_by, modified_date,
registration_date
)
VALUES (STUDENT_ID_SEQ.NEXTVAL, 'Rosenzweig',
11238, 'BROSENZ ', '01-JAN-99',
'BROSENZ', '01-01-99', '01-01-99'
);
END;
/
SELECT student_id
FROM student;

rem cambiar formato de lenguaje 

SELECT MAX(student_id)
FROM student;

DECLARE
v_max_id number;
BEGIN
SELECT MAX(student_id)
INTO v_max_id
FROM student;
INSERT into student
(student_id, last_name, zip,
created_by, created_date,
modified_by, modified_date,
registration_date
)
VALUES (STUDENT_ID_SEQ.NEXTVAL, 'Ordoñez',
11238, 'Dayann ', '31-JAN-21',
'Dayann', '31-JAN-21', '31-JAN-21'
);
END;
/

SELECT student_id, first_name, last_name, registration_date, created_by, created_date
FROM student
ORDER BY 1;

DECLARE
v_max_id number;
BEGIN
SELECT MAX(student_id)
INTO v_max_id
FROM student;
INSERT into student
(student_id, first_name, last_name, zip,
created_by, created_date,
modified_by, modified_date,
registration_date
)
VALUES (STUDENT_ID_SEQ.NEXTVAL,' Dayann','Ordoñez',
11238, 'Dayann ', '31-JAN-21',
'Dayann', '31-JAN-21', '31-JAN-21'
);
END;
/
-------------------
rem [ROSENZWEIG &  RAKHIMOV,2009,44]
-- ch03_3a.sql
CREATE TABLE test01 (col1 number);
CREATE SEQUENCE test_seq
INCREMENT BY 5;
BEGIN
INSERT INTO test01
VALUES (test_seq.NEXTVAL);
END;
/
Select * FROM test01;
SELECT test_seq.CURRVAL FROM DUAL;
SELECT test_seq.NEXTVAL FROM DUAL;
--------------
-- ch03_5a.sql
DECLARE
v_user student.created_by%TYPE;
v_date student.created_date%TYPE;
BEGIN
SELECT USER, sysdate
INTO v_user, v_date
FROM dual;
INSERT INTO student
(student_id, last_name, zip,
created_by, created_date, modified_by,
modified_date, registration_date
)
VALUES (student_id_seq.nextval, 'Smith',
11238, v_user, v_date, v_user, v_date,
v_date
);
END;
/

SELECT student_id_seq.CURRVAL FROM dual;
--------------------------------------------------------
rem [ROSENZWEIG &  RAKHIMOV,2009,46]

-- ch03_6a.sql
BEGIN
-- STEP 1
UPDATE course
SET cost = cost - (cost * 0.10)
WHERE prerequisite IS NULL;
-- STEP 2
UPDATE course
SET cost = cost + (cost * 0.10)
WHERE prerequisite IS NOT NULL;
END;
/

SELECT COURSE_NO, DESCRIPTION, COST, PREREQUISITE FROM COURSE;
SELECT DISTINCT COST FROM COURSE;

rem deshace los cambios
ROLLBACK;
rem hace los cambios permanentes
COMMIT;

------------------------------------------------------------
rem [ROSENZWEIG &  RAKHIMOV,2009,48]
-- ch03_7a.sql
BEGIN
INSERT INTO student
( student_id, Last_name, zip, registration_date,
created_by, created_date, modified_by,
modified_date
)
VALUES ( student_id_seq.nextval, 'Tashi', 10015,
'01-JAN-99', 'STUDENTA', '01-JAN-99',
'STUDENTA','01-JAN-99'
);
SAVEPOINT A;
INSERT INTO student
( student_id, Last_name, zip, registration_date,
created_by, created_date, modified_by,
modified_date
)
VALUES (student_id_seq.nextval, 'Sonam', 10015,
'01-JAN-99', 'STUDENTB','01-JAN-99',
'STUDENTB', '01-JAN-99'
);
SAVEPOINT B;
INSERT INTO student
( student_id, Last_name, zip, registration_date,
created_by, created_date, modified_by,
modified_date
)
VALUES (student_id_seq.nextval, 'Norbu', 10015,
'01-JAN-99', 'STUDENTB', '01-JAN-99',
'STUDENTB', '01-JAN-99'
);
SAVEPOINT C;
ROLLBACK TO B;
END;
/
rem verificamos que el ultimo estudiante si se registro pero
rem por el SAVEPOINT al punto B, ya no se registro
SELECT student_id, first_name, last_name, registration_date, created_by, created_date
FROM student
ORDER BY 1;

--------------------------
rem [ROSENZWEIG &  RAKHIMOV,2009,50] 
DECLARE
	v_Counter NUMBER;
BEGIN
	v_counter := 0;
	FOR i IN 1..100
	LOOP
		v_counter := v_counter + 1;
		IF v_counter = 10
		THEN
			DBMS_OUTPUT.PUT_LINE( chr(10)||chr(9)||'RESULTADO'||
'PARCIAL '|| v_Counter);
			COMMIT;
			v_counter := 0;
		END IF;
	END LOOP;
DBMS_OUTPUT.PUT_LINE( chr(10)||chr(9)||'RESULTADO'||
'ESTAMOS EN ESCOM '||
v_Counter);
END;
/
rem un displAy es el DBMS_OUTPUT....
spool off