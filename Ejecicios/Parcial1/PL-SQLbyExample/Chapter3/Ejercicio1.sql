spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter3\salida\ejercicio1chapter3.txt
/*
rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *                 
rem * Realizado el 13 de Marzo de 2021                  *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                *
rem *Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson. *
rem *****************************************************
*/

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';


-- Insertar algo con valores(ROSENZWEIG,B &  RAKHIMOV,E, p. 71).

SET SERVEROUTPUT ON

-- ch03_3a.sql

DECLARE
v_zip zipcode.zip%TYPE;
v_user zipcode.created_by%TYPE;
v_date zipcode.created_date%TYPE;
BEGIN
SELECT 43438, USER, SYSDATE
INTO v_zip, v_user, v_date
FROM dual;

INSERT INTO zipcode(ZIP, CREATED_BY ,CREATED_DATE, MODIFIED_BY,MODIFIED_DATE)
VALUES(v_zip, v_user, v_date, v_user, v_date);

END;
.
/

spool OFF;
