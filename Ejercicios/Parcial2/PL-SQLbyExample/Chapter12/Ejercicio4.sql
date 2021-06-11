spool C:\Users\ozkr_\OneDrive\Documentos\Github\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter12\salida\ejercicio4chapter12.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cort�s Castilllo Daniela y Mendoza Cuellar Jos� Oscar  *                 
rem * Realizado el 2 de mayo  de 2021                        *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                     *
rem *Oracle� PL/SQL�by Example,Boston,MA,USA:Perarson.      *
rem **********************************************************
*/

set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';
SET SERVEROUTPUT ON;

/*
En este script se actualizaron las calificaciones del curso 135 a 90, haciendo uso de los cursores 
*/

-- ch12_3a.sql (ROSENZWEIG &  RAKHIMOV, 2009, 259 )
DECLARE
CURSOR c_grade(
    i_student_id IN enrollment.student_id%TYPE,
    i_section_id IN enrollment.section_id%TYPE)
    IS
    SELECT final_grade
    FROM enrollment
    WHERE student_id = i_student_id
    AND section_id = i_section_id
    FOR UPDATE;
    CURSOR c_enrollment IS
        SELECT e.student_id, e.section_id
        FROM enrollment e, section s
        WHERE s.course_no = 135
        AND e.section_id = s.section_id;
BEGIN
    FOR r_enroll IN c_enrollment
    LOOP
        FOR r_grade IN c_grade(r_enroll.student_id,
        r_enroll.section_id)
        LOOP
            UPDATE enrollment
            SET final_grade = 90
            WHERE student_id = r_enroll.student_id
            AND section_id = r_enroll.section_id;
        END LOOP;
    END LOOP;
END;
.
/

SELECT student_id, course_no,final_grade
FROM enrollment, section
WHERE final_grade =90
AND course_no=135
ORDER BY final_grade;

/*
    Si quisieraos modificar la calificaion solo de unos alumnos deberiamos hacer lo siguiente
*/

DECLARE
CURSOR c_grade(
    i_student_id IN enrollment.student_id%TYPE,
    i_section_id IN enrollment.section_id%TYPE)
    IS
    SELECT final_grade
    FROM enrollment
    WHERE student_id = i_student_id
    AND section_id = i_section_id
    FOR UPDATE;
    CURSOR c_enrollment IS
        SELECT e.student_id, e.section_id
        FROM enrollment e, section s
        WHERE s.course_no = 135
        AND e.section_id = s.section_id;
BEGIN
    
   FOR r_enroll IN c_enrollment
    LOOP
        FOR r_grade IN c_grade(r_enroll.student_id,
        r_enroll.section_id)
        LOOP
            UPDATE enrollment
            SET final_grade = 100
            WHERE student_id = 129
            
        END LOOP;
    END LOOP;

END;
.
/


spool OFF;