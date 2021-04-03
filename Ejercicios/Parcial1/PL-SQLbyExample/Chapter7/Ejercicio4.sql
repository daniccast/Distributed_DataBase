spool C:\Users\ozkr_\OneDrive\Documentos\DDB\PrimerParcial\PL-SQLbyExample\chapter7\salida\ejercicio4chapter7.txt
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

-- Como corregirlo? (ROSENZWEIG,B &  RAKHIMOV,E, p. 152).

DECLARE
    v_sum NUMBER := 0;
BEGIN
    FOR v_counter in 1..10 LOOP
    -- if v_counter is odd, pass control to the top of the loop
    CONTINUE WHEN mod(v_counter, 2) != 0;
        v_sum := v_sum + v_counter;
        DBMS_OUTPUT.PUT_LINE ('Current sum is: '||v_sum);
    END LOOP;
    -- control resumes here
        DBMS_OUTPUT.PUT_LINE ('Final sum is: '||v_sum);
END;
.
/

/*
Este script usa la función CONTINUE WHEN, el cual es una condicional la cual para este caso se seguira ejecutando hasta que deje de ser diferente de cero, lo que hace
este script es sumar los enteros pares entre el 1 y el 10. Ahora bien si queremos que se sumen los numeros impares hariamos lo siguiente
*/

DECLARE
    v_sum NUMBER := 0;
BEGIN
    FOR v_counter in 1..10 LOOP
    -- if v_counter is even, pass control to the top of the loop
    CONTINUE WHEN mod(v_counter, 2) = 0;
        v_sum := v_sum + v_counter;
        DBMS_OUTPUT.PUT_LINE ('Current sum is: '||v_sum);
    END LOOP;
    -- control resumes here
        DBMS_OUTPUT.PUT_LINE ('Final sum is: '||v_sum);
END;
.
/

spool OFF;