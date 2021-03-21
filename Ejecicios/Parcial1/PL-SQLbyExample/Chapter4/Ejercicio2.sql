spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial1\PL-SQLbyExample\Chapter4\salida\ejercicio2chapter4.txt
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

set colsep '|=|'
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';

SET SERVEROUTPUT ON


/*Execute the following two PL/SQL blocks, and explain why they produce different output for the
same value of the variable v_num . Remember to issue the SET SERVEROUTPUT ON command
before running this script.
(ROSENZWEIG,B &  RAKHIMOV,E, 2009, p.109) 
*/
-- Block 1
DECLARE
v_num NUMBER := NULL;
BEGIN
IF v_num > 0 THEN
DBMS_OUTPUT.PUT_LINE ('v_num is greater than 0');
ELSE
DBMS_OUTPUT.PUT_LINE ('v_num is not greater than 0');
END IF;
END;
.
/
-- Block 2
DECLARE
v_num NUMBER := NULL;
BEGIN
IF v_num > 0 THEN
DBMS_OUTPUT.PUT_LINE ('v_num is greater than 0');
END IF;
IF NOT (v_num > 0) THEN
DBMS_OUTPUT.PUT_LINE ('v_num is not greater than 0');
END IF;
END;
.
/

/*
En el primer bloque primero se compara si el número es mayor que 0, como no lo es automaticamente
realiza lo que está en el bloque del ELSE.
En el segundo bloque hay dos condiciones que el número sea mayor que 0, que no se cumple, y 
que el número no se mayor a cero, ya que NULL no es ni mayor ni menor que cero, porque no reprsenta nada, tampoco 
cumple la condición y sale del if. 
*/

-- Para evitar los NULL podemos usar NVL.

DECLARE
v_num NUMBER := NULL;
BEGIN
IF nvl(v_num,0) > 0 THEN
DBMS_OUTPUT.PUT_LINE ('v_num is greater than 0');
ELSIF  nvl(v_num,0) = 0 THEN
DBMS_OUTPUT.PUT_LINE ('v_num is equal than 0');
ELSE
DBMS_OUTPUT.PUT_LINE ('v_num is not grater than 0');
END IF;
END;
.
/

spool OFF;

