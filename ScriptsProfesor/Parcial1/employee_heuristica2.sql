rem ||°|	configura la pantalla 
set linesize 150 
set pagesize 99
set colsep '||'	

REM DESPLEGAR LOS ATRIBUTOS DE LA SESSION 	
col parameter format a25
col value     format a25
rem desplegar los atributos de nls_session_parameters]	
select parameter, value
from nls_session_parameters;

drop table works_on;
CREATE TABLE works_on (
    ESSN NUMBER,
	PNO  NUMBER,
	HOURS NUMBER);

insert into works_on values(123456789,1,32.5);
insert into works_on values(123456789,2,7.5);
insert into works_on values(666884444,3,40);
insert into works_on values(453453453,1,20.0);
insert into works_on values(453453453,2,20.0);
insert into works_on values(333445555,2,10.0);
insert into works_on values(333445555,3,10.0);
insert into works_on values(333445555,10,10.0);
insert into works_on values(333445555,20,10.0);
insert into works_on values(999887777,30,30.0);
insert into works_on values(999887777,10,30.0);
insert into works_on values(987987987,10,35.0);
insert into works_on values(987987987,30,5.0);
insert into works_on values(987654321,30,20.0);
insert into works_on values(987654321,20,15.0);
insert into works_on values(888665555,20,NULL);

drop table PROJECT;
CREATE TABLE PROJECT (
    PNAME VARCHAR2(15),
    PNUMBER	 NUMBER ,
	PLOCATION VARCHAR2(15),
	DNUM NUMBER);
---
insert into project values('ProductX',1,'Bellaire',5);
insert into project values('ProductY',2,'Sugarland',5);
insert into project values('ProductZ',3,'Houston',5);
insert into project values('Computerization',10,'Stafford',5);
insert into project values('Reorganization',20,'Houston',5);
insert into project values('Newbenefits',1,'Stafford',5);--

drop table EMPLOYEE;
CREATE TABLE EMPLOYEE (
    FNAME VARCHAR2(15),
	MINIT VARCHAR2(2),
	LNAME VARCHAR2(15),
	  SSN      NUMBER,
	BDATE DATE,
	ADDRESS VARCHAR2(25),
	SEX VARCHAR2(15),
	SALARY NUMBER,
	SUPERSSN NUMBER,
	DNO NUMBER);
INSERT INTO EMPLOYEE VALUES 
   ('John','B','Smith',123456789,TO_DATE('1965-01-09','YYYY-MM-DD'),'731 Fondren, Houston, TX','M',30000,333445555,5);
INSERT INTO EMPLOYEE VALUES 
   ('Franklin','T','Wong',333445555,TO_DATE('1955-12-08','YYYY-MM-DD'),'638 Voss, Houston, TX','M',40000,888665555,4);
INSERT INTO EMPLOYEE VALUES
   ('Jennifer','J','Zelaya',999887777,TO_DATE('1968-01-19','YYYY-MM-DD'),'3321 Castle, Spring, TX','F',25000,987654321,4);
INSERT INTO EMPLOYEE VALUES 
   ('Alicia','S','Wallane',987654321,TO_DATE('1941-06-19','YYYY-MM-DD'),'291 Berry, Bellaire, TX','F',43000,888665555,4);
INSERT INTO EMPLOYEE VALUES
   ('Ramesh','K','Narayan',666884444,TO_DATE('1962-09-15','YYYY-MM-DD'),'975 Fire Oak, Humble, TX','M',38000,333445555,5);
INSERT INTO EMPLOYEE VALUES 
   ('Joyce','A','English',453453453,TO_DATE('1972-07-31','YYYY-MM-DD'),'5631 Rice, Houston, TX','F',25000,333445555,5);
INSERT INTO EMPLOYEE VALUES 
   ('Ahmad','V','Jabbar',987987987,TO_DATE('1969-03-29','YYYY-MM-DD'),'980 Dallas, Houston, TX','M',25000,987654321,4);
