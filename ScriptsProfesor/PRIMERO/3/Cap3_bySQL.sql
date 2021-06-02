spool C:\Users\lolol_000\Documents\Distributed_DataBase\ScriptsProfesor\PRIMERO\3\Cap3_bySQL.txt

rem EJERCICIOS CAP 3.3

SELECT 60+60+NULL
FROM dual;

SELECT 60+60+NVL(NULL, 1000)
FROM dual;

SELECT course_no, description,
NVL(prerequisite, 99999) prereq
FROM course
WHERE course_no IN (10, 20, 100,310,146);

SELECT course_no, description,
NVL(TO_CHAR(prerequisite), 'Not Applicable') prereq
FROM course
WHERE course_no IN (20, 100,10,100,310,149)

SELECT course_no, description,
NVL(TO_CHAR(prerequisite), 'Sin requisitos') prereq
FROM course
WHERE course_no IN (20, 100,10,100,310,149)

rem FORMATO DE COLUMNAS Y LINEAS

set pagesize 99;
set linesize 130;
set colsep '|=|'
set underline =
col curse_no format 9999
set description format a25
set prerequisite format 9999
set cost format 9,999
SELECT course_no, description,
prerequisite,cost
FROM course;

rem COALESCE Pag 202

SELECT student_id, midterm_grade, finalexam_grade, quiz_grade,
COALESCE(midterm_grade, finalexam_grade, quiz_grade) "Coalesce"
FROM grade_summary;

rem CASE pag 206

SELECT course_no, description,cost,
CASE WHEN cost <1195 THEN 500
ELSE cost
END "Test CASE"
FROM course
WHERE course_no IN (80, 20, 135, 450)
ORDER BY 2

rem CASE ejercicio2 pag 207
SELECT course_no, cost,
CASE WHEN cost <1100 THEN 1000
WHEN cost >=1100 AND cost <1500 THEN cost*1.1
WHEN cost IS NULL THEN 0
ELSE cost
END "Test CASE"
FROM course
WHERE course_no IN (80, 20, 135, 450)
ORDER BY 2;

NOTA: REVISAR..!!!!!!!!!!!!!!!
SELECT course_no, cost,
CASE WHEN cost <1100 THEN 1000
WHEN cost >=1100 AND cost <1500 THEN cost*1.1
WHEN cost is NULL THEN NVL(TO_CHAR(cost), 'GRATIS')
ELSE cost
END "Test CASE"
FROM course
WHERE course_no IN (80, 20, 135, 450)
ORDER BY 2;

rem Ejer3 pag 208 FUNCIONA, PERO NO SABEMOS COMO, REVISAR
SELECT DISTINCT capacity, location
FROM section
WHERE capacity*CASE
WHEN SUBSTR(location, 1,1)='L' THEN 2
WHEN SUBSTR(location, 1,1)='M' THEN 1.5
ELSE NULL
END > 30;

SELECT DISTINCT capacity, location
FROM section;

SELECT DISTINCT capacity, location
FROM section ORDER BY 1;

SELECT DISTINCT capacity, location
FROM section
WHERE capacity*CASE
WHEN SUBSTR(location, 1,1)='L' THEN 2
WHEN SUBSTR(location, 1,1)='M' THEN 1.5
ELSE NULL
END > 30;

rem EJER4 PAG 208
SELECT section_id, capacity,
CASE WHEN capacity >=15 THEN TO_CHAR(capacity)
WHEN capacity < 15 THEN 'Room too small'
END AS "Capacity"
FROM section
WHERE section_id IN (101, 146, 147);

rem Simple Case PAG 209
SELECT course_no, cost,
CASE cost WHEN 1095 THEN cost/2
WHEN 1195 THEN cost*1.1
WHEN 1595 THEN cost
ELSE cost*0.5
END "Simple CASE"
FROM course
WHERE course_no IN (80, 20, 135, 450)
ORDER BY 2;

rem EJER5 PAG 213 
SELECT first_name||' '|| last_name name,
phone oldphone,
NVL(phone, '212-555-1212') newphone
FROM student
WHERE phone IS NULL;

SELECT first_name||' '|| last_name name,
phone oldphone
FROM student
WHERE phone IS NULL
or rownum < 15;

rem EJERCIO 6 PAG 213
SELECT first_name||' '|| last_name name,
phone oldphone,
COALESCE(phone, '212-555-1212') newphone
FROM student
WHERE COALESCE(phone, 'NONE') ='NONE';

rem EJER8 PAG 215
SELECT course_no, description, prerequisite "ORIGINAL",
CASE WHEN prerequisite = 120 THEN '200'
WHEN prerequisite = 130 THEN 'N/A'
WHEN prerequisite IS NULL THEN 'None'
ELSE TO_CHAR(prerequisite)
END "NEW"
FROM course
WHERE course_no IN (20, 120, 122, 132)
ORDER BY course_no DESC;

rem pag 217 EJER 9
SELECT student_id, zip, phone,
DECODE(SUBSTR(phone, 1, 3), '212',
DECODE(zip, '10048', 'North Campus',
'West Campus'),
'Off Campus') loc
FROM student
WHERE student_id IN (150, 145, 325)


spool off

