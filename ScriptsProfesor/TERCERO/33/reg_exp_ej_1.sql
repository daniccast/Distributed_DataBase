SPOOL C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\TERCERO\33\REG_EXP.TXT

set pagesize 99
set linesize 130
set colsep '|=|'
set feedback on
SET SQLN ON 

SELECT zip 
 FROM zipcode_example 
 WHERE REGEXP_LIKE(zip, '[^[:digit:]]');
---

 select 'ab123' from dual
 where REGEXP_LIKE('ab123', '[^[:digit:]]');
 
 rem ejercicio 1.
drop table temporal8; 
create table temporal8(
 cadena varchar2(10));
 
insert into temporal8 values ('ab123');
insert into temporal8 values ('123xy');
insert into temporal8 values ('007ab');
insert into temporal8 values ('abcxy');

select cadena from temporal8
 where REGEXP_LIKE(cadena, '[^[:digit:]]');
 
select cadena from temporal8;

DELETE
FROM
    temporal8;

select cadena from temporal8;
--- ----------------------------

 rem ejercicio 2.

/*
----
rem no funciona


select cadena,REGEXP_LIKE(cadena, '[^[:digit:]]') from temporal8;
 where REGEXP_LIKE(cadena, '[^[:digit:]]');

-----------------
*/

---
 rem ejercicio 2.

insert into temporal8 values ('at');
insert into temporal8 values ('bet');
insert into temporal8 values ('cot');
insert into temporal8 values ('def');

select cadena from temporal8
 where REGEXP_LIKE(cadena, '[abc]');
 rem despleguemos los que no cumplen
 
 select cadena from temporal8
 minus 
 select cadena from temporal8
 where REGEXP_LIKE(cadena, '[abc]');
 
DELETE
FROM
    temporal8;

select cadena from temporal8;

---
 rem ejercicio 3.
 
insert into temporal8 values ('abc');
insert into temporal8 values ('adc');
insert into temporal8 values ('a1c');
insert into temporal8 values ('a#c');
rem el que no cumple 
insert into temporal8 values ('abb');

rem despleguemos los que cumplen

select cadena from temporal8
 where REGEXP_LIKE(cadena, '[a.c]');
 rem despleguemos los que no cumplen
 
 select cadena from temporal8
 minus 
 select cadena from temporal8
 where REGEXP_LIKE(cadena, '[a.c]');
 
 DELETE
FROM
    temporal8;
 
 select cadena from temporal8;
-- ------------------

 rem ejercicio 4.
 
 One or More--Plus
a+

insert into temporal8 values ('a');
insert into temporal8 values ('aa');
insert into temporal8 values ('aaa');
rem The expression does not match:
insert into temporal8 values ('bbb');

select cadena from temporal8
 where REGEXP_LIKE(cadena, '[a+]');
 
 rem despleguemos los que no cumplen
  select cadena from temporal8
 minus 
 select cadena from temporal8
 where REGEXP_LIKE(cadena, '[a+]');
 
  DELETE
FROM
    temporal8;
 
 select cadena from temporal8;
 
 -- ------------
 rem ejercicio 5
 rem Zero or One--Question Mark Operator
rem  ab?c
/*
This expression matches:
abc
ac
rem The expression does not match:
adc
abbc
*/
 
 insert into temporal8 values ('abc');
insert into temporal8 values ('ac');
insert into temporal8 values ('aaa');
rem The expression does not match:
insert into temporal8 values ('bdc');
insert into temporal8 values ('abbc');

rem despleguemos todas las tuplas 
select cadena from temporal8;

rem  las tuplas que cumplen el patron
select cadena from temporal8
 where REGEXP_LIKE(cadena, 'ab?c');
 
rem solo las que no cumplen 
  select cadena from temporal8
 minus 
 select cadena from temporal8
 where REGEXP_LIKE(cadena, 'ab?c');
 
 rem borramos la tabla

  DELETE
FROM
    temporal8;
 
 select cadena from temporal8;
 
 -----------
rem ejercicio 6
 
rem Zero or More--Star
rem ab*c

