SPOOL C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\SEGUNDO\22\SEGUNDOTRIGGER.TXT

set pagesize 99
set linesize 130
set colsep '|=|'
set underline =
set feedback on
set serveroutput on

REM 
REM Owens, Kevin.
REM  Programming Oracle triggers and stored procedures / Kevin Owens

REM [Owens,2003,section 6.4]

rem trigger que se dispara en inserción y en actualización 
DROP TABLE TEMP;
CREATE TABLE TEMP(X NUMBER, Y NUMBER, Z NUMBER DEFAULT 5);


INSERT INTO TEMP (M) VALUES (3);
INSERT INTO TEMP (N) VALUES (10);

INSERT INTO TEMP (n) VALUES (1);
UPDATE TEMP SET n=n+1 WHERE n>=1;


DROP TABLE TEMP;
CREATE TABLE TEMP(N NUMBER, M NUMBER DEFAULT 5);


CREATE OR REPLACE TRIGGER temp_aiur
AFTER INSERT OR UPDATE OF Y ON TEMP
FOR EACH ROW
WHEN (OLD.Y IS NULL and NEW.Y IS NOT NULL
      OR NEW.X BETWEEN 1 AND 10)
BEGIN
    CASE
    WHEN inserting THEN
        dbms_output.put_line('X := '||:new.x);
    WHEN updating THEN
       dbms_output.put_line
          ('Y is reset from NULL');
    END CASE;
END;

CREATE OR REPLACE TRIGGER temp_aiur
AFTER INSERT OR UPDATE OF N ON TEMP
FOR EACH ROW
WHEN (OLD.N IS NULL and NEW.N IS NOT NULL
      OR NEW.X BETWEEN 1 AND 10)
BEGIN
    CASE
    WHEN inserting THEN
        dbms_output.put_line('X := '||:new.x);
    WHEN updating THEN
       dbms_output.put_line
          ('Y is reset from NULL');
    END CASE;
END;


CREATE OR REPLACE TRIGGER temp_adr
AFTER DELETE ON TEMP
FOR EACH ROW
BEGIN
    dbms_output.put_line
       (:old.x||' '||:old.y||' '||:old.z);
END;


rem Write two triggers that accomplish the same as the prior six triggers.


CREATE OR REPLACE TRIGGER temp_biudr
BEFORE INSERT OR UPDATE OR DELETE ON TEMP
FOR EACH ROW
BEGIN
    CASE
    WHEN inserting THEN
        dbms_output.put_line('inserting before');
    WHEN updating THEN
        dbms_output.put_line('updating before');
    WHEN deleting THEN
        dbms_output.put_line('deleting before');
    END CASE;
END;
.
/
rem

CREATE OR REPLACE TRIGGER temp_aiudr
AFTER INSERT OR UPDATE OR DELETE ON TEMP
FOR EACH ROW
BEGIN
    CASE
    WHEN inserting THEN
        dbms_output.put_line('inserting after');
    WHEN updating THEN
        dbms_output.put_line('updating after');
    WHEN deleting THEN
        dbms_output.put_line('deleting after');
    END CASE;
END;
.
/

/*
> desc professors
 Name                           Null?    Type
 ------------------------------ -------- ------------
 PROF_NAME                      NOT NULL VARCHAR2(10)
 SPECIALTY                      NOT NULL VARCHAR2(20)
 HIRE_DATE                      NOT NULL DATE
 SALARY                         NOT NULL NUMBER(7,2)
 TENURE                         NOT NULL VARCHAR2(3)
 DEPARTMENT                     NOT NULL VARCHAR2(10)
 
*/

REM DECLARACION DE LA TABLA PROFESSORS, SUS DATOS Y SUS RESTRICCIONES.

drop table professors;
create table professors (
 PROF_NAME    VARCHAR2(10),
 SPECIALTY    VARCHAR2(20),
 HIRE_DATE    DATE,
 SALARY       NUMBER(7,2),
 TENURE       VARCHAR2(3),
 DEPARTMENT   VARCHAR2(10));
 
 INSERT INTO PROFESSORS values ('Blake', 'Mathematics',to_date('07-07-03','DD-MM-YY'),1000,'YES','MATH');
 INSERT INTO PROFESSORS values ('Milton', 'Am History',to_date('07-07-02','DD-MM-YY'),1000,'YES','HIST');
 INSERT INTO PROFESSORS values ('Wilson', 'English',to_date('08-07-01','DD-MM-YY'),1000,'YES','ENGL');
 INSERT INTO PROFESSORS values ('Jones', 'Euro Hist',to_date('05-08-00','DD-MM-YY'),1000,'YES','MATH');
 INSERT INTO PROFESSORS values ('Crump', 'Ancient Hist',to_date('04-08-99','DD-MM-YY'),1000,'YES','MATH');
 
ALTER TABLE professors
    ADD CONSTRAINT ck_professors_department
    CHECK (department IN
('MATH','HIST','ENGL','SCIE'));

ALTER TABLE professors
    ADD CONSTRAINT ck_professors_tenure
    CHECK (tenure IN ('YES','NO'));

