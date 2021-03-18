spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter3\salida\ejercicio3chapter3.txt
/*
rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *                 
rem * Realizado el 13 de Marzo de 2021                  *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                *
rem *Oracle® PL/SQLby Example,Boston,MA,USA:Perarson. *
rem *****************************************************
*/

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';

/*
log into the STUDENT schema and enter the following text exactly as it appears here. (Optionally, you
can write the PL/SQL block in a text file and then run the script from the SQL*Plus prompt.) (ROSENZWEIG,B &  RAKHIMOV,E, p. 78)
*/

BEGIN
INSERT INTO student(student_id, Last_name, zip, registration_date, created_by, created_date, modified_by,modified_date)
VALUES ( student_id_seq.nextval, 'Tashi', 10015,'01-JAN-99','STUDENTA', '01-JAN-99','STUDENTA','01-JAN-99');

SAVEPOINT A;

INSERT INTO student( student_id, Last_name, zip, registration_date, created_by, created_date, modified_by, modified_date)
VALUES (student_id_seq.nextval, 'Sonam', 10015, '01-JAN-99', 'STUDENTB','01-JAN-99', 'STUDENTB', '01-JAN-99' );

SAVEPOINT B;

INSERT INTO student( student_id, Last_name, zip, registration_date, created_by, created_date, modified_by, modified_date)
VALUES (student_id_seq.nextval, 'Norbu', 10015, '01-JAN-99', 'STUDENTB', '01-JAN-99', 'STUDENTB', '01-JAN-99');

SAVEPOINT C;

ROLLBACK TO B;
END;

/* 
A. If you tried to issue the following command, what would you expect to see, and why?
SELECT *
FROM student
WHERE last_name = 'Norbu';
B. Try issuing this command. What happens, and why?
c. Now issue the following command:
ROLLBACK to SAVEPOINT A;
D. If you were to issue the following, what would you expect to see?
SELECT last_name
FROM student
WHERE last_name = 'Tashi';
*/

spool off;
