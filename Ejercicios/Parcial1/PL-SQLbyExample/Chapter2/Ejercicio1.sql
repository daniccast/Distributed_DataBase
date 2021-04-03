spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter2\salida\ejercicio1chapter2.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 13 de Marzo de 2021                       *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                     *
rem *Oracle® PL/SQL™by Example,Boston,MA,USA:Perarson.       *
rem *********************************************************
*/

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';


-- Ejemplo mal ¿Qué suscede? ¿Cómo arreglarlo? (ROSENZWEIG,B &  RAKHIMOV,E, p. 26).

SET SERVEROUTPUT ON

DECLARE
v_name 	VARCHAR2(30);
v_dob  	DATE;
v_us_citizen 	BOOLEAN;
BEGIN
DBMS_OUTPUT.PUT_LINE(v_name||'born on'||v_dob);
END;
.
/

DECLARE
v_name 	VARCHAR2(30):= 'Daniela';
v_dob  	DATE:=TO_DATE('22-SEP-1999','DD-MON-YYYY');
v_us_citizen 	BOOLEAN;
BEGIN
DBMS_OUTPUT.PUT_LINE(v_name||' '||'born on '||TO_CHAR(v_dob));
END;
.
/

DECLARE
v_name 	VARCHAR2(30):= '&nombre';
v_dob  	DATE:=TO_DATE('&fecha_ddmonyyyy','DD-MON-YYYY');
v_us_citizen 	BOOLEAN;
BEGIN
DBMS_OUTPUT.PUT_LINE(v_name||' '||'born on '||TO_CHAR(v_dob));
END;
.
/

/*
El primer bloque no imprime nada poruqe las variables tienen NULL. 
En el segundo bloque inicialicé las variables para poder ver el funcionamiento del código.
En el tercer bloque, se pide al usuario el valor del nombre y fecha usando &.
Hay varias maneras de asignar datos a las variables
*/
spool OFF;
