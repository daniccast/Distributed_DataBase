spool C:\Users\ozkr_\OneDrive\Documentos\Github\Distributed_DataBase\Ejercicios\Parcial3\MasteringOracle\Chapter5\salida\ejercicios3chapter5.txt

rem *****************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2         * 
rem * Elaborado por:                                    *
rem * Cort�s Castilllo Daniela y Mendoza Cuellar Oscar  *
rem * Realizado el 7 de Junio de 2021                   *
rem *Mishra S., Beaulieu A. (2002). 			*
rem *Chapter 4 Group Operations			        *
rem * SQL (pp. 157-174).Gravenstein Highway North,	*
rem * Sebastopol, CA 95472. 				*
rem *****************************************************

rem Establecer formato para las tablas

set colsep '|=|'
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150

alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE= 'ENGLISH';
rem para estos ejercicios necesitamos este tipo de formato

/*
 Una instrucción SELECT en la cláusula FROM de una instrucción SELECT que la contiene se denomina 
 vista en línea: * es una de las características más poderosas y subutilizadas de Oracle SQL

(Mishra y Beaulieu, 2002, 77)
*/

SELECT d.dept_id, d.name, emp_cnt.tot
FROM department d,
(SELECT dept_id, COUNT(*) tot
FROM employee
GROUP BY dept_id) emp_cnt
WHERE d.dept_id = emp_cnt.dept_id;



spool OFF;