spool C:\Users\ORA_bases\2021_02_24_clase_2\salida\cifras_11.txt
rem cifras de control 
select 'Total tuplas entidad COURSE' COURSE, count (*) TUPLAS
	from course;
select 'Total tuplas entidad ENROLLMENT' ENROLLMENT, count (*) TUPLAS
	from ENROLLMENT;
select 'Total tuplas entidad GRADE' GRADE, Count (*) TUPLAS
	from GRADE;
select 'Total tuplas entidad GRADE_CONVERSION' GRADE_CONVERSION, count (*) TUPLAS
	from GRADE_CONVERSION;
select 'Total tuplas entidad GRADE_TYPE' GRADE_TYPE, count (*) TUPLAS
	from GRADE_TYPE;
select 'Total tuplas entidad GRADE_TYPE_WEIGHT' GRADE_TYPE_WEIGHT, count (*) TUPLAS
	from GRADE_TYPE_WEIGHT;
select 'Total tuplas entidad INSTRUCTOR' INSTRUCTOR, count (*) TUPLAS
	from INSTRUCTOR;
select 'Total tuplas entidad SECTION' SECTION, count (*) TUPLAS
	from SECTION;
select 'Total tuplas entidad STUDENT' STUDENT, count (*) TUPLAS
	from STUDENT;
select 'Total tuplas entidad ZIPCODE' ZIPCODE, count (*) TUPLAS
	from ZIPCODE;
spool off