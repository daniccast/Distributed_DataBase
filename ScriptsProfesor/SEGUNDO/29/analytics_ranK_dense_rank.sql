SPOOL C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\SEGUNDO\29\ranK1.txt

SET PAGESIZE 99
SET LINESIZE 130
SET COLSEP '|=|'
SET NULL S/Data
rem  ejecutado en sergionava 
DROP TABLE emp PURGE;

CREATE TABLE emp (
  empno    NUMBER(4) ,
  ename    VARCHAR2(10),
  job      VARCHAR2(9),
  mgr      NUMBER(4),
  hiredate DATE,
  sal      NUMBER(7,2),
  comm     NUMBER(7,2),
  deptno   NUMBER(2)
);


INSERT INTO emp VALUES (7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO emp VALUES (7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO emp VALUES (7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO emp VALUES (7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO emp VALUES (7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO emp VALUES (7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO emp VALUES (7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO emp VALUES (7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87','dd-mm-rr')-85,3000,NULL,20);
INSERT INTO emp VALUES (7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO emp VALUES (7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO emp VALUES (7876,'ADAMS','CLERK',7788,to_date('13-JUL-87', 'dd-mm-rr')-51,1100,NULL,20);
INSERT INTO emp VALUES (7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO emp VALUES (7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO emp VALUES (7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
COMMIT;

select * from emp;

-- -----------------------------

rem gebera rangas a partir de no de depto 
rem le va asignando un numero dentro del rango 
rem  si encuentra dos valores iguales les asigna el mismo numero
rem  se aprecia en  la columna   myrank 
SELECT empno,
       deptno,
       sal,
       RANK() OVER (PARTITION BY deptno ORDER BY sal) AS myrank
FROM   emp;

rem el query le asigna una jerarquia dentro del orden de las columnas
rem      en este ejemplo se incluye una clausula order by que es el mismo
rem      al asignado por la propia consulta
SELECT empno,
       deptno,
       sal,
       RANK() OVER (PARTITION BY deptno ORDER BY sal) AS myrank
FROM   emp order by 2,4;

-- --------------------------------------
rem el resultado de la consulta ahora lo declaramos 
rem   como un subquery y filtramos esas tuplas 
rem cuando el rango fue mayor de dos
rem es decir mas de dos valores al generar cada particion

SELECT *
FROM   (SELECT empno,
               deptno,
               sal,
               RANK() OVER (PARTITION BY deptno ORDER BY sal) AS myrank
        FROM   emp)
WHERE  myrank <= 2;

---------------------------------------
rem   The DENSE_RANK function acts like the RANK function 
rem   except that it assigns consecutive ranks
SELECT empno,
       deptno,
       sal,
       DENSE_RANK() OVER (PARTITION BY deptno ORDER BY sal) AS myrank
FROM   emp;

rem  despleguemos solo el departamento 30 con "DENSE_RANK"

SELECT empno,
       deptno,
       sal,
       DENSE_RANK() OVER (PARTITION BY deptno ORDER BY sal) AS myrank
FROM   emp
	where deptno = 30;

--------------------------------------------
rem  despleguemos solo el departamento 30 con "RANK"

SELECT empno,
       deptno,
       sal,
       RANK() OVER (PARTITION BY deptno ORDER BY sal) AS myrank
FROM   emp
	where deptno = 30;
	
------------------------
rem   As with the RANK analytic function, 
rem  we can do a Top-N query on a per-department basis.
rem         ejecutandolo en un subquery y 
rem        ordenarlo de forma descendente
rem     posteriormente filtrando tuplas con rango menor o igual a 2
SELECT *
FROM   (SELECT empno,
               deptno,
               sal,
               DENSE_RANK() OVER (PARTITION BY deptno ORDER BY sal DESC) AS myrank
        FROM   emp)
WHERE  myrank <= 2;


rem The FIRST and LAST functions can be used to return the first or last value from 
rem an ordered sequence. Say we want to display the salary of each employee,
rem  along with the lowest and highest 
rem within their department we may use something like

SELECT empno,
       deptno,
       sal,
       MIN(sal) KEEP (DENSE_RANK FIRST ORDER BY sal) 
			OVER (PARTITION BY deptno) AS lowest,
       MAX(sal) KEEP (DENSE_RANK LAST ORDER BY sal) 
			OVER (PARTITION BY deptno) AS highest
FROM   emp
ORDER BY deptno, sal;

rem  despleguemos solo los del deptno 30
-- --------------------------------------------
/*
The KEEP keyword is for semantic clarity. It qualifies aggregate_function,
indicating that only the FIRST or LAST values of aggregate_function will be
returned.
*/

SELECT empno,
       deptno,
       sal,
       MIN(sal) KEEP (DENSE_RANK FIRST ORDER BY sal) 
			OVER (PARTITION BY deptno) AS lowest,
       MAX(sal) KEEP (DENSE_RANK LAST ORDER BY sal) 
			OVER (PARTITION BY deptno) AS highest
FROM   emp
	where deptno = 30
	ORDER BY deptno, sal;

rem 
SPOOL OFF;





