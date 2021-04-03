spool C:\Users\ozkr_\OneDrive\Documentos\DDB\PrimerParcial\PL-SQLbyExample\chapter7\salida\ejercicio5chapter7.txt
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



DECLARE
    v_counter BINARY_INTEGER := 0;
BEGIN
    LOOP
    -- increment loop counter by one
        v_counter := v_counter + 1;
        DBMS_OUTPUT.PUT_LINE
        ('before continue condition, v_counter = '||
        v_counter);
    -- if CONTINUE condition yields TRUE pass control to the
    -- first executable statement of the loop
    IF v_counter < 3 THEN
        CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE
        ('after continue condition, v_counter = '||
        v_counter);
    -- if EXIT condition yields TRUE exit the loop
    IF v_counter = 5 THEN
    EXIT;
    END IF;
    END LOOP;
    -- control resumes here
    DBMS_OUTPUT.PUT_LINE ('Done...');
END;
.
/

/*
El script muestra el recuento de las iteracioes del bucle, con cada iteracion el valor aumenta, si cambiamos las condicionales podemos obtener resuktados diferentes 
*/

--I) v_counter = 3

DECLARE
    v_counter BINARY_INTEGER := 0;
BEGIN
    LOOP
    -- increment loop counter by one
        v_counter := v_counter + 1;
        DBMS_OUTPUT.PUT_LINE
        ('before continue condition, v_counter = '||
        v_counter);
    -- if CONTINUE condition yields TRUE pass control to the
    -- first executable statement of the loop
    IF v_counter = 3 THEN
        CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE
        ('after continue condition, v_counter = '||
        v_counter);
    -- if EXIT condition yields TRUE exit the loop
    IF v_counter = 5 THEN
    EXIT;
    END IF;
    END LOOP;
    -- control resumes here
    DBMS_OUTPUT.PUT_LINE ('Done...');
END;
.
/

/*
Este cambio afecta solo a la a la tercara iteracion ya que para este la condicion evalua como Verdadera lo que provoca la ejecucion parcial del ciclo 
*/

--II) v_counter > 3.

/*
Si ejecutamos asi este script con esta condicon, la ejecucion entra en un bucle infinito pues la concion de EXIT nunca es alcanzada
*/


spool OFF; 