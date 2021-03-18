spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter3\salida\ejercicio2chapter3.txt
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
SET SERVEROUTPUT ON

/*
Write a PL/SQL block that inserts a new student in the STUDENT table. 
Use your own information for the data. 
Create two variables that are used in the SELECT statement. 
Get the USER and SYSDATE for the variables. 
Finally, use the existing student_id_seq sequence to generate a unique ID for the new student (ROSENZWEIG,B &  RAKHIMOV,E, p. 73).
*/

--Primero veamos el valor de la secuencia
select student_id_seq.currval from dual;

DECLARE
v_user student.created_by%TYPE;
v_date student.created_date%TYPE;
BEGIN
SELECT USER, sysdate
INTO v_user, v_date
FROM dual;

INSERT INTO student(student_id, last_name, zip,created_by, created_date, modified_by,modified_date, registration_date)
VALUES (student_id_seq.nextval, 'Smith',11238, v_user, v_date, v_user, v_date,v_date);
END;

.
/
--CONSULTEMOS el regsitro hecho
DECLARE
secuencia  student.student_id%TYPE;
salida varchar(40);
begin
select student_id_seq.currval 
into secuencia 
from dual;

select student_id ||' '|| last_name || ' ' || zip 
into salida
from STUDENT 
where student_id like secuencia;

DBMS_OUTPUT.PUT_LINE(salida);
end;
.
/

spool off;