INSERT INTO EMPLOYEE VALUES 
   ('James','E','Borg',888665555,TO_DATE('1937-11-10','YYYY-MM-DD'),'450 Stone, Houston, TX','M',55000,NULL,1);
   
select count (*) from employee;
select count (*) from works_on;
select count (*) from project;

select * from employee;
select * from works_on;
select * from project;


col FNAME    format a10;                                          
col MINIT    format  a1;                                          
col LNAME    format  a10;                                         
col SSN      format  a10;                                        
col BDATE    format  a13;                                       
col ADDRESS  format  a30;                                      
col SEX      format  a1;                                   
col SALARY   format  999,999.99;                                      
col SUPERSSN format  999999999999;                                    
col DNO      format  99;
col ssn      format 99999999999
rem desplegar los atributos deproducto cartesiano de employee y trabaja en
select essn, ssn  
	from employee, works_on
	where bdate > '31/12/1957';
	
REM contar el numero de tuplas a partrir de un subquery
select count(*) from (select essn, ssn 
	from employee, works_on
	where bdate > '31/12/1957');	
	
REM contar el numero de tuplas que se repiten al formar grupos por 
rem       	ESSN y  SSN    
select essn, ssn, count (*)
	from employee, works_on
	where bdate > '31/12/1957'
	group by essn,ssn
	order by 3 desc ,1,2;
REM contar el numero de tuplas que se repiten al formar grupos por 
rem       	ESSN     
select essn, count (*)
	from employee, works_on
	where bdate > '31/12/1957'
	group by essn
	order by 2 desc ,1;
REM contar el numero de tuplas que se repiten al formar grupos por 
rem       	SSN     
select ssn, count (*)
	from employee, works_on
	where bdate > '31/12/1957'
	group by ssn
	order by 2 desc ,1;	
REM CREAR UNA VISTA DE LA CONSULTA 	
REM contar el numero de tuplas que se repiten al formar grupos por 
rem       	SSN  
DROP VIEW B0;
CREATE VIEW VISTAB0 AS
SELECT * FROM EMPLOYEE 
	where bdate > '31/12/1957';
SELECT * FROM VISTAB0;	
DROP VISTA VISTAB1;
CREATE VIEW VISTAB1 AS 
(select ssn, count (*) CUENTA
	from employee, works_on
	where bdate > '31/12/1957'
	group by ssn);
REM PESPLEGAR LOS ATRIBUTOS DE LA VISTA VISTA1B	
SELECT * FROM VISTAB1	
	order by 2 desc ,1;
	
REM CREAR UNA VISTA VISTA2B CON EL CON EL ATRIBUTO PNAME 
REM EN  PARTICULAR SOLO DEL PROYECTO ProductY	
SELECT PNAME 
	FROM PROJECT 
	WHERE PNAME = 'ProductY';
	
DROP VIEW VISTAB2;
CREATE VIEW VISTAB2 AS
SELECT PNAME 
	FROM PROJECT 
	WHERE PNAME = 'ProductY';
REM DESPLEGAR LOS ATRIBUTOS DE LA VISTA VISTA1B;
SELECT * FROM VISTAB2;

REM GENERAR EL  PRODUCTO CARTESIANO DE VISTA1A Y VISTA1B
SELECT * FROM VISTAB1, VISTAB2;
DROP VISTAB3;
CREATE VIEW VISTAB3 AS 
SELECT * FROM VISTAB1, VISTAB2;
SELECT * FROM VISTAB3 
ORDER BY 1 ;
REM CREAR UNA VISTA DE ATRIBUTO LNAME A PARTIR DE LA VISTAB3
SELECT LANME FROM VISTAB3;


SELECT FNAME   
,MINIT   
,LNAME   	 
,SSN     
,BDATE   
,ADDRESS 
,SEX     
,SALARY  
,SUPERSSN
,DNO     
,ssn   
FROM EMPLOYEE;
  