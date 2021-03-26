spool C:\Users\ozkr_\OneDrive\Documentos\DDB\PrimerParcial\PL-SQLbyExample\chapter6\salida\ejercicio4chapter6.txt
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

--How would you change the script? (ROSENZWEIG,B &  RAKHIMOV,E, p. 139).

BEGIN
    FOR v_counter IN REVERSE 0..10 LOOP
-- if v_counter is even, display its value on the
-- screen
IF MOD(v_counter, 2) = 0 THEN
    DBMS_OUTPUT.PUT_LINE ('v_counter = '||v_counter);
END IF;
END LOOP;
-- control resumes here
DBMS_OUTPUT.PUT_LINE ('Done...');
END;
.
/

/*
Este ejercicio usa la opcion REVERSE para especificar el ranfo de numeros en el bucle, es este caso para contar de 10 a 0 en numeros pares, ahora si quisieramos contar en 
numeros impares tendriamos que cambiar la conficional, como se muestra acontinuación
*/

BEGIN
    FOR v_counter IN REVERSE 0..10 LOOP
-- if v_counter is odd, display its value on the
-- screen
IF MOD(v_counter, 2) != 0 THEN
    DBMS_OUTPUT.PUT_LINE ('v_counter = '||v_counter);
END IF;
END LOOP;
-- control resumes here
    DBMS_OUTPUT.PUT_LINE ('Done...');
END;
.
/

spool OFF; 