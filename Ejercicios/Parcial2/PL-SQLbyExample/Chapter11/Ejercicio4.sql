spool C:\Users\ozkr_\OneDrive\Documentos\Github\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter11\salida\ejercicio4chapter11.txt
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
Este script nos nuestra como respuesta el estado, la ciudad y el zio de los rownum menores a 2 
*/

--(ROSENZWEIG &  RAKHIMOV, 2009, 234)

DECLARE
vr_zip ZIPCODE%ROWTYPE;
BEGIN
SELECT *
INTO vr_zip
FROM zipcode
WHERE rownum < 2;
DBMS_OUTPUT.PUT_LINE('City: '||vr_zip.city);
DBMS_OUTPUT.PUT_LINE('State: '||vr_zip.state);
DBMS_OUTPUT.PUT_LINE('Zip: '||vr_zip.zip);
END;
.
/

spool off;