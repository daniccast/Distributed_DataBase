spool C:\Users\ozkr_\OneDrive\Documentos\DDB\PrimerParcial\PL-SQLbyExample\chapter2\salida\ejercicio5chapter2.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 13 de Marzo de 2021                       *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                     *
rem *Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson.       *
rem **********************************************************
*/

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';
SET SERVEROUTPUT ON;


-- Ejemplo ¿Qué suscede? ¿Cómo arreglarlo? (ROSENZWEIG,B &  RAKHIMOV,E, p. 25).

DECLARE
    v_name VARCHAR2(30) ;
    v_dob DATE;
    v_us_citizen BOOLEAN;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_name||'born on'||v_dob);
END;
.
/

/*
Si ejecucamos este bloque de codigo el resultado nos arrojaria solo la cadena de texto "born on" sin darnos el nombre n la fecha de nacimiento, 
ya que las varibles estan vacias, para que este nos muestre la informacionq ue queremos debemos darle valores a la variables
*/

DECLARE
    v_name VARCHAR2(30) ;
    v_dob DATE;
    v_us_citizen BOOLEAN;
BEGIN
    DBMS_OUTPUT.PUT_LINE(COALESCE(v_name, ' No Name ')||' born on '||COALESCE(v_dob, '01-Jan-1999'));
END;
.
/

/*EN este caso COALESCE se ocupa cuando una variable esta inicializada a NULL, por loc ual podemos darle el valor que queramos*/

spool OFF;