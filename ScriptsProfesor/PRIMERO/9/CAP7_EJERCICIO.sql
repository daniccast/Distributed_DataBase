spool C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\PRIMERO\9\Cap7_bySQL.txt
rem [ROSENZWEIG &  RAKHIMOV,2009,84]
rem  uso de   IF  THEN   ELSE 
set pagesize 99
set linesize 130
set colsep '|=|'
set underline =
set null s/Datos
set feedback on 
SET SERVEROUTPUT ON



rem [ROSENZWEIG &  RAKHIMOV,2009,147]
-- ch07_1a.sql, version 1.0
SET SERVEROUTPUT ON

DECLARE
	v_counter BINARY_INTEGER := 0;
BEGIN
	LOOP
-- increment loop counter by one
		v_counter := v_counter + 1;
		-- EXTERNO
		DBMS_OUTPUT.PUT_LINE
			('EXTERNO '||'before continue condition, v_counter = '||
			v_counter);
-- if CONTINUE condition yields TRUE pass control to the
-- first executable statement of the loop
		IF v_counter < 3 THEN
			CONTINUE;
		END IF;
		-- INTERNO
		DBMS_OUTPUT.PUT_LINE
			(chr(10)||chr(9)||'INTERNO '||'after continue condition, v_counter = '||
			v_counter);
-- if EXIT condition yields TRUE exit the loop
		IF v_counter = 5 THEN
			EXIT;
		END IF;
	END LOOP;
-- control resumes here
	DBMS_OUTPUT.PUT_LINE (chr(10)||'Hola ESCOM '||'Done...');
END;
/
/*
rem [ROSENZWEIG &  RAKHIMOV,2009,149]
-- ch07_1b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
	v_counter BINARY_INTEGER := 0;
BEGIN
	LOOP
-- if EXIT condition yields TRUE exit the loop
		IF v_counter = 5 THEN
			EXIT;
		END IF;
-- if CONTINUE condition yields TRUE pass control to the
-- first executable statement of the loop
		IF v_counter > 3 THEN
			CONTINUE;
		END IF;
		DBMS_OUTPUT.PUT_LINE
			(chr(9)||'INTERNO '||'after continue condition, v_counter = '||
			v_counter);
	END LOOP;
-- control resumes here
	DBMS_OUTPUT.PUT_LINE (chr(10)|| 'Hola ESCOM '||'Done...');
END;
/
*/

-- ch07_1c.sql, version 3.0
SET SERVEROUTPUT ON
DECLARE
	v_counter BINARY_INTEGER := 0;
BEGIN
	LOOP
-- increment loop counter by one
		v_counter := v_counter + 1;
		DBMS_OUTPUT.PUT_LINE
			('EXTERNO '||'before continue condition, v_counter = '||
			v_counter);
-- if EXIT condition yields TRUE exit the loop
		IF v_counter = 5 THEN
			EXIT;
		END IF;
-- if CONTINUE condition yields TRUE pass control to the
-- first executable statement of the loop
		IF v_counter > 3 THEN
			CONTINUE;
		END IF;
		DBMS_OUTPUT.PUT_LINE
			(chr(9)||'INTERNO '||'after continue condition, v_counter = '||
			v_counter);
	END LOOP;
-- control resumes here
	DBMS_OUTPUT.PUT_LINE (chr(10)||'HOLA ESCOM  ' ||'Done...');
END;
/

rem [ROSENZWEIG &  RAKHIMOV,2009,151]
-- ch07_1d.sql, version 4.0
SET SERVEROUTPUT ON
DECLARE
	v_counter BINARY_INTEGER := 0;
BEGIN
	LOOP
-- increment loop counter by one
	v_counter := v_counter + 1;
	DBMS_OUTPUT.PUT_LINE
		('EXTERNO '||'before continue condition, v_counter = '||
		v_counter);
-- if CONTINUE condition yields TRUE pass control to the
-- first executable statement of the loop
	CONTINUE WHEN v_counter < 3;
	DBMS_OUTPUT.PUT_LINE
		(chr(9)||'INTERNO '||'after continue condition, v_counter = '||
		v_counter);
-- if EXIT condition yields TRUE exit the loop
	IF v_counter = 5 THEN
		EXIT;
	END IF;
	END LOOP;
-- control resumes here
	DBMS_OUTPUT.PUT_LINE (chr(10)||'Hola ESCOM '||'Done...');
END;
/

rem [ROSENZWEIG &  RAKHIMOV,2009,161]
-- ch07_2a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
	v_sum NUMBER := 0;
BEGIN
	FOR v_counter in 1..10 LOOP
