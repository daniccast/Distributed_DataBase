spool C:\Users\ozkr_\OneDrive\Documentos\Github\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter11\salida\ejercicio5chapter11.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cort�s Castilllo Daniela y Mendoza Cuellar Jos� Oscar  *                 
rem * Realizado el 4 de Abril  de 2021                       *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                     *
rem *Oracle� PL/SQL�by Example,Boston,MA,USA:Perarson.       *
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
Este script recupera los datos de la tabla de estudiantes el cual tenga Id menor que 110, nosnuestra tambien infromacion 
simple de este asi como el numero de clases a las que esta inscrito
*/


-- ch11_6a.sql (ROSENZWEIG &  RAKHIMOV, 2009, 234)

DECLARE
CURSOR c_student_enroll IS
SELECT s.student_id, first_name, last_name,
COUNT(*) enroll,
(CASE
WHEN count(*) = 1 Then ' class.'
WHEN count(*) is null then
' no classes.'
ELSE ' classes.'
END) class
FROM student s, enrollment e
WHERE s.student_id = e.student_id
AND s.student_id <110
GROUP BY s.student_id, first_name, last_name;
r_student_enroll c_student_enroll%ROWTYPE;
BEGIN
OPEN c_student_enroll;
LOOP
FETCH c_student_enroll INTO r_student_enroll;
EXIT WHEN c_student_enroll%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('Student INFO: ID '||
r_student_enroll.student_id||' is '||
r_student_enroll.first_name|| ' ' ||
r_student_enroll.last_name||
' is enrolled in '||r_student_enroll.enroll||
r_student_enroll.class);
END LOOP;
CLOSE c_student_enroll;
EXCEPTION
WHEN OTHERS
THEN
IF c_student_enroll %ISOPEN
THEN
CLOSE c_student_enroll;
END IF;
END;
.
/

spool off;