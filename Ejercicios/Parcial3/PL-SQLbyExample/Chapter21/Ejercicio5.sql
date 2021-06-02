spool C:\Users\lolol_000\Documents\Distributed_DataBase\Ejercicios\Parcial3\PL-SQLbyExample\Chapter21\salida\ejercicio5chapter21.txt
/*
rem **********************************************************
rem * Distributed DataBase, ESCOM. Ciclo 2021-2              * 
rem * Elaborado por:                                         *
rem * Cortés Castilllo Daniela y Mendoza Cuellar José Oscar  *                 
rem * Realizado el 9 de Junio  de 2021                       *
rem * ROSENZWEIG,B &  RAKHIMOV,E (2009).                     *
rem *Oracle® PL/SQLby Example,Boston,MA,USA:Perarson.      *
rem **********************************************************
*/


set colsep '|='
set describe linenum on
SET PAGESIZE 99;
SET LINESIZE 150
alter session set NLS_DATE_FORMAT = 'DD-MON-YYYY';
alter session set NLS_DATE_LANGUAGE = 'ENGLISH';
SET SERVEROUTPUT ON;


-- Create a new package specification called manage_grades. This package will perform a
--number of calculations on grades and will need two package level cursors. The first one is for
--grade types and will be called c_grade_type. It will have an IN parameter of a section ID. It
--will list all the grade types (such as quiz or homework) for a given section that are needed to
--calculate a student’s grade in that section. The return items from the cursor will be the grade type
--code, the number of that grade type for this section, the percentage of the final grade, and the
--drop-lowest indicator. First, write a SELECT statement to make sure that you have the correct
--items, and then write this as a cursor in the package.

-- (ROSENZWEIG y RAKHIMOV, 2009, 481).

-- ch21_11a.sql
CREATE OR REPLACE PACKAGE MANAGE_GRADES AS
	-- Cursor to loop through all grade types for a given section.
	CURSOR c_grade_type
		(pc_section_id section.section_id%TYPE,
		PC_student_ID student.student_id%TYPE)
	IS
		SELECT GRADE_TYPE_CODE,NUMBER_PER_SECTION,PERCENT_OF_FINAL_GRADE, DROP_LOWEST
			FROM grade_Type_weight
			WHERE section_id = pc_section_id
			AND section_id IN (SELECT section_id
				FROM grade
				WHERE student_id = pc_student_id);
END MANAGE_GRADES;
.
/

-- ch21_11b.sql
CREATE OR REPLACE PACKAGE MANAGE_GRADES AS
	-- Cursor to loop through all grade types for a given section.
	CURSOR c_grade_type
		(pc_section_id section.section_id%TYPE,
		PC_student_ID student.student_id%TYPE)
	IS
		SELECT GRADE_TYPE_CODE,
			NUMBER_PER_SECTION,
			PERCENT_OF_FINAL_GRADE,
			DROP_LOWEST
			FROM grade_Type_weight
			WHERE section_id = pc_section_id
			AND section_id IN (SELECT section_id
						FROM grade
						WHERE student_id = pc_student_id);
	-- Cursor to loop through all grades for a given student
	-- in a given section.
	CURSOR c_grades
		(p_grade_type_code
		grade_Type_weight.grade_type_code%TYPE,
		pc_student_id student.student_id%TYPE,
		pc_section_id section.section_id%TYPE) 
	IS
		SELECT grade_type_code,grade_code_occurrence,
		numeric_grade
			FROM grade
			WHERE student_id = pc_student_id
			AND section_id = pc_section_id
			AND grade_type_code = p_grade_type_code;
END MANAGE_GRADES;
.
/



spool OFF;
