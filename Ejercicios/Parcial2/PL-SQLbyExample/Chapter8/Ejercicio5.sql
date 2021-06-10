spool C:\Users\ozkr_\OneDrive\Documentos\Github\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter8\salida\ejercicio5chapter8.txt
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

--Use Built-in Exceptions (ROSENZWEIG y RAKHIMOV, 2009, 174).

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
.
/

--Como podemos ver en este ejemplo el mal uso de las exepciones ya que como podemos ver auque el valor sea incorrecto el programa se ejecuta satisfactoriamente
--lo cual es una mala practica de progrmacion  

spool off;