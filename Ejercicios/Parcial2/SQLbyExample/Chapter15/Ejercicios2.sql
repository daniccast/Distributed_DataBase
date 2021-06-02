spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial2\SQLbyExample\Chapter15\salida\ejercicios2chapter15.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Realizado el 1 de Abril de 2021                   *
rem * Rischert,A (2004)."Chapter 15. Regular Expressions*
rem * and Hierarchical Queries". 	  		*
rem *Ramagnano,L, Oracle® SQL™by Example(711-258). 	*
rem *Pearson.  					        *
rem *****************************************************

rem Establecer formato para las tablas

set colsep '|=|'
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150

alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE= 'ENGLISH';
rem para estos ejercicios necesitamos este tipo de formato


rem ----------------------------- EJERCICIO B. LAB 15.1--------------------------------------------------------------------------------
rem Describe the difference between the following two regular expressions and the
corresponding result.
rem (Rischert, 2004, 728). 

SELECT zip,
REGEXP_INSTR(zip, '[[:digit:]]{5}') exp1,
REGEXP_INSTR(zip, '[[:digit:]{5}]') exp2
FROM zipcode
where zip in ('00914', '01247','065401');


rem la diferencia es que la primera expresion regular requiere exactamente 5 ocurrencias
rem En la segunda {5} está mal puesto, por lo que se necesita solo un digito para complir la condición.

rem ----------------------------- EJERCICIO B. LAB 15.2.1--------------------------------------------------------------------------------
rem  Execute the following query. What do you observe about the result?
 (Rischert, 2004, 748). 

COL LEVEL format 999;
COL hierarchy FORMAT A20;

SELECT LEVEL, LPAD(' ', 6*(LEVEL-1)) ||course_no
|| ' ' ||description hier
FROM course
START WITH course_no = 310
CONNECT BY PRIOR course_no = prerequisite
AND LEVEL <= 3;


rem Respuesta: La pseudocolumna LEVEL restringe las filas de la cláusula CONNECT BY para mostrar solo los primeros tres niveles de la jerarquía.

spool OFF;