ac
abc
abbc
abbbbc


insert into temporal8 values ('ac');
insert into temporal8 values ('abc');
insert into temporal8 values ('abbc');
insert into temporal8 values ('abbbc');
insert into temporal8 values ('abbbbc');

rem rem The expression does not match:

insert into temporal8 values ('adc');
insert into temporal8 values ('aec');

rem despleguemos todas las tuplas 
select cadena from temporal8;

rem  las tuplas que cumplen el patron
select cadena from temporal8
 where REGEXP_LIKE(cadena, 'ab*c');
 
rem solo las que no cumplen 
  select cadena from temporal8
 minus 
 select cadena from temporal8
 where REGEXP_LIKE(cadena, 'ab*c');
 
   DELETE
FROM
    temporal8;
 
 select cadena from temporal8;
 
 ---
 rem ejercicio 7
 
 rem Interval--Exact Count
rem The exact-count interval 
rem  operator is specified 
rem  with a single digit enclosed in braces
rem  a{5}
insert into temporal8 values ('aaaaa');
insert into temporal8 values ('aaaaab');
insert into temporal8 values ('caaaaa');
insert into temporal8 values ('deaaaaabbbc');
insert into temporal8 values ('aaaaaggg');
rem  The expression does not match:

insert into temporal8 values ('aaaa');
insert into temporal8 values ('aaaggg');
insert into temporal8 values ('aaa');

rem despleguemos todas las tuplas 
select cadena from temporal8;

rem  las tuplas que cumplen el patron
select cadena from temporal8
 where REGEXP_LIKE(cadena, 'a{5}');
 
rem solo las que no cumplen 
  select cadena from temporal8
 minus 
 select cadena from temporal8
 where REGEXP_LIKE(cadena, 'a{5}');

   DELETE
FROM
    temporal8;
 
 select cadena from temporal8;
 
  ---
 rem ejercicio 8
 rem Interval--At Least Count
rem   a{3,}

insert into temporal8 values ('aaaaa');
insert into temporal8 values ('aaaaab');
insert into temporal8 values ('caaa');
insert into temporal8 values ('deaaaaabbbc');
insert into temporal8 values ('aaaaaggg');
rem  The expression does not match:

insert into temporal8 values ('aa');
insert into temporal8 values ('ddaggg');
insert into temporal8 values ('daa');

rem despleguemos todas las tuplas 
select cadena from temporal8;

rem  las tuplas que cumplen el patron
select cadena from temporal8
 where REGEXP_LIKE(cadena, 'a{3,}');
 
rem solo las que no cumplen 
  select cadena from temporal8
 minus 
 select cadena from temporal8
 where REGEXP_LIKE(cadena, 'a{3,}');

   DELETE
FROM
    temporal8;
 
 select cadena from temporal8;

---
rem ejercicio 9 

rem Interval--Between Count
rem a{3,5}

insert into temporal8 values ('aaaaa');
insert into temporal8 values ('aaaaab');
insert into temporal8 values ('caaa');
insert into temporal8 values ('deaaaaabbbc');
insert into temporal8 values ('aaaaaggg');
rem  The expression does not match:

insert into temporal8 values ('aa');
insert into temporal8 values ('ddaggg');
insert into temporal8 values ('daa');

rem despleguemos todas las tuplas 
select cadena from temporal8;

rem  las tuplas que cumplen el patron
select cadena from temporal8
 where REGEXP_LIKE(cadena, 'a{3,5}');
 
rem solo las que no cumplen 
  select cadena from temporal8
 minus 
 select cadena from temporal8
 where REGEXP_LIKE(cadena, 'a{3,5}');

   DELETE
FROM
    temporal8;
 
 select cadena from temporal8;
 
 ---
 /*
The following regular expression operators are allowed within the character list, any other metacharacters included in a character list lose their special meaning (are treated as literals):

Range operator '-'
POSIX character class [::]
POSIX collating sequence [. .]
POSIX character equivalence class [= =]



*/
----
rem ejercicio 10


SPOOL OFF;

 
 
 