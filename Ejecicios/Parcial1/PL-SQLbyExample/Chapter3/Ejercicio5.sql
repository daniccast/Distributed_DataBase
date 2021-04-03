spool C:\Users\ozkr_\OneDrive\Documentos\DDB\PrimerParcial\PL-SQLbyExample\chapter3\salida\ejercicio5chapter3.txt
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

-- Ejemplo (ROSENZWEIG,B &  RAKHIMOV,E, p. 46).


/*En este ejemplo nos nuestra la actualizacion permanente de la columna cost de la tabla, pero nosotros podemos regredar esta tabla asu valor original con ayuda de 
los savepoint y el comando rollback*/


/*mostramos los valores originales*/
SELECT cost from course;    
/*hacemos un punto de guardado des estos valores*/
SAVEPOINT A;                
/
-- STEP 1
UPDATE course
SET cost = cost - (cost * 0.10)
WHERE prerequisite IS NULL;
-- STEP 2
UPDATE course
SET cost = cost + (cost * 0.10)
WHERE prerequisite IS NOT NULL;
END;
.
/

/*mostramos los valores originales*/
SELECT cost from course;    

 /*regresamos los valores a su valor original*/
ROLLBACK TO A;             

/*mostamos que en efecto son los originales*/ 
SELECT cost from course;    

spool OFF;