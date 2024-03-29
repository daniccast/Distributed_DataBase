spool C:\Users\ozkr_\OneDrive\Documentos\Github\Distributed_DataBase\Ejercicios\Parcial2\PL-SQLbyExample\Chapter12\salida\ejercicio3chapter12.txt
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
Escriba un bloque PL / SQL con dos cursores para bucles. El cursor principal llamará a student_id, first_name y last_name de la tabla de estudiantes
para estudiantes con un student_id menor que 110 y generará una línea con esta información. Para cada alumno, el cursor secundario recorrerá todos los 
cursos en los que está inscrito el alumno, dando salida a course_no y la descripción.
*/

--(ROSENZWEIG &  RAKHIMOV, 2009, 249)
DECLARE
    v_sid student.student_id%TYPE;
    CURSOR c_student IS
        SELECT student_id, first_name, last_name
        FROM student
        WHERE student_id < 110;
    CURSOR c_course IS
        SELECT c.course_no, c.description
        FROM course c, section s, enrollment e
        WHERE c.course_no = s.course_no
        AND s.section_id = e.section_id
        AND e.student_id = v_sid;
BEGIN
    FOR r_student IN c_student
    LOOP
        v_sid := r_student.student_id;
        DBMS_OUTPUT.PUT_LINE(chr(10));
        DBMS_OUTPUT.PUT_LINE(' The Student '||
        r_student.student_id||' '||
        r_student.first_name||' '||
        r_student.last_name);
        DBMS_OUTPUT.PUT_LINE(' is enrolled in the '||
        'following courses: ');
        FOR r_course IN c_course
    LOOP
        DBMS_OUTPUT.PUT_LINE(r_course.course_no||
        ' '||r_course.description);
        END LOOP;
    END LOOP;
END;
.
/

/*
como podemos ver el script nos muestra los estudiante con un Id menor que 110 asi como su nombre y los cursos en los que esta ioncrito, 
esto gracias dos cursores, ahora bien si quisieramos usar estos mismos dos cursores sin, pero con ciclos sin anidar, parta mostrar el monto
que recuda cada instructor, nos quedaria de la siguiente manera 
*/



DECLARE
v_amount course.cost%TYPE;
v_instructor_id instructor.instructor_id%TYPE;
CURSOR c_inst IS
    SELECT first_name, last_name, instructor_id
    FROM instructor;
CURSOR c_cost IS
    SELECT c.cost
    FROM course c, section s, enrollment e
    WHERE s.instructor_id = v_instructor_id
    AND c.course_no = s.course_no
    AND s.section_id = e.section_id;
BEGIN
    FOR r_inst IN c_inst
    LOOP
        v_instructor_id := r_inst.instructor_id;
        v_amount := 0;
        DBMS_OUTPUT.PUT_LINE(
        'Amount generated by instructor '||
        r_inst.first_name||' '||r_inst.last_name
        ||' is');
        FOR r_cost IN c_cost
    LOOP
        v_amount := v_amount + NVL(r_cost.cost, 0);
    END LOOP;
        DBMS_OUTPUT.PUT_LINE
        (' '||TO_CHAR(v_amount,'$999,999'));
    END LOOP;
END;
.
/

spool off; 