-- if v_counter is odd, pass control to the top of the loop
		CONTINUE WHEN mod(v_counter, 2) != 0;
		v_sum := v_sum + v_counter;
		DBMS_OUTPUT.PUT_LINE ('Current sum is: '||v_sum);
	END LOOP;
-- control resumes here
	DBMS_OUTPUT.PUT_LINE ('Final sum is: '||v_sum);
END;
/

-- ch07_2b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
	v_sum NUMBER := 0;
BEGIN
	FOR v_counter in 1..10 LOOP
-- if v_counter is even, pass control to the top of the loop
		CONTINUE WHEN mod(v_counter, 2) = 0;
		v_sum := v_sum + v_counter;
		DBMS_OUTPUT.PUT_LINE ('Current sum is: '||v_sum);
	END LOOP;
-- control resumes here
	DBMS_OUTPUT.PUT_LINE ('Final sum is: '||v_sum);
END;
/

rem [ROSENZWEIG &  RAKHIMOV,2009,154]
DECLARE
	v_counter1 INTEGER := 0;
	v_counter2 INTEGER;
BEGIN
	WHILE v_counter1 < 3 LOOP
		DBMS_OUTPUT.PUT_LINE ('EXTERNO  '||'v_counter1: '||v_counter1);
		v_counter2 := 0;
		LOOP
			DBMS_OUTPUT.PUT_LINE (chr(9)||'INTERNO  '||'v_counter2: '||v_counter2);
			v_counter2 := v_counter2 + 1;
			EXIT WHEN v_counter2 >= 2;
		END LOOP;	
		v_counter1 := v_counter1 + 1;
	END LOOP;
END;
/

rem [ROSENZWEIG &  RAKHIMOV,2009,156]
BEGIN
	<<outer_loop>>
	FOR i IN 1..3 LOOP
		DBMS_OUTPUT.PUT_LINE ('EXTERNO '||'i = '||i);
		<<inner_loop>>
		FOR j IN 1..2 LOOP
			DBMS_OUTPUT.PUT_LINE (chr(9)||'INTERNO '||'j = '||j);
		END LOOP inner_loop;
	END LOOP outer_loop;
END;
rem [ROSENZWEIG &  RAKHIMOV,2009,157]
BEGIN
	<<outer>>
	FOR v_counter IN 1..3 LOOP
		<<inner>>
		FOR v_counter IN 1..2 LOOP
			DBMS_OUTPUT.PUT_LINE ('EXTERNO '||'outer.v_counter '||outer.v_counter);
			DBMS_OUTPUT.PUT_LINE (chr(9)||'INTERNO '||'inner.v_counter '||inner.v_counter);
		END LOOP inner;
	END LOOP outer;
END;
/

-- ch07_3a.sql, version 1.0
SET SERVEROUTPUT ON
DECLARE
	v_test NUMBER := 0;
BEGIN
	<<outer_loop>>
	FOR i IN 1..3 LOOP
		DBMS_OUTPUT.PUT_LINE('Outer Loop');
		DBMS_OUTPUT.PUT_LINE('i = '||i);
		DBMS_OUTPUT.PUT_LINE('v_test = '||v_test);
		v_test := v_test + 1;
		<<inner_loop>>
			FOR j IN 1..2 LOOP
				DBMS_OUTPUT.PUT_LINE('Inner Loop');
				DBMS_OUTPUT.PUT_LINE('j = '||j);
				DBMS_OUTPUT.PUT_LINE('i = '||i);
				DBMS_OUTPUT.PUT_LINE('v_test = '||v_test);
			END LOOP inner_loop;
	END LOOP outer_loop;
END;
/

-- ch07_3b.sql, version 2.0
SET SERVEROUTPUT ON
DECLARE
	v_test NUMBER := 0;
BEGIN
	<<outer_loop>>
	FOR i IN REVERSE 1..3 LOOP
		DBMS_OUTPUT.PUT_LINE('Outer Loop');
		DBMS_OUTPUT.PUT_LINE('i = '||i);
		DBMS_OUTPUT.PUT_LINE('v_test = '||v_test);
		v_test := v_test + 1;
		<<inner_loop>>
		FOR j IN REVERSE 1..2 LOOP
			DBMS_OUTPUT.PUT_LINE('Inner Loop');
			DBMS_OUTPUT.PUT_LINE('j = '||j);
			DBMS_OUTPUT.PUT_LINE('i = '||i);
			DBMS_OUTPUT.PUT_LINE('v_test = '||v_test);
		END LOOP inner_loop;
	END LOOP outer_loop;
END;
/
SPOOL OFF