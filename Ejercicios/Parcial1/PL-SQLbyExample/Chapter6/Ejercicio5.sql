spool C:\Users\ozkr_\OneDrive\Documentos\DDB\PrimerParcial\PL-SQLbyExample\chapter6\salida\ejercicio5chapter6.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 14 de Marzo de 2021                       *
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

-- Como corregirlo? (ROSENZWEIG,B &  RAKHIMOV,E, p. 134).

BEGIN
FOR v_counter IN 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE ('v_counter = '||v_counter);
END LOOP;
END;
.
/

/*
Si ejecutamos este script nos daremos cuenta que auque la variable v_counter no esta declarada, esta puede ser ocupada, esto se puede ya que esta 
variable se ejuta directamente dentro del bucle FOR, si declaramos esta variable antes, nos daremos cuenta de que nos mostrata errores:
*/

DECLARE
    v_counter := v_counter + 1;
BEGIN
FOR v_counter IN 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE ('v_counter = '||v_counter);
END LOOP;
END;
.
/


spool OFF;