ALTER TABLE professors
    ADD CONSTRAINT ck_professors_salary
    CHECK (salary < 30000);

CREATE OR REPLACE TRIGGER professors_bir
BEFORE INSERT ON professors
FOR EACH ROW
DECLARE
    msg VARCHAR2(100) :=
        'The salary exceeds the ENGL maximum of $10,000.00';
BEGIN
    -- --------------------------------------
    -- OVERRIDE COLUMN RULES
    -- --------------------------------------

    -- truncate hours, minutes, seconds of hire date
    :NEW.hire_date := TRUNC(:NEW.hire_date);

    -- round salary
    :NEW.salary := ROUND(:NEW.salary);

    -- convert department to upper case
    :NEW.department := UPPER(:NEW.department);
    -- --------------------------------------
    -- REJECT TRANSACTION RULES
    -- --------------------------------------
    IF :NEW.department='ENGL' AND :NEW.salary > 10000 THEN
        RAISE_APPLICATION_ERROR(-20000,msg);
    END IF;

    -- --------------------------------------
    -- TAKE ACTION RULES
    -- --------------------------------------
    dbms_output.put_line
       ('Before Insert Row Trigger Action');
END;
.
/

rem 6.6.3 Before versus After

CREATE OR REPLACE TRIGGER professors_bir
BEFORE INSERT ON professors
FOR EACH ROW
BEGIN
    :NEW.hire_date := TRUNC(:NEW.hire_date);
    :NEW.salary := ROUND(:NEW.salary);
    :NEW.department := UPPER(:NEW.department);
END;
.
/


CREATE OR REPLACE TRIGGER professors_bir
BEFORE INSERT ON professors
FOR EACH ROW
BEGIN
    :NEW.hire_date := TRUNC(:NEW.hire_date);
    :NEW.salary := ROUND(:NEW.salary);
    :NEW.department := UPPER(:NEW.department);
END;
.
/


CREATE OR REPLACE TRIGGER professors_air
AFTER INSERT ON professors
FOR EACH ROW
DECLARE
    msg VARCHAR2(100) :=
        'The salary exceeds the ENGL maximum of'|| $10,000.00';
BEGIN
    IF :NEW.department='ENGL' AND :NEW.salary > 10000 THEN
        RAISE_APPLICATION_ERROR(-20000,msg);
    END IF;
    dbms_output.put_line
       ('Before Insert Row Trigger Action');
END;
.
/

REM 6.6.4 Using Packages for Procedural Constraints
CREATE OR REPLACE PACKAGE professors_cons IS

    FUNCTION salary(sal professors.salary%TYPE)
        RETURN professors.salary%TYPE;

    FUNCTION hire_date(hd professors.hire_date%TYPE)
        RETURN professors.hire_date%TYPE;

    FUNCTION department(dept professors.department%TYPE)
        RETURN professors.department%TYPE;

    PROCEDURE validate_salary
        (dept professors.department%TYPE,
         sal professors.salary%TYPE);

    PROCEDURE print_action;

END professors_cons;
.
/

CREATE OR REPLACE TRIGGER professors_bir
BEFORE INSERT ON professors
FOR EACH ROW
BEGIN
    :NEW.hire_date :=
            professors_cons.hire_date(:NEW.hire_date);
    :NEW.salary :=
            professors_cons.salary(:NEW.salary);
    :NEW.department :=
            professors_cons.department(:NEW.department);
END;
.
/

REM   The AFTER-INSERT trigger is two procedure calls.



CREATE OR REPLACE TRIGGER professors_air
AFTER INSERT ON professors
FOR EACH ROW
BEGIN
    professors_cons.validate_salary
            (:NEW.department, :NEW.salary);
    professors_cons.print_action;
END;
.
/

REM
REM
CREATE OR REPLACE PACKAGE BODY professors_cons IS

    FUNCTION salary(sal professors.salary%TYPE)
        RETURN professors.salary%TYPE IS
    BEGIN
        RETURN ROUND(sal);
    END salary;

    FUNCTION hire_date(hd professors.hire_date%TYPE)
        RETURN professors.hire_date%TYPE IS
    BEGIN
        RETURN TRUNC(hd);
    END hire_date;

    FUNCTION department(dept professors.department%TYPE)
        RETURN professors.department%TYPE IS
    BEGIN
        RETURN UPPER(dept);
    END department;

    PROCEDURE validate_salary
        (dept professors.department%TYPE,
         sal professors.salary%TYPE)
    IS
        msg VARCHAR2(100) :=
         'The salary exceeds the ENGL maximum of $10,000.00';
    BEGIN
        IF dept ='ENGL' AND sal  > 10000 THEN
            RAISE_APPLICATION_ERROR(-20000,msg);
        END IF;
    END validate_salary;

    PROCEDURE print_action IS
    BEGIN
        dbms_output.put_line
            ('Before Insert Row Trigger Action');
    END print_action;
END professors_cons;
.
/

SPOOL OFF;




 
