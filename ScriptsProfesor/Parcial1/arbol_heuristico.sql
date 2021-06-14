spool C:\Users\ORA_bases\2021_02_24_clase_2\salida\arbol_heuristico.txt
set linesize 130
set pagesize 90
set feddback on
set colsep '|=|'
set underline =

select Lname
FROM EMPLOYEE,WORKS_ON,PROJECT
	WHERE PNAME='ProductY'
	and pnumber=pno
	and Essn=Ssn
	and bdate > to_date('1957-12-31','YYYY-MM-DD')
	ORDER BY 1;

REM OBTENER EL NUMERO DE TUPLAS 
REM AL CONBINAR LAS TRES ENTIDADES
REM EMPLOYEE,WORKS_ON & PROJECT	
REM AL GENERAR EL PRODUCTO CARTESIANO DE LAS TRES

SELECT COUNT(*) 
	FROM EMPLOYEE,WORKS_ON,PROJECT;
	
REM CALCULAR LA SELECTIVIDAD DEL RESULTADOO De
rem la consulta con respecto al producto cartesiano
select 3/ 768 from dual;
rem en procentaje
select (3/ 768)*100 ||' % ' porcentaje from dual;

rem calculemos el numero de tuplas 
rem  de otros productos cartesiano
SELECT COUNT(*) 
	FROM EMPLOYEE,WORKS_ON;
	
rem 
SELECT COUNT(*) 
	FROM PROJECT,WORKS_ON;
	
	
select * 
	from employee
	where bdate > to_date('1957-12-31','YYYY-MM-DD');
	
select count(*) total
from (	
select * 
	from employee
	where bdate > to_date('1957-12-31','YYYY-MM-DD'));
	
	
select count(*) total
from (	
select pname,pnumber,plocation,dnum
	from project
	WHERE PNAME='ProductY');
	
select pname,pnumber,plocation,dnum
	from project
	WHERE PNAME='ProductY';

select essn,pno
from works_on;
	
select count(*) total
	from (
		select essn,pno
				from works_on);
spool off 