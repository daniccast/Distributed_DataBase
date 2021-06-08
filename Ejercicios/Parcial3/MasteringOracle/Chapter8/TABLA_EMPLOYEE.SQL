REM CREACION Y POBLACION DE LA TABLE EMPLOYEE 


alter session set nls_date_format = 'DD-MON-RR';
alter session set nls_date_LANGUAGE = 'ENGLISH';
drop table EMPLOYEE CASCADE CONSTRAINTS;
CREATE TABLE EMPLOYEE(
    EMP_ID            NUMBER(5)    NOT NULL,
    FNAME             VARCHAR2(20),
    LNAME             VARCHAR2(20),
    DEPT_ID           NUMBER(5)    NOT NULL,
    MANAGER_EMP_ID    NUMBER(5),
    SALARY            NUMBER(5),
    HIRE_DATE         DATE,
    JOB_ID            NUMBER(3),
    CONSTRAINT employee_pk PRIMARY KEY (EMP_ID)
);

insert into employee
(EMP_ID,FNAME,LNAME,DEPT_ID,MANAGER_EMP_ID,SALARY,HIRE_DATE,JOB_ID)
select e.emp_id, e.fname, e.lname, e.dept_id, e.manager_emp_id, e.salary, e.hire_date, e.job_id
from
(
select 7369 emp_id, 'JOHN' fname, 'SMITH' lname, 20 dept_id, 7902 manager_emp_id, 800 salary, '17-DEC-80' hire_date, 667 job_id from dual union all
select 7499 emp_id, 'KEVIN' fname, 'ALLEN' lname, 30 dept_id, 7698 manager_emp_id, 1600 salary, '20-FEB-81' hire_date, 670 job_id from dual union all
select 7521 emp_id, 'CYNTHIA' fname, 'WARD' lname, 30 dept_id, 7698 manager_emp_id, 1250 salary, '22-FEB-81' hire_date, null job_id from dual union all
select 7566 emp_id, 'TERRY' fname, 'JONES' lname, 20 dept_id, 7839 manager_emp_id, 2000 salary, '02-APR-81' hire_date, 671 job_id from dual union all
select 7654 emp_id, 'KENNETH' fname, 'MARTIN' lname, 30 dept_id, 7698 manager_emp_id, 1250 salary, '28-SEP-81' hire_date, 670 job_id from dual union all
select 7698 emp_id, 'MARION' fname, 'BLAKE' lname, 30 dept_id, 7839 manager_emp_id, 2850 salary, '01-MAY-80' hire_date, 671 job_id from dual union all
select 7782 emp_id, 'CAROL' fname, 'CLARK' lname, 10 dept_id, 7839 manager_emp_id, 2450 salary, '09-JUN-81' hire_date, 671 job_id from dual union all
select 7788 emp_id, 'DONALD' fname, 'SCOTT' lname, 20 dept_id, 7566 manager_emp_id, 3000 salary, '19-APR-87' hire_date, 669 job_id from dual union all
select 7839 emp_id, 'FRANCIS' fname, 'KING' lname, 10 dept_id, null manager_emp_id, 5000 salary, '17-NOV-81' hire_date, 672 job_id from dual union all
select 7844 emp_id, 'MARY' fname, 'TURNER' lname, 30 dept_id, 7698 manager_emp_id, 1500 salary, '08-SEP-81' hire_date, 670 job_id from dual union all
select 7876 emp_id, 'DIANE' fname, 'ADAMS' lname, 20 dept_id, 7788 manager_emp_id, 1100 salary, '23-MAY-87' hire_date, null job_id from dual union all
select 7900 emp_id, 'FRED' fname, 'JAMES' lname, 30 dept_id, 7698 manager_emp_id, 950 salary, '03-DEC-81' hire_date, 667 job_id from dual union all
select 7902 emp_id, 'JENNIFER' fname, 'FORD' lname, 20 dept_id, 7566 manager_emp_id, 3000 salary, '03-DEC-81' hire_date, 669 job_id from dual union all
select 7934 emp_id, 'BARBARA' fname, 'MILLER' lname, 10 dept_id, 7782 manager_emp_id, 1300 salary, '23-JAN-82' hire_date, 667 job_id from dual
) e;
commit;

