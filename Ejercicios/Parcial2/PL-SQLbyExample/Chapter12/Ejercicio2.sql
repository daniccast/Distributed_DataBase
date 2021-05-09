spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter12\salida\ejercicio2chapter12.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 2 de mayo  de 2021                        *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                     *
rem *Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson.      *
rem **********************************************************
*/

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';
SET SERVEROUTPUT ON;

/*
What changes to the database take place if the following example is run? Explain specifically whatis being locked, as well as when it is locked and when it is released.
(ROSENZWEIG &  RAKHIMOV, 2009, )
*/

-- ch12_4a.sql
DECLARE
	CURSOR c_stud_zip IS
		SELECT s.student_id, z.city
		FROM student s, zipcode z
		WHERE z.city = 'Brooklyn'
		AND s.zip = z.zip
		FOR UPDATE OF phone;
BEGIN
	FOR r_stud_zip IN c_stud_zip
	LOOP
		UPDATE student
		SET phone = '718'||SUBSTR(phone,4)
		WHERE student_id = r_stud_zip.student_id;
	END LOOP;
END;



-- ch12_5a.sql
DECLARE
	CURSOR c_stud_zip IS
		SELECT s.student_id, z.city
		FROM student s, zipcode z
		WHERE z.city = 'Brooklyn'
		AND s.zip = z.zip
		FOR UPDATE OF phone;
BEGIN
	FOR r_stud_zip IN c_stud_zip
	LOOP
		DBMS_OUTPUT.PUT_LINE(r_stud_zip.student_id);
		UPDATE student
			SET phone = '718'||SUBSTR(phone,4)
			WHERE CURRENT OF c_stud_zip;
	END LOOP;
END;




spool OFF;
