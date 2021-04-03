spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejecicios\Parcial2\SQLbyExample\Chapter15\salida\ejercicioschapter15.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cortés Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Realizado el 1 de Abril de 2021                   *
rem * Rischert,A (2004)."Chapter 15. Regular Expressions*
rem * and Hierarchical Queries". 	  		  *
rem *Ramagnano,L, Oracle® SQL™by Example(711-258). 	  *
rem *Pearson.  					  *
rem *****************************************************

rem Establecer formato para las tablas

set colsep '|=|'
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150

alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE= 'ENGLISH';
rem para estos ejercicios necesitamos este tipo de formato


rem ----------------------------- EJERCICIO B. LAB 9.1.1--------------------------------------------------------------------------------
rem (Rischert, 2004, ). 






spool OFF;
