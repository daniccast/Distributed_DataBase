spool C:\Users\ORA_bases\2021_02_24_clase_2\salida\cap_3.txt
rem pag 166
SELECT state, LOWER(state), LOWER('State')
 FROM zipcode
 where rownum <= 15;
rem pag 167 
 SELECT city,UPPER(city) CITY , state, INITCAP(state)
 FROM zipcode
 WHERE zip = '10035';
 
 REM PAG 169
 SELECT RPAD(city, 20, '*') "City Name",
 LPAD(state, 10, '-') "State Name"
 FROM zipcode 
 WHERE ROWNUM <= 15;
 
  SELECT RPAD(city, 20, '*_') "City Name",
 LPAD(state, 10, '->') "State Name"
 FROM zipcode 
 WHERE ROWNUM <= 15;
 
 REM PAG 167
 COL "City Name" FORMAT A55
 COL "State Name" FORMAT A30
  SELECT RPAD(city, 40, '*_') "City Name",
 LPAD(state, 20, '->') "State Name"
 FROM zipcode 
 WHERE ROWNUM <= 15;
 
 REM PAG 169
 SELECT LTRIM('0001234500', '0') left,
		RTRIM('0001234500', '0') right,
		LTRIM(RTRIM('0001234500', '0'), '0') both
 FROM dual ;
 
  SELECT LTRIM('00000000001234500', '0') left,
		RTRIM('000123450000000000', '0') right,
		LTRIM(RTRIM('0001234500', '0'), '0') both
 FROM dual ;
 
   SELECT LTRIM('0007700000001234500', '0') left,
		RTRIM('00012345000000077000', '0') right,
		LTRIM(RTRIM('0001234500', '0'), '0') both
 FROM dual ;
 
 REM PAG 
 COL LNAME1 FORMAT A20
 COL LNAME2 ForMAT A25
 SELECT last_name,
		SUBSTR(last_name, 1, 5) LNAME1,
		SUBSTR(last_name, 6)  LNAME2
	FROM student 
	WHERE ROWNUM <= 15;
	
 COL LNAME1 FORMAT A20
 COL LNAME2 ForMAT A25
 SELECT last_name,
		SUBSTR(last_name, 2, 5) LNAME1,
		SUBSTR(last_name, 6)  LNAME2
	FROM student 
	WHERE ROWNUM <= 15;
remarks pag 171
SELECT description, INSTR(description, 'er') subcadena
 FROM course; 
spool